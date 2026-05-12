import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qouraan_flutter/core/Network/model_date_salah.dart';
import 'package:qouraan_flutter/core/Network/widgets/services/LocationHelper.dart';
import 'package:qouraan_flutter/features/data/models/class_modeldate_sala.dart';
import 'package:qouraan_flutter/features/logic/cubit/search_reader_cubit/search_reader_states_cubit.dart';
import 'package:qouraan_flutter/core/cache/shared_preferences_cache.dart';

class SearchReaderCubit extends Cubit<Datacity> {
  SearchReaderCubit() : super(initialState());

  late ClassModeldateSala classModeldateSala;

  String _toJsonString(ClassModeldateSala data) => jsonEncode(data.toJson());

  ClassModeldateSala _fromJsonString(String jsonString) =>
      ClassModeldateSala.fromJson(jsonDecode(jsonString));

  // ✅ دي أول دالة اللي لازم تتنادى عند فتح الشاشة
  Future<void> loadCachedData() async {
    final cached = SharedPreferencesCache.getdata(key: 'salahData');

    if (cached != null) {
      // ✅ عرض الكاش الأول فوراً
      classModeldateSala = _fromJsonString(cached);
      emit(dataloding(classModeldateSala));

      // ✅ حاول تحدّث من النت في الخلفية (بدون ما تمسح الكاش لو فشل)
      await _refreshFromNetwork();
    } else {
      // مفيش كاش خالص → اجلب من الـ API
      await GeTtimecity();
    }
  }

  // ✅ دالة تحديث صامتة من النت (مش بتمسح الداتا الحالية لو فشلت)
  Future<void> _refreshFromNetwork() async {
    try {
      final locationData = await LocationHelper.getLocation();
      if (locationData == null) return; // فشل اللوكيشن → سيب الكاش زي ما هو

      double lat = locationData.latitude!;
      double lng = locationData.longitude!;

      classModeldateSala =
          await ModelDateSalah(Dio()).getHttpByLocation(lat: lat, lon: lng);

      await SharedPreferencesCache.setdata(
        key: 'salahData',
        value: _toJsonString(classModeldateSala),
      );

      emit(dataloding(classModeldateSala)); // ✅ حدّث الـ UI بالداتا الجديدة
    } catch (e) {
      // ✅ فشل النت → مش بنعمل حاجة، الكاش اتعرض فعلاً قبل كده
    }
  }

  // دالة جلب الداتا من النت (لما مفيش كاش خالص)
  Future<void> GeTtimecity() async {
    emit(initialState()); // ✅ حالة loading مش initialState

    try {
      final locationData = await LocationHelper.getLocation();

      if (locationData == null) {
        // ✅ فشل اللوكيشن → اتحقق من الكاش قبل ما تعرض error
        _emitCachedOrFailure();
        return;
      }

      double lat = locationData.latitude!;
      double lng = locationData.longitude!;

      classModeldateSala =
          await ModelDateSalah(Dio()).getHttpByLocation(lat: lat, lon: lng);

      await SharedPreferencesCache.setdata(
        key: 'salahData',
        value: _toJsonString(classModeldateSala),
      );

      emit(dataloding(classModeldateSala));
    } catch (e) {
      // ✅ فشل النت → اتحقق من الكاش أولاً
      _emitCachedOrFailure();
    }
  }

  // ✅ دالة مساعدة: ارجع الكاش لو موجود، وإلا error
  void _emitCachedOrFailure() {
    final cached = SharedPreferencesCache.getdata(key: 'salahData');
    if (cached != null) {
      classModeldateSala = _fromJsonString(cached);
      emit(dataloding(classModeldateSala));
    } else {
      emit(falierdata());
    }
  }
}



/*
class SearchReaderCubit extends Cubit<Datacity> {
  SearchReaderCubit() : super(initialState());

  late ClassModeldateSala classModeldateSala;

  GeTtimecity() async {
    emit(initialState());

    try {
      // 1) هات اللوكيشن
      final locationData = await LocationHelper.getLocation();

      if (locationData == null) {
        emit(falierdata());
        return;
      }

      double lat = locationData.latitude!;
      double lng = locationData.longitude!;

      // 2) هات الداتا من API على حسب اللوكيشن
      classModeldateSala = await ModelDateSalah(Dio()).getHttpByLocation(
        latitude: lat,
        longitude: lng,
      );

      emit(dataloding(classModeldateSala));

    } catch (e) {
      emit(falierdata());
    }
  }
}

*/