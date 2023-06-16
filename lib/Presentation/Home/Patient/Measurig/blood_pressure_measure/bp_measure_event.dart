import 'package:equatable/equatable.dart';

abstract class BloodPressureMeasureEvent extends Equatable {}

//ignore: must_be_immutable
class SendBloodPressureMeasureRequest extends BloodPressureMeasureEvent {
  @override
  List<Object> get props => [];
}

class DeviceCOnnectionFailed extends BloodPressureMeasureEvent {
  @override
  List<Object> get props => [];
}

class DeviceConnectionSucceed extends BloodPressureMeasureEvent {
  @override
  List<Object> get props => [];
}
