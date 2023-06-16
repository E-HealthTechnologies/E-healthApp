import 'dart:io';

enum MsgType {
  result,
  state,
}

class HandShakeRespence {
  String deviceID;
  InternetAddress deviceAddr;
  //
  HandShakeRespence({
    required this.deviceID,
    required this.deviceAddr,
  });
}

class BloodPressureResult {
  static const bpOn = 0;
  static const bpChk = 1;
  static const bpWai = 2;
  static const bbInf = 3;
  static const bpDef = 4;
  static const bpEXH = 5;
  static const bpDone = 7;
  static const bpFailed = 8;
  static const bpAborted = 9;

  int systolicSPressure;
  int diastolicPressure;
  int heartBeat;
  MsgType msgType;

  BloodPressureResult({
    required this.systolicSPressure,
    required this.diastolicPressure,
    required this.heartBeat,
    required this.msgType,
  });
}

class HeartBeatResult {
  static const bpmStarted = 0;
  static const bpmWaitingFinger = 2;
  static const bpmAborted = 3;
  static const bpmDone = 4;
  static const bpmFailed = 5;
  int heartRate;
  MsgType msgType;
  HeartBeatResult({
    required this.heartRate,
    required this.msgType,
  });
}

class TemperatureResult {
  static const tmpStarted = 0;
  static const tmpAborted = 2;
  static const tmpDone = 3;
  static const tmpFailed = 4;
  int temperatureFrac;
  int temperatureInt;
  MsgType msgType;
  TemperatureResult({
    required this.temperatureFrac,
    required this.temperatureInt,
    required this.msgType,
  });
}

class GlucoResault {
  int gluco;
  GlucoResault({
    required this.gluco,
  });
}
