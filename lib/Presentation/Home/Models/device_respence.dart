import 'dart:io';

class HandShakeRespence {
  late String deviceID;
  late InternetAddress deviceAddr;
  // late
  HandShakeRespence({
    required this.deviceID,
    required this.deviceAddr,
  });
}

class BloodPressureResult {
  late int systolicSPressure;
  late int diastolicPressure;

  BloodPressureResult({
    required this.systolicSPressure,
    required this.diastolicPressure,
  });
}

class HeartBeatResault {
  late int heartRate;
  HeartBeatResault({
    required this.heartRate,
  });
}

class TemperatureResault {
  late int temperatureFraction;
  late int temperatureRational;
  TemperatureResault({
    required this.temperatureFraction,
    required this.temperatureRational,
  });
}

class GlucoResault {
  late int gluco;
  GlucoResault({
    required this.gluco,
  });
}
