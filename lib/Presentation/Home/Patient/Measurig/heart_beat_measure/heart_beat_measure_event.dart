import 'package:equatable/equatable.dart';

abstract class HeartBeatMeasureEvent extends Equatable {}

class SendHeartBeatMeasureRequest extends HeartBeatMeasureEvent {
  SendHeartBeatMeasureRequest({required this.uid});
  final String uid;
  @override
  List<Object> get props => [];
}

class DeviceCOnnectionFailed extends HeartBeatMeasureEvent {
  @override
  List<Object> get props => [];
}

class DeviceConnectionSucceed extends HeartBeatMeasureEvent {
  @override
  List<Object> get props => [];
}
