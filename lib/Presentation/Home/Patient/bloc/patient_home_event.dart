part of 'patient_home_bloc.dart';

@immutable
abstract class PatHomeEvent extends Equatable {
  const PatHomeEvent();

  @override
  List<Object?> get props => [];
}

class PatCreateEvent extends PatHomeEvent {
  PatCreateEvent({required this.page});
  int page;
  // final String uid;
  @override
  List<Object?> get props => [];
}

class ChangeEvent extends PatHomeEvent {
  ChangeEvent({required this.string});
  String string;
  // final String uid;
  @override
  List<Object?> get props => [];
}