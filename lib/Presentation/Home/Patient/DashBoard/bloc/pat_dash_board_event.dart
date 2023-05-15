part of 'pat_dash_board_bloc.dart';

@immutable
abstract class PatDashBoardEvent extends Equatable {
  const PatDashBoardEvent();

  @override
  List<Object?> get props => [];
}

class GetPatientEvent extends PatDashBoardEvent {
  final String uid;
  GetPatientEvent({required this.uid});
}
