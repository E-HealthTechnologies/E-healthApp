import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:e_health/Presentation/Home/Models/device_respence.dart';
import 'package:udp/udp.dart';

class EhealthModule {
  static String? deviceId;
  static InternetAddress? deviceAddr;
  EhealthModule.__();
  static const int bloodPressureTimeout = 40; //in seconds
  static const int heartBeatTimeout = 20; //in seconds
  static const int handshakeTimeout = 5; //in seconds
  static const int temperatureTimeout = 5; //in seconds
  static const int networkInfoConfTimeout = 5; //in seconds

  //Errors
  static const int connectionError = -1;
  static const int deviceNotConnected = -2;
  static const int measurmentError = -3;
  static const int notEhealthPacket = -4;
  static const int unhandeledOpCode = -5;

  //
  static UDP? sender;
  //
  static Future<bool> sendNetworkInfo(
      String netwokSSID, String networkPwd) async {
    UDP sender;
    log('Sending network info request');
    bool gotResult = false;
    Uint8List packet =
        Uint8List(11 + netwokSSID.length + networkPwd.length + 2 + 5);
    bool recievedConfirmation = false;
    packet.setAll(0, 'E-Health'.codeUnits);
    packet.setAll(8, [0x00]);
    packet.setAll(9, [0x01, 0x10]);
    packet.setAll(11, [netwokSSID.length]);
    packet.setAll(12, netwokSSID.codeUnits);

    packet.setAll(12 + netwokSSID.length, [networkPwd.length]);
    packet.setAll(13 + netwokSSID.length, networkPwd.codeUnits);
    packet.setAll(13 + netwokSSID.length + networkPwd.length, [0x00]);
    sender = await UDP.bind(Endpoint.any(port: const Port(0)));
    await sender.send(packet, Endpoint.broadcast(port: const Port(2409)));
    sender.asStream(timeout: const Duration(seconds: 5)).listen((event) {
      if (event != null) {
        int opCode = checkOpcode(event.data);
        if (opCode != -1) {
          if (opCode == 0x1002) {
            recievedConfirmation = true;
            gotResult = true;
          } else {
            log("Not recieved confirmation ");
          }
        }
      }
    });
    int loop = 0;
    while (!gotResult && loop < (10 * networkInfoConfTimeout)) {
      await Future.delayed(const Duration(milliseconds: 100));
      loop++;
    }
    sender.close();
    log('Done listeing');
    return recievedConfirmation;
  }

