import 'dart:developer';

import 'package:e_health/Presentation/Home/Models/device_respence.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/temperature_measure/temperature_measure_event.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/temperature_measure/temperature_measure_state.dart';
import 'package:e_health/Services/ehealth_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemperatureMeasureBloc
    extends Bloc<TemperatureMeasureEvent, TemperatureMeasureState> {
  TemperatureMeasureBloc() : super(LoadingPage()) {
    on<SendTemperatureMeasureRequest>((event, emit) async {
      bool run = true;
      emit(WaitingTemperatureMeasureRespence());
      try {
        int res = await EhealthModule.sendTemperatureRequest();
        if (res == EhealthModule.deviceNotConnected) {
          emit(DeviceNotConnected());
        } else {
          while (run) {
            TemperatureResult temperatureResult =
                await EhealthModule.decTemperatureRespence();
            if (temperatureResult.msgType == MsgType.state) {
              switch (temperatureResult.temperatureInt) {
                case TemperatureResult.tmpFailed:
                  run = false;
                  emit(TemperatureMeasureMeassureError());
                  break;

                case TemperatureResult.tmpStarted:
                  emit(TemperatureMeasureStarted());
                  break;

                case TemperatureResult.tmpFailed:
                  run = false;
                  emit(TemperatureMeasureMeassureError());
                  break;
              }
            } else {
              emit(GotTemperatureMeasureRespence(temperatureResult));
              run = false;
            }
          }
        }
      } catch (e) {}
    });

    on<DeviceCOnnectionFailed>((event, emit) async {
      emit(DeviceFailedToConnected()); //DeviceCOnnectionSucceed
    });

    on<DeviceConnectionSucceed>((event, emit) async {
      emit(DeviceConnected());
    });
  }
}
