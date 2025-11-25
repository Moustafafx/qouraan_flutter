import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qouraan_flutter/core/Network/widgets/services/HadithService.dart';
import 'package:qouraan_flutter/features/data/models/HadithModel.dart';
import 'package:qouraan_flutter/features/logic/cubit/Hadith_cubit/Hadith_cubit_states.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithInitial());

  final HadithService service = HadithService();

  HadithModel? todayHadith;

  Future<void> fetchTodayHadith() async {
    emit(HadithLoading());

    try {
      final list = await service.getAhadith();

      int dayIndex = DateTime.now().day;
      int index = dayIndex % list.length;

      todayHadith = list[index];

      emit(HadithSuccess(todayHadith!));
    } catch (e) {
      emit(HadithFailure("Error loading hadith"));
    }
  }
}
