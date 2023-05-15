
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'pat_settings_event.dart';
part 'pat_settings_state.dart';

class PatSettingsBloc extends Bloc<PatSettingsEvent, PatSettingsState> {
  PatSettingsBloc() : super(PatSettingsState()) {

  }

}
