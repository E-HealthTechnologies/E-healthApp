part of 'patient_home_bloc.dart';

enum Status { initial, loading, success, fail, finish, loadingDoctors }

class PatHomeState extends Equatable {
  PatHomeState(
      {this.status = Status.initial,
      this.email = '',
      this.password = '',
      this.rememberMe = false,
      this.page =0,
      this.uid = ''});

  final Status status;
  final String email, password, uid;
  final bool?  rememberMe;
  final int page;

  PatHomeState copyWith({
    Status? status,
    String? email,
    String? password,
    bool? rememberMe,
    int? page,
    String? uid,
  }) {
    return PatHomeState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      page: page ?? this.page,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        rememberMe,
        page,
        uid,
      ];
}