  static Future<bool> sendHandshakeReuest() async {
    UDP sender;
    log('Sending Handshake request');
    bool gotResult = false;
    Uint8List packet = Uint8List(14);
    bool handshakeDone = false;
    packet.setAll(0, 'E-Health'.codeUnits);
    packet.setAll(8, [0x00]);
    packet.setAll(9, [0x00, 0x20]);
    packet.setAll(12, [0x00]);
    sender = await UDP.bind(Endpoint.any(port: const Port(0)));
    await sender.send(packet, Endpoint.broadcast(port: const Port(2409)));
    sender.asStream(timeout: const Duration(seconds: 5)).listen((event) {
      if (event != null) {
        int opCode = checkOpcode(event.data);
        log(opCode.toString());
        if (opCode != -1) {
          if (opCode == 0x2001) {
            if (event.data.length > 20) {
              deviceAddr = event.address;
              deviceId = String.fromCharCodes(event.data.sublist(11, 18));
              handshakeDone = true;
              log('Found: ${deviceAddr!.address} [ $deviceId ]');
              gotResult = true;
            } else {
              log('Not handshake respence, packet too small');
            }
          } else {
            log("Not handshake respence");
          }
        }
      }
    });
    int loop = 0;
    while (!gotResult && loop < (10 * handshakeTimeout)) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (loop % 10 == 0 && loop != 0) {
        await sender.send(packet, Endpoint.broadcast(port: const Port(2409)));
      }
      loop++;
    }
    sender.close();
    log('Done listeing');
    return handshakeDone;
  }

  static Future<int> sendHeartBeatRequest() async {
    log('Sending Heart Beat request');
    if (deviceId == null || deviceAddr == null) {
      log('device Not connected');
      return deviceNotConnected;
    }
    Uint8List packet = Uint8List(14);
    packet.setAll(0, 'E-Health\0'.codeUnits);
    packet.setAll(9, [0x00, 0x34]);
    packet.setAll(12, [0x00]);

    sender = await UDP.bind(Endpoint.any(port: const Port(2409)));

    await sender!
        .send(packet, Endpoint.unicast(deviceAddr, port: const Port(2409)));

    return 0;
  }

  static Future<HeartBeatResult> decHeartBeatRespence() async {
    bool gotResult = false;
    HeartBeatResult result =
        HeartBeatResult(heartRate: -1, msgType: MsgType.state);
    sender = await UDP.bind(Endpoint.any(port: const Port(2409)));

    sender!.asStream().listen((event) {
      if (event != null) {
        log('Recieved data');
        int opCode = checkOpcode(event.data);
        if (opCode != -1) {
          switch (opCode) {
            case 0x3401:
              if (event.data.length < 12) {
                log('Not heart beat respence');
              } else {
                gotResult = true;
                result = HeartBeatResult(
                    heartRate: event.data[11], msgType: MsgType.result);
              }
              break;

            case 0x3402:
              gotResult = true;
              result = HeartBeatResult(
                  heartRate: event.data[11], msgType: MsgType.state);
              break;

            default:
              log('unhandeled opCode');
              log(opCode.toString());
              result = HeartBeatResult(
                  heartRate: unhandeledOpCode, msgType: MsgType.state);
              break;
          }
        }
      }
    });
    int loop = 0;
    while (!gotResult && loop < (10 * heartBeatTimeout)) {
      await Future.delayed(const Duration(milliseconds: 100));
      loop++;
      if (loop == (10 * heartBeatTimeout)) {
        result.heartRate = HeartBeatResult.bpmFailed;
        log('listeing failed');
      }
    }
    sender?.close();
    log('Done listeing');
    return result;
  }

  static Future<int> sendTemperatureRequest() async {
    log('Sending Temperature request');
    if (deviceId == null || deviceAddr == null) {
      log('device Not connected');
      return deviceNotConnected;
    }
    Uint8List packet = Uint8List(14);
    packet.setAll(0, 'E-Health\0'.codeUnits);
    packet.setAll(9, [0x00, 0x33]);
    packet.setAll(12, [0x00]);

    sender = await UDP.bind(Endpoint.any(port: const Port(2409)));

    await sender!
        .send(packet, Endpoint.unicast(deviceAddr, port: const Port(2409)));

    return 0;
  }

  static Future<TemperatureResult> decTemperatureRespence() async {
    bool gotResult = false;
    TemperatureResult result = TemperatureResult(
        temperatureFrac: -1, temperatureInt: -1, msgType: MsgType.state);
    sender = await UDP.bind(Endpoint.any(port: const Port(2409)));

    sender!.asStream().listen((event) {
      if (event != null) {
        log('Recieved data');
        int opCode = checkOpcode(event.data);
        if (opCode != -1) {
          switch (opCode) {
            case 0x3302:
              if (event.data.length < 12) {
                log('Not temperature respence');
              } else {
                gotResult = true;
                result = TemperatureResult(
                    temperatureInt: event.data[11],
                    temperatureFrac: event.data[12],
                    msgType: MsgType.result);
              }
              break;

            case 0x3301:
              gotResult = true;
              result = TemperatureResult(
                  temperatureInt: event.data[11],
                  temperatureFrac: event.data[12],
                  msgType: MsgType.state);
              break;

            default:
              log('unhandeled opCode');
              log(opCode.toString());
              result = TemperatureResult(
                  temperatureInt: unhandeledOpCode,
                  temperatureFrac: unhandeledOpCode,
                  msgType: MsgType.state);
              break;
          }
        }
      }
    });
    int loop = 0;
    while (!gotResult && loop < (10 * heartBeatTimeout)) {
      await Future.delayed(const Duration(milliseconds: 100));
      loop++;
      if (loop == (10 * heartBeatTimeout)) {
        result.temperatureFrac = TemperatureResult.tmpFailed;
        result.temperatureInt = TemperatureResult.tmpFailed;
        log('listening failed');
      }
    }
    sender?.close();
    log('Done listeing');
    return result;
  }

  static Future<int> sendBloodPressureRequest() async {
    log('Sending Heart Beat request');
    if (deviceId == null || deviceAddr == null) {
      log('device Not connected');
      return deviceNotConnected;
    }
    Uint8List packet = Uint8List(14);
    packet.setAll(0, 'E-Health\0'.codeUnits);
    packet.setAll(9, [0x00, 0x31]);
    packet.setAll(12, [0x00]);

    sender = await UDP.bind(Endpoint.any(port: const Port(2409)));

    await sender!
        .send(packet, Endpoint.unicast(deviceAddr, port: const Port(2409)));

    return 0;
  }

  static Future<BloodPressureResult> decBloodPressureRespence() async {
    bool gotResult = false;
    BloodPressureResult result = BloodPressureResult(
        diastolicPressure: -1,
        heartBeat: -1,
        systolicSPressure: -1,
        msgType: MsgType.state);
    sender = await UDP.bind(Endpoint.any(port: const Port(2409)));

    sender!.asStream().listen((event) {
      if (event != null) {
        log('Recieved data');
        log(event.data.toString());
        int opCode = checkOpcode(event.data);
        if (opCode != -1) {
          switch (opCode) {
            case 0x3102:
              if (event.data.length < 12) {
                log('Not Blood Pressure respence');
              } else {
                log('sssssssssssssssssssss');
                gotResult = true;
                result = BloodPressureResult(
                    systolicSPressure: event.data[11],
                    diastolicPressure: event.data[12],
                    heartBeat: event.data[13],
                    msgType: MsgType.result);
              }
              break;

            case 0x3101:
              gotResult = true;
              result = BloodPressureResult(
                  systolicSPressure: event.data[11],
                  diastolicPressure: event.data[11],
                  heartBeat: event.data[11],
                  msgType: MsgType.state);
              break;

            default:
              log('unhandeled opCode');
              log(opCode.toString());
              result = result = BloodPressureResult(
                  systolicSPressure: unhandeledOpCode,
                  diastolicPressure: unhandeledOpCode,
                  heartBeat: unhandeledOpCode,
                  msgType: MsgType.state);
              break;
          }
        }
      }
    });
    int loop = 0;
    while (!gotResult && loop < (10 * bloodPressureTimeout)) {
      await Future.delayed(const Duration(milliseconds: 100));
      loop++;
      if (loop == (10 * heartBeatTimeout)) {
        result = BloodPressureResult(
            systolicSPressure: BloodPressureResult.bpFailed,
            diastolicPressure: BloodPressureResult.bpFailed,
            heartBeat: BloodPressureResult.bpFailed,
            msgType: MsgType.state);
        log('listeing failed');
      }
    }
    sender?.close();
    log('Done listeing');
    return result;
  }

  static Future<GlucoResault> getGluco() async {
    UDP sender;
    bool gotResult = false;
    GlucoResault result = GlucoResault(gluco: deviceNotConnected);
    log('Sending gluco request');
    if (deviceId == null || deviceAddr == null) {
      log('device Not connected');
      result.gluco = deviceNotConnected;
      return result;
    }
    Uint8List packet = Uint8List(14);
    packet.setAll(0, 'E-Health\0'.codeUnits);
    packet.setAll(9, [0x0032]);
    packet.setAll(12, [0x00]);
    sender = await UDP.bind(Endpoint.any(port: const Port(0)));

    await sender.send(
        packet, Endpoint.unicast(deviceAddr, port: const Port(2409)));
    sender.asStream().listen((event) {
      if (event != null) {
        int opCode = checkOpcode(event.data);
        if (opCode != -1) {
          switch (opCode) {
            case 0x3201:
              if (event.data.length < 14) {
                log('Not Gloco respence');
              } else {
                gotResult = true;
                result = GlucoResault(gluco: event.data[11]);
              }
              break;

            default:
              log('unhandeled opCode');
              result = GlucoResault(gluco: unhandeledOpCode);
              break;
          }
        }
      }
    });
    int loop = 0;
    while (!gotResult && loop < (10 * heartBeatTimeout)) {
      await Future.delayed(const Duration(milliseconds: 100));
      loop++;
    }
    sender.close();
    log('Done listeing');
    return result;
  }

  static int checkOpcode(Uint8List recvBuffer) {
    if (String.fromCharCodes(recvBuffer.sublist(0, 8)) != "E-Health") {
      log('Not E-Health packet: Wrong packet ID');
      return -1;
    }
    if (recvBuffer.length < 11) {
      log('Not E-Health packet: Packet too short');
      return -1;
    }
    return ((recvBuffer[10] << 8) | recvBuffer[9]);
  }
}
