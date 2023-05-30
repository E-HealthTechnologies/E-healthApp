import 'package:e_health/Presentation/Home/Models/device_respence.dart';
import 'package:equatable/equatable.dart';

abstract class HeartBeatMeasureState extends Equatable {}

class WaitingHeartBeatMeasureRespence extends HeartBeatMeasureState {
  @override
  List<Object> get props => [];
}

class LoadingPage extends HeartBeatMeasureState {
  @override
  List<Object> get props => [];
}

class DeviceNotConnected extends HeartBeatMeasureState {
  @override
  List<Object> get props => [];
}

class DeviceConnected extends HeartBeatMeasureState {
  @override
  List<Object> get props => [];
}

class DeviceFailedToConnected extends HeartBeatMeasureState {
  @override
  List<Object> get props => [];
}

class HeartBeatMeasureMeassureError extends HeartBeatMeasureState {
  @override
  List<Object> get props => [];
}

class HeartBeatMeasureConnectionError extends HeartBeatMeasureState {
  @override
  List<Object> get props => [];
}

class HeartBeatMeasureWaitingFinger extends HeartBeatMeasureState {
  @override
  List<Object> get props => [];
}

class HeartBeatMeasureStarted extends HeartBeatMeasureState {
  @override
  List<Object> get props => [];
}

class GotHeartBeatMeasureRespence extends HeartBeatMeasureState {
  final HeartBeatResult heartBeatResult;

  GotHeartBeatMeasureRespence(this.heartBeatResult);
  @override
  List<Object> get props => [heartBeatResult];
}
