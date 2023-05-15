import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_health/Presentation/Authentification/Commun/Models/Patient_data_model.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'pat_dash_board_event.dart';
part 'pat_dash_board_state.dart';

class PatDashBoardBloc extends Bloc<PatDashBoardEvent, PatDashBoardState> {
  PatDashBoardBloc() : super(PatDashBoardState(patient: PatientDataModel())) {
    on<GetPatientEvent>(_getPatientEvent);
  }

  FutureOr<void> _getPatientEvent(
      GetPatientEvent event, Emitter<PatDashBoardState> emit) async {
    emit(state.copyWith(status: DashBoardStatus.loadingPatient));
    PatientDataModel _patient = await getPatientData(uid: event.uid);
    emit(state.copyWith(
        patient: _patient, status: DashBoardStatus.loadingPatientSuccess));
  }
}
