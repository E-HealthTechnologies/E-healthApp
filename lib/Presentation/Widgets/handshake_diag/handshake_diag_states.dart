import 'package:equatable/equatable.dart';

abstract class HandshakeState extends Equatable {}

class WaitingHandshakeRespence extends HandshakeState {
  @override
  List<Object> get props => [];
}

class LoadingPage extends HandshakeState {
  @override
  List<Object> get props => [];
}

class HandshakeInitState extends HandshakeState {
  @override
  List<Object> get props => [];
}

class HandshakeNoDeviceFound extends HandshakeState {
  @override
  List<Object> get props => [];
}

class GotHandshakeRespence extends HandshakeState {
  GotHandshakeRespence();
  @override
  List<Object> get props => [];
}
