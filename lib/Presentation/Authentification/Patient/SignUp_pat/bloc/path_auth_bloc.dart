import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'path_auth_event.dart';
part 'path_auth_state.dart';

class PatSignUpBloc extends Bloc<PatSignUpEvent, PatSignUpState> {
  PatSignUpBloc()
      : super(
          PatSignUpState(),
        ) {
    on<PatChangePageEvent>(_patSignInEvent);
    on<PatSignEmailEvent>(_patSignEmailEvent);
    on<PatSignPasswordEvent>(_patSignPasswordEvent);
    on<PatSignFNameEvent>(_patSignFNameEvent);
    on<PatSignLNameEvent>(_patSignLNameEvent);
    on<PatSignBirthEvent>(_patSignBirthEvent);
    on<PatSignWeightEvent>(_patSignWeightEvent);
    on<PatSignBloodEvent>(_patSignBloodEvent);
    on<PatSignGenderEvent>(_patSignGenderEvent);
    on<PatSignPhoneEvent>(_patSignPhoneEvent);
  }

  FutureOr<void> _patSignInEvent(
      PatChangePageEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(page: event.page));
    log(state.page.toString());
  }

  FutureOr<void> _patSignEmailEvent(
      PatSignEmailEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _patSignPasswordEvent(
      PatSignPasswordEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _patSignFNameEvent(
      PatSignFNameEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(firstName: event.fName));
  }

  FutureOr<void> _patSignLNameEvent(
      PatSignLNameEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(lastName: event.lName));
  }

  FutureOr<void> _patSignBirthEvent(
      PatSignBirthEvent event, Emitter<PatSignUpState> emit) {
    // emit(state.copyWith(page: event.page));
  }

  FutureOr<void> _patSignWeightEvent(
      PatSignWeightEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(weight: event.weight));
  }

  FutureOr<void> _patSignBloodEvent(
      PatSignBloodEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(blood: event.blood));
  }

  FutureOr<void> _patSignGenderEvent(
      PatSignGenderEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  FutureOr<void> _patSignPhoneEvent(
      PatSignPhoneEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(phone: event.phone));
  }
}
