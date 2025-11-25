import 'package:qouraan_flutter/features/data/models/HadithModel.dart';

abstract class HadithState {}

class HadithInitial extends HadithState {}
class HadithLoading extends HadithState {}
class HadithSuccess extends HadithState {
  final HadithModel hadith;
  HadithSuccess(this.hadith);
}
class HadithFailure extends HadithState {
  final String message;
  HadithFailure(this.message);
}
