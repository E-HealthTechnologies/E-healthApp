import 'package:e_health/Presentation/Home/Models/device_respence.dart';
import 'package:equatable/equatable.dart';

abstract class BloodPressureMeasureState extends Equatable {}

class WaitingBloodPressureMeasureRespence extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class LoadingPage extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class DeviceNotConnected extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class DeviceConnected extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class DeviceFailedToConnected extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class BloodPressureMeasureMeassureError extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class BloodPressureMeasureConnectionError extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class BloodPressureMeasureInf extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class BloodPressureMeasureDef extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class BloodPressureMeasureStartPump extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class BloodPressureMeasureInitDevice extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class BloodPressureMeasureTestState extends BloodPressureMeasureState {
  @override
  List<Object> get props => [];
}

class GotBloodPressureMeasureRespence extends BloodPressureMeasureState {
  final BloodPressureResult bloodPressureResult;

  GotBloodPressureMeasureRespence(this.bloodPressureResult);
  @override
  List<Object> get props => [bloodPressureResult];
}
