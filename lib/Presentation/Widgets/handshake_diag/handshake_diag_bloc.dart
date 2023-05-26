import 'dart:developer';
import 'dart:typed_data';
import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_event.dart';
import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_states.dart';
import 'package:e_health/Services/ehealth_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udp/udp.dart';

class HandshakeBloc extends Bloc<HandshakeEvent, HandshakeState> {
  HandshakeBloc() : super(HandshakeInitState()) {
    on<SendHandShake>((event, emit) async {
      bool deviceFound = false;
      emit(WaitingHandshakeRespence());
      await Future.delayed(Duration(seconds: 2));
      try {
        deviceFound = await EhealthModule.sendHandshakeReuest();
      } catch (e) {
        log('Handshake failed');
        log(e.toString());
      }
      if (deviceFound) {
        emit(GotHandshakeRespence());
      } else {
        emit(HandshakeNoDeviceFound());
      }
    });
  }
}
