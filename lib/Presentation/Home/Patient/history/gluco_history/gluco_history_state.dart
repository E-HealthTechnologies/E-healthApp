import 'package:e_health/Services/graph_service.dart';
import 'package:equatable/equatable.dart';

class GlucoHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GlucoFirstLoadState extends GlucoHistoryState {}

class GlucoLoadingState extends GlucoHistoryState {}

// List<Map<String, dynamic>> data;
class GlucoDataloadedState extends GlucoHistoryState {
  List<GlucoseTimedData> dataList;
  GlucoDataloadedState(this.dataList);
  @override
  List<Object?> get props => [this.dataList];
}
