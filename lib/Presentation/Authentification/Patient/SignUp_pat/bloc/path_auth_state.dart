part of 'path_auth_bloc.dart';

@immutable
class PatSignUpState extends Equatable {
  PatSignUpState(
      {this.email = '',
      this.password = '',
      this.rememberMe = false,
      this.page = 0,
      this.firstName = '',
      this.lastName = '',
      this.weight = '',
      this.blood = '',
      this.gender = '',
      this.phone = ''});

  String email, password;
  bool? rememberMe;
  int page;
  String firstName, lastName, weight, blood, gender, phone;
  PatSignUpState copyWith({
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
  }) {
    return PatSignUpState(
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
    );
  }

  @override
  List<Object?> get props => [
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
      ];
}


// @immutable
// class PatSignUpState extends Equatable {
//   PatSignUpState(
//       {this.email = '',
//         this.password = '',
//         this.rememberMe = false,
//         this.page = 0,
//         this.firstName = '',
//         this.lastName = '',
//         this.weight = '',
//         this.blood = '',
//         this.gender = '',
//         this.phone = ''});
//
//   String email, password;
//   bool? rememberMe;
//   int page;
//   String firstName, lastName, weight, blood, gender, phone;
//   PatSignUpState copyWith({
//     String? email,
//     String? password,
//     bool? rememberMe,
//     int? page,
//     String? firstName,
//     String? lastName,
//     String? weight,
//     String? blood,
//     String? gender,
//     String? phone,
//   }) {
//     return PatSignUpState(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       rememberMe: rememberMe ?? this.rememberMe,
//       page: page ?? this.page,
//       firstName: firstName ?? this.firstName,
//       lastName: lastName ?? this.lastName,
//       weight: weight ?? this.weight,
//       blood: blood ?? this.blood,
//       gender: gender ?? this.gender,
//       phone: phone ?? this.phone,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//     email,
//     password,
//     rememberMe,
//     page,
//     firstName,
//     lastName,
//     weight,
//     blood,
//     gender,
//     phone,
//   ];
// }