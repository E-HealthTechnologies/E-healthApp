part of 'path_auth_bloc.dart';

@immutable
abstract class PatSignUpEvent extends Equatable {
  PatSignUpEvent();

  @override
  List<Object?> get props => [];
}

class PatChangePageEvent extends PatSignUpEvent {
  PatChangePageEvent({required this.page});
  final int page;
  @override
  List<Object?> get props => [];
}

class PatSignEmailEvent extends PatSignUpEvent {
  PatSignEmailEvent({required this.email});
  final String email;
  @override
  List<Object?> get props => [];
}

class PatSignPasswordEvent extends PatSignUpEvent {
  PatSignPasswordEvent({required this.password});
  final String password;
  @override
  List<Object?> get props => [];
}

class PatSignFNameEvent extends PatSignUpEvent {
  PatSignFNameEvent({required this.fName});
  final String fName;
  @override
  List<Object?> get props => [];
}

class PatSignLNameEvent extends PatSignUpEvent {
  PatSignLNameEvent({required this.lName});
  final String lName;
  @override
  List<Object?> get props => [];
}

class PatSignBirthEvent extends PatSignUpEvent {
  PatSignBirthEvent({required this.birth});
  final String birth;
  @override
  List<Object?> get props => [];
}

class PatSignWeightEvent extends PatSignUpEvent {
  PatSignWeightEvent({required this.weight});
  final String weight;
  @override
  List<Object?> get props => [];
}

class PatSignBloodEvent extends PatSignUpEvent {
  PatSignBloodEvent({required this.blood});
  final String blood;
  @override
  List<Object?> get props => [];
}

class PatSignGenderEvent extends PatSignUpEvent {
  PatSignGenderEvent({required this.gender});
  final String gender;
  @override
  List<Object?> get props => [];
}

class PatSignPhoneEvent extends PatSignUpEvent {
  PatSignPhoneEvent({required this.phone});
  final String phone;
  @override
  List<Object?> get props => [];
}
