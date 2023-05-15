import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_health/Services/AuthenticationServices.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'pat_login_event.dart';
part 'pat_login_state.dart';

class PatLoginBloc extends Bloc<PatLoginEvent, PatLoginState> {
  PatLoginBloc() : super(PatLoginState()) {
    on<PatEmailEvent>(_patEmailEvent);
    on<PatPasswordEvent>(_patPasswordEvent);
    on<PatRememberMeEvent>(_patRememberMeEvent);
    on<PatUidEvent>(_patUidEvent);
    on<PatCreateEvent>(_patCreateEvent);
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

  FutureOr<void> _patUidEvent(PatUidEvent event, Emitter<PatLoginState> emit) {
    emit(state.copyWith(uid: event.uid));
  }

  void _patCreateEvent(
      PatCreateEvent event, Emitter<PatLoginState> emit) async {
    AuthenticationServices service = AuthenticationServices();
    emit(state.copyWith(status: Status.loadingAccount));
    CreateAccountResult result = await service.signIn(
      email: state.email,
      password: state.password,
    );
    if(result.success){
      emit(state.copyWith(status: Status.accountSuccess , uid: result.uid , errorMessage: result.message));
    }else{
      emit(state.copyWith(status: Status.accountFail , errorMessage: result.message));
    }
  }
}
