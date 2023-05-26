import 'package:e_health/Presentation/Home/Models/data_enums.dart';
import 'package:equatable/equatable.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/history_graph.dart';

class BloodPressureHistoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BloodPressureLoadData extends BloodPressureHistoryEvent {
  String uid;
  SelectedView selectedView;
  DateTime? dateTime;
  BloodPressureLoadData(
      {required this.uid, this.dateTime, required this.selectedView});
  @override
  List<Object?> get props => [this.uid, this.selectedView, this.dateTime];
}
