import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'patient_home_event.dart';
part 'patient_home_state.dart';

class PatHomeBloc extends Bloc<PatHomeEvent, PatHomeState> {
  PatHomeBloc() : super(PatHomeState()) {
    on<PatCreateEvent>(_patCreateEvent);
    on<ChangeEvent>(_changeEvent);

  }

  void _patCreateEvent(PatCreateEvent event, Emitter<PatHomeState> emit) async {

    emit(state.copyWith(page: event.page));
    log(state.page.toString(),name: 'from bloc');
  }

  void _changeEvent(ChangeEvent event, Emitter<PatHomeState> emit) {
    log(event.string,name: 'entered string');
    log(state.password,name: 'password before');
    emit(state.copyWith(password: event.string));
    log(state.password,name: 'password after');

  }
}
