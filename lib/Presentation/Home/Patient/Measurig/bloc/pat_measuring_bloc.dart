import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/Screens/blood_pressure.dart';
import 'package:e_health/Services/graph_service.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'pat_measuring_event.dart';
part 'pat_measuring_state.dart';

class PatMeasuringBloc extends Bloc<PatMeasuringEvent, PatMeasuringState> {
  PatMeasuringBloc() : super(PatMeasuringState()) {
    on<GetDataEvent>(_getDataEvent);
  }

  FutureOr<void> _getDataEvent(
      GetDataEvent event, Emitter<PatMeasuringState> emit) {
    emit(state.copyWith(data: event.data, dataList: event.dataList));
  }
}
