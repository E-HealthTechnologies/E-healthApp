import 'package:equatable/equatable.dart';

abstract class HandshakeEvent extends Equatable {}

//ignore: must_be_immutable
class SendHandShake extends HandshakeEvent {
  @override
  List<Object> get props => [];
}
