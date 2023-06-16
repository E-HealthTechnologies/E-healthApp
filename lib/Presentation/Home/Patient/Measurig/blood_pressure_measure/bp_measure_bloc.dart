import 'dart:developer';

import 'package:e_health/Presentation/Home/Models/device_respence.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/blood_pressure_measure/bp_measure_event.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/blood_pressure_measure/bp_measure_state.dart';
import 'package:e_health/Services/ehealth_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloodPressureMeasureBloc
    extends Bloc<BloodPressureMeasureEvent, BloodPressureMeasureState> {
  BloodPressureMeasureBloc() : super(LoadingPage()) {
    on<SendBloodPressureMeasureRequest>((event, emit) async {
      bool run = true;
      emit(WaitingBloodPressureMeasureRespence());
      try {
        int res = await EhealthModule.sendBloodPressureRequest();
        if (res == EhealthModule.deviceNotConnected) {
          emit(DeviceNotConnected());
        } else {
          while (run) {
            BloodPressureResult bloodPressureResult =
                await EhealthModule.decBloodPressureRespence();
            if (bloodPressureResult.msgType == MsgType.state) {
              switch (bloodPressureResult.systolicSPressure) {
                case BloodPressureResult.bpDef:
                  emit(BloodPressureMeasureDef());
                  break;

                case BloodPressureResult.bbInf:
                  emit(BloodPressureMeasureInf());
                  break;

                case BloodPressureResult.bpWai:
                  emit(BloodPressureMeasureStartPump());
                  break;

                case BloodPressureResult.bpChk:
                  emit(BloodPressureMeasureInitDevice());
                  break;

                case BloodPressureResult.bpFailed:
                  run = false;
                  emit(BloodPressureMeasureMeassureError());
                  break;
              }
            } else {
              emit(GotBloodPressureMeasureRespence(bloodPressureResult));
              log('got result');
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
