import 'package:equatable/equatable.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/widgets/gluco_graph.dart';

class GlucoMeasurmentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GlucoLoadData extends GlucoMeasurmentEvent {
  String uid;
  SelectedView selectedView;
  DateTime? dateTime;
  GlucoLoadData({required this.uid, this.dateTime, required this.selectedView});
  @override
  List<Object?> get props => [this.uid, this.selectedView, this.dateTime];
}
