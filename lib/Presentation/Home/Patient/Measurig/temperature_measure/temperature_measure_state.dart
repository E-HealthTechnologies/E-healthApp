import 'package:e_health/Presentation/Home/Models/device_respence.dart';
import 'package:equatable/equatable.dart';

abstract class TemperatureMeasureState extends Equatable {}

class WaitingTemperatureMeasureRespence extends TemperatureMeasureState {
  @override
  List<Object> get props => [];
}

class LoadingPage extends TemperatureMeasureState {
  @override
  List<Object> get props => [];
}

class DeviceNotConnected extends TemperatureMeasureState {
  @override
  List<Object> get props => [];
}

class DeviceConnected extends TemperatureMeasureState {
  @override
  List<Object> get props => [];
}

class DeviceFailedToConnected extends TemperatureMeasureState {
  @override
  List<Object> get props => [];
}

class TemperatureMeasureMeassureError extends TemperatureMeasureState {
  @override
  List<Object> get props => [];
}

class TemperatureMeasureConnectionError extends TemperatureMeasureState {
  @override
  List<Object> get props => [];
}

class TemperatureMeasureStarted extends TemperatureMeasureState {
  @override
  List<Object> get props => [];
}

class GotTemperatureMeasureRespence extends TemperatureMeasureState {
  final TemperatureResult temperatureResult;

  GotTemperatureMeasureRespence(this.temperatureResult);
  @override
  List<Object> get props => [temperatureResult];
}
