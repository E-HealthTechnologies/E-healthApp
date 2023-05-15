part of 'pat_dash_board_bloc.dart';

enum DashBoardStatus {
  initial,
  loading,
  success,
  fail,
  finish,
  loadingPatient,
  loadingPatientSuccess,
  loadingPatientFail,
}

@immutable
class PatDashBoardState extends Equatable {
  PatDashBoardState({
    this.status = DashBoardStatus.loading,
    required this.patient,
  });

  DashBoardStatus status;
  PatientDataModel patient ;

  PatDashBoardState copyWith({
    DashBoardStatus? status,
    PatientDataModel? patient,
  }) {
    return PatDashBoardState(
      status: status ?? this.status,
      patient: patient ?? this.patient,
    );
  }

  @override
  List<Object?> get props => [status, patient];
}
