import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_health/Presentation/Authentification/Commun/Models/Doctor_data_model.dart';
import 'package:e_health/Services/AuthenticationServices.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'path_auth_event.dart';
part 'path_auth_state.dart';

class PatSignUpBloc extends Bloc<PatSignUpEvent, PatSignUpState> {
  PatSignUpBloc()
      : super(
          PatSignUpState(doctors: []),
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
    on<PatSignDocUIDEvent>(_patSignDocUIDEvent);
    on<PatCreateAccountEvent>(_patCreateAccountEvent);
    on<GetDoctorsEvent>(_getDoctorsEvent);
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
    emit(state.copyWith(birth: event.birth));
  }

  FutureOr<void> _patSignWeightEvent(
      PatSignWeightEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(weight: event.weight));
  }

  FutureOr<void> _patSignBloodEvent(
      //nothing
      PatSignBloodEvent event,
      Emitter<PatSignUpState> emit) {
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

  FutureOr<void> _patSignDocUIDEvent(
      PatSignDocUIDEvent event, Emitter<PatSignUpState> emit) {
    emit(state.copyWith(docUid: event.docUid));
  }

  FutureOr<void> _patCreateAccountEvent(
      PatCreateAccountEvent event, Emitter<PatSignUpState> emit) async {
    AuthenticationServices service = AuthenticationServices();

    emit(state.copyWith(accStatus: CreateAccStatus.loading));

    CreateAccountResult result = await service.createNewUser(
      email: state.email,
      password: state.password,
    );

    if (result.success) {
      log(result.message);
      CreateAccountResult res = await service.addPatInfoToDB(
        email: state.email,
        password: state.password,
        uid: result.uid,
        fName: state.firstName,
        lName: state.lastName,
        birth: state.birth,
        weight: state.weight,
        blood: state.blood,
        gender: state.gender,
        phone: state.phone,
        doctorUid: state.docUid,
      );
      if (res.success) {
        log(res.message);
        CreateAccountResult resSS =
            await service.addPatToMeasurements(patUid: result.uid);
        if (resSS.success) {
          log(resSS.message);
          CreateAccountResult resS = await service.addPatToDoc(
              docUid: state.docUid, patUid: result.uid);
          if (resS.success) {
            log(resS.message);
            emit(state.copyWith(
                accStatus: CreateAccStatus.success,
                errorMessage: result.message));
          } else {
            emit(state.copyWith(
                accStatus: CreateAccStatus.fail, errorMessage: result.message));
          }
        } else {
          emit(state.copyWith(
              accStatus: CreateAccStatus.fail, errorMessage: result.message));
        }
      } else {
        log(res.message);
        emit(state.copyWith(
            accStatus: CreateAccStatus.fail, errorMessage: res.message));
      }
      log(state.accStatus.toString() , name: 'state');
      // emit(state.copyWith(accStatus: CreateAccStatus.finish));
    } else {
      emit(state.copyWith(
          accStatus: CreateAccStatus.fail, errorMessage: result.message));
    }
  }

  void _getDoctorsEvent(
      GetDoctorsEvent event, Emitter<PatSignUpState> emit) async {
    // print(state.doctors.length);
    emit(state.copyWith(status: Status.loadingDoctors));
    // log(state.status.toString());
    List<DoctorDataModel> _doctors = await getDoctorsData();
    emit(state.copyWith(doctors: _doctors, status: Status.success));
    // log(state.status.toString());
    // log(state.doctors.length.toString());
  }
}
