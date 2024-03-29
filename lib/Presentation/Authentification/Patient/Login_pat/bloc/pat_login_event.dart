part of 'pat_login_bloc.dart';

@immutable
abstract class PatLoginEvent extends Equatable {
  const PatLoginEvent();

  @override
  List<Object?> get props => [];
}

class PatEmailEvent extends PatLoginEvent {
  //nothing
  PatEmailEvent({required this.email});

  final String email;
  @override
  List<Object?> get props => [];
}

class PatPasswordEvent extends PatLoginEvent {
  PatPasswordEvent({required this.password});

  final String password;
  @override
  List<Object?> get props => [];
}

class PatRememberMeEvent extends PatLoginEvent {
  PatRememberMeEvent({required this.remember});

  final bool? remember;
  @override
  List<Object?> get props => [];
}

class PatUidEvent extends PatLoginEvent {
  PatUidEvent({required this.uid});

  final String uid;
  @override
  List<Object?> get props => [];
}

class PatCreateEvent extends PatLoginEvent {
  PatCreateEvent();

  // final String uid;
  @override
  List<Object?> get props => [];
}