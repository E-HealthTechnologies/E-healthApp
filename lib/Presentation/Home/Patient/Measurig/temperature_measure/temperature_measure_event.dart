import 'package:equatable/equatable.dart';

abstract class TemperatureMeasureEvent extends Equatable {}

//ignore: must_be_immutable
class SendTemperatureMeasureRequest extends TemperatureMeasureEvent {
  @override
  List<Object> get props => [];
}

class DeviceCOnnectionFailed extends TemperatureMeasureEvent {
  @override
  List<Object> get props => [];
}

class DeviceConnectionSucceed extends TemperatureMeasureEvent {
  @override
  List<Object> get props => [];
}
