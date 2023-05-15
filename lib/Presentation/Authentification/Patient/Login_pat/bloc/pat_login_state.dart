part of 'pat_login_bloc.dart';

enum Status {
  initial,
  loading,
  success,
  fail,
  finish,
  loadingAccount,
  accountSuccess,
  accountFail,
}

@immutable
class PatLoginState extends Equatable {
  PatLoginState(
      {this.status = Status.initial,
      this.email = '',
      this.password = '',
      this.rememberMe = false,
      this.page = 0,
      this.errorMessage = '',
      this.uid = ''});

  Status status;
  String email, password, uid, errorMessage;
  bool? rememberMe;
  int page;

  PatLoginState copyWith({
    Status? status,
    String? email,
    String? password,
    bool? rememberMe,
    int? page,
    String? uid,
    String? errorMessage,
  }) {
    return PatLoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      page: page ?? this.page,
      uid: uid ?? this.uid,
      errorMessage: errorMessage ?? this.errorMessage,
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
        errorMessage,
      ];
}
