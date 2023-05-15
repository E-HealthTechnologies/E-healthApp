part of 'pat_settings_bloc.dart';

enum Status {
  initial,
  loading,
  success,
  fail,
  finish,
  loadingDoctors,
}

@immutable
class PatSettingsState extends Equatable {
  PatSettingsState({
    this.status = Status.loading,
  });

  Status status;

  PatSettingsState copyWith({
    Status? status,
  }) {
    return PatSettingsState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
