part of 'pat_measuring_bloc.dart';

enum Status {
  initial,
  loading,
  success,
  fail,
  finish,
  loadingDoctors,
}

@immutable
class PatMeasuringState extends Equatable {
  PatMeasuringState({
    this.status = Status.loading,
    this.data = const [],
    this.dataList = const [],
  });

  Status status;
  List<Map<String, dynamic>> data;
  List<SalesData> dataList;
  PatMeasuringState copyWith({
    Status? status,
    List<Map<String, dynamic>>? data,
    List<SalesData>? dataList,
  }) {
    return PatMeasuringState(
      status: status ?? this.status,
      data: data ?? this.data,
      dataList: dataList ?? this.dataList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
        dataList,
      ];
}
