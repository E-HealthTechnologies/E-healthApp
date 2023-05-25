import 'package:e_health/Presentation/Home/Models/device_respence.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/heart_beat_measure/heart_beat_measure_event.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/heart_beat_measure/heart_beat_measure_state.dart';
import 'package:e_health/Services/ehealth_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartBeatMeasureBloc
    extends Bloc<HeartBeatMeasureEvent, HeartBeatMeasureState> {
  HeartBeatMeasureBloc() : super(LoadingPage()) {
    on<SendHeartBeatMeasureRequest>((event, emit) async {
      emit(WaitingHeartBeatMeasureRespence());
      try {
        HeartBeatResault heartBeatResult = await EhealthModule.getHeartBeat();

        switch (heartBeatResult.heartRate) {
          case EhealthModule.connectionError:
            emit(HeartBeatMeasureConnectionError());
            break;
          case EhealthModule.deviceNotConnected:
            emit(DeviceNotConnected());
            break;

          case EhealthModule.measurmentError:
            emit(HeartBeatMeasureMeassureError());
            break;

          case EhealthModule.unhandeledOpCode:
            emit(HeartBeatMeasureConnectionError());
            break;

          case EhealthModule.notEhealthPacket:
            emit(HeartBeatMeasureConnectionError());
            break;

          default:
            emit(GotHeartBeatMeasureRespence(heartBeatResult));
            break;
        }
      } catch (e) {}
    });
  }
}
