import 'package:equatable/equatable.dart';

abstract class HeartBeatMeasureEvent extends Equatable {}

//ignore: must_be_immutable
class SendHeartBeatMeasureRequest extends HeartBeatMeasureEvent {
  @override
  List<Object> get props => [];
}
