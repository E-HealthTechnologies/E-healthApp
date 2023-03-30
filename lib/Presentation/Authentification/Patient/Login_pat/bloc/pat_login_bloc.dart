import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'pat_login_event.dart';
part 'pat_login_state.dart';

class PatLoginBloc extends Bloc<PatLoginEvent, PatLoginState> {
  PatLoginBloc() : super(PatLoginState()) {
    on<PatEmailEvent>(_patEmailEvent);
    on<PatPasswordEvent>(_patPasswordEvent);
    on<PatRememberMeEvent>(_patRememberMeEvent);//nothing
  }

  FutureOr<void> _patEmailEvent(
      PatEmailEvent event, Emitter<PatLoginState> emit) {
    emit(state.copyWith(email: event.email));
    log(state.email);
  }

  FutureOr<void> _patPasswordEvent(
      PatPasswordEvent event, Emitter<PatLoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _patRememberMeEvent(
      PatRememberMeEvent event, Emitter<PatLoginState> emit) {
    emit(state.copyWith(rememberMe: event.remember));

  }
}
