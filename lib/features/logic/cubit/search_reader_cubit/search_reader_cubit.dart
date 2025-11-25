import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qouraan_flutter/core/Network/model_date_salah.dart';
import 'package:qouraan_flutter/core/Network/widgets/services/LocationHelper.dart';
import 'package:qouraan_flutter/features/data/models/class_modeldate_sala.dart';
import 'package:qouraan_flutter/features/logic/cubit/search_reader_cubit/search_reader_states_cubit.dart';

class SearchReaderCubit extends Cubit <Datacity>{
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
      classModeldateSala = await ModelDateSalah(Dio()).getHttpByLocation(lat: lat, lon: lng,);

      emit(dataloding(classModeldateSala));

    } catch (e) {
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