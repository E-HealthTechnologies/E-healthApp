part of 'doc_sign_up_bloc.dart';

@immutable
class DocSignUpState extends Equatable {
  DocSignUpState(
      {this.email = '',
      this.password = '',
      this.rememberMe = false,
      this.page = 0,
      this.fullName = '',
      this.hosAddress = '',
      this.gender = '',
      this.speciality = '',
      this.hosName = ''});

  String email, password;
  bool? rememberMe;
  int page;
  String fullName, hosName, hosAddress, gender, speciality;

  DocSignUpState copyWith({
    String? email,
    String? password,
    bool? rememberMe,
    int? page,
    String? fullName,
    String? hosName,
    String? hosAddress,
    String? gender,
    String? speciality,
  }) {
    return DocSignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      page: page ?? this.page,
      fullName: fullName ?? this.fullName,
      hosName: hosName ?? this.hosName,
      hosAddress: hosAddress ?? this.hosAddress,
      gender: gender ?? this.gender,
      speciality: speciality ?? this.speciality,
    );
  }

//nothing
  @override
  List<Object?> get props => [
        email,
        password,
        rememberMe,
        page,
        fullName,
        gender,
        hosName,
        hosAddress,
        speciality,
      ];
}
