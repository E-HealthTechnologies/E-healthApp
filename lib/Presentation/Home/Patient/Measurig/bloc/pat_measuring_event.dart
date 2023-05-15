part of 'pat_measuring_bloc.dart';

@immutable
abstract class PatMeasuringEvent extends Equatable {
  const PatMeasuringEvent();

  @override
  List<Object?> get props => [];
}

class GetDataEvent extends PatMeasuringEvent {
  GetDataEvent({required this.data , required this.dataList});
  final List<Map<String, dynamic>> data;
  final List<SalesData> dataList ;
  @override
  List<Object?> get props => [];
}

class UploadMeasurementEvent extends PatMeasuringEvent {
  UploadMeasurementEvent({required this.date , required this.value});
  // final List<Map<String, dynamic>> data;
  final DateTime date ;
  final String value ;
  // final List<SalesData> dataList ;
  @override
  List<Object?> get props => [];
}

class MeasureEvent extends PatMeasuringEvent {
  MeasureEvent();

  @override
  List<Object?> get props => [];
}