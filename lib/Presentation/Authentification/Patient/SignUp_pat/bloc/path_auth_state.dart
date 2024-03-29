part of 'path_auth_bloc.dart';

enum Status {
  initial,
  loading,
  success,
  fail,
  finish,
  loadingDoctors,
}

enum CreateAccStatus {
  initial,
  loading,
  success,
  fail,
  finish,
}

@immutable
class PatSignUpState extends Equatable {
  PatSignUpState(
      {this.status = Status.loading,
      this.accStatus = CreateAccStatus.initial,
      this.email = '',
      this.password = '11111111',
      this.rememberMe = false,
      this.page = 0,
      this.firstName = 'dhgfd',
      this.lastName = 'ghfdsdfghj',
      this.weight = '89',
      this.blood = 'A+',
      this.gender = 'Male',
      this.phone = '8765432',
      this.docUid = '',
      this.birth = '20/05/2000',
      required this.doctors,
      this.errorMessage = ''});

  String email, password;
  bool? rememberMe;
  int page;
  String firstName, lastName, weight, blood, gender, phone, birth, docUid;
  List<DoctorDataModel> doctors = [];
  Status status;
  CreateAccStatus accStatus;
  String errorMessage;
  PatSignUpState copyWith({
    Status? status,
    CreateAccStatus? accStatus,
    String? email,
    String? password,
    bool? rememberMe,
    int? page,
    String? firstName,
    String? lastName,
    String? weight,
    String? blood,
    String? gender,
    String? phone,
    String? birth,
    String? docUid,
    List<DoctorDataModel>? doctors,
    String? errorMessage,
  }) {
    return PatSignUpState(
      status: status ?? this.status,
      accStatus: accStatus ?? this.accStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      page: page ?? this.page,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      weight: weight ?? this.weight,
      blood: blood ?? this.blood,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      birth: birth ?? this.birth,
      doctors: doctors ?? this.doctors,
      docUid: docUid ?? this.docUid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        accStatus,
        email,
        password,
        rememberMe,
        page,
        firstName,
        lastName,
        weight,
        blood,
        gender,
        phone,
        birth,
        docUid,
        doctors,
        errorMessage
      ];
}
