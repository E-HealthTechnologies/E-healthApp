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
  int systolicSPressure;
  int diastolicPressure;

  BloodPressureResult({
    required this.systolicSPressure,
    required this.diastolicPressure,
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

class TemperatureResault {
  int temperatureFraction;
  int temperatureRational;
  TemperatureResault({
    required this.temperatureFraction,
    required this.temperatureRational,
  });
}

class GlucoResault {
  int gluco;
  GlucoResault({
    required this.gluco,
  });
}
