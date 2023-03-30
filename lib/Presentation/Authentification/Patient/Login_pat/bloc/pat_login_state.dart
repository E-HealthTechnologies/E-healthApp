part of 'pat_login_bloc.dart';

@immutable
class PatLoginState extends Equatable {
  PatLoginState({
    this.email = '',
    this.password = '',
    this.rememberMe = false,
    this.page = 0,
  });

  String email, password;
  bool? rememberMe;
  int page;
  PatLoginState copyWith({
    String? email,
    String? password,
    bool? rememberMe,
    int? page,
  }) {
    return PatLoginState(//nothing
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        rememberMe,
        page,
      ];
}
