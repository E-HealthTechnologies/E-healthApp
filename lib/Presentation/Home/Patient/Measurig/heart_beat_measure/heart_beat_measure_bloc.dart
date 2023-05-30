import 'dart:developer';

import 'package:e_health/Presentation/Home/Models/device_respence.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/heart_beat_measure/heart_beat_measure_event.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/heart_beat_measure/heart_beat_measure_state.dart';
import 'package:e_health/Services/ehealth_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartBeatMeasureBloc
    extends Bloc<HeartBeatMeasureEvent, HeartBeatMeasureState> {
  HeartBeatMeasureBloc() : super(LoadingPage()) {
    on<SendHeartBeatMeasureRequest>((event, emit) async {
      bool run = true;
      emit(WaitingHeartBeatMeasureRespence());
      try {
        int res = await EhealthModule.sendHeartBeatRequest();
        if (res == EhealthModule.deviceNotConnected) {
          emit(DeviceNotConnected());
        } else {
          emit(HeartBeatMeasureWaitingFinger());
          while (run) {
            HeartBeatResult heartBeatResult =
                await EhealthModule.decHeartBeatRespence();
            if (heartBeatResult.msgType == MsgType.state) {
              switch (heartBeatResult.heartRate) {
                case HeartBeatResult.bpmFailed:
                  run = false;
                  emit(HeartBeatMeasureMeassureError());
                  break;

                case HeartBeatResult.bpmWaitingFinger:
                  run = false;
                  emit(HeartBeatMeasureWaitingFinger());
                  break;

                case HeartBeatResult.bpmStarted:
                  emit(HeartBeatMeasureStarted());
                  break;

                case EhealthModule.measurmentError:
                  run = false;
                  emit(HeartBeatMeasureMeassureError());
                  break;
              }
            } else {
              emit(GotHeartBeatMeasureRespence(heartBeatResult));
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
