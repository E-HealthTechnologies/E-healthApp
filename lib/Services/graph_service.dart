import 'dart:developer';

import 'package:e_health/Presentation/Home/Models/data_enums.dart';

class GraphService {
  GraphService.__();
  static List<GlucoseTimedData> glucoDayData(
      {required TimedData bigList, required DateTime dateTime}) {
    List<GlucoseTimedData> dayList = [];
    for (int i = 0; i < bigList.glucose.length; i++) {
      if (bigList.glucose[i].timeStamp.day == dateTime.day &&
          bigList.glucose[i].timeStamp.month == dateTime.month &&
          bigList.glucose[i].timeStamp.year == dateTime.year) {
        dayList.add(bigList.glucose[i]);
      }
    }
    dayList.sort((a, b) {
      return a.timeStamp.compareTo(b.timeStamp);
    });
    return dayList;
  }

  static List<GlucoseTimedData> glucoMonthData(
      {required TimedData bigList, required DateTime dateTime}) {
    List<GlucoseTimedData> monthList = [], avgList = [];
    int daysInMonth = DateTime(dateTime.year, dateTime.month + 1, 0).day;
    if (bigList.glucose.length == 0) return [];
    for (int i = 0; i < bigList.glucose.length; i++) {
      if (bigList.glucose[i].timeStamp.month == dateTime.month &&
          bigList.glucose[i].timeStamp.year == dateTime.year) {
        monthList.add(bigList.glucose[i]);
      }
    }
    monthList.sort((a, b) {
      return b.timeStamp.compareTo(a.timeStamp);
    });
    for (int i = 0; i <= daysInMonth; i++) {
      int dayAvg = 0;
      for (int e = 0; e < monthList.length; e++) {
        if (monthList[e].timeStamp.day == i) {
          if (monthList[e].value != 0) {
            if (dayAvg == 0)
              dayAvg += monthList[e].value;
            else {
              dayAvg += monthList[e].value;
              dayAvg = dayAvg ~/ 2;
            }
          }
        }
      }
      if (dayAvg != 0)
        avgList.add(GlucoseTimedData(
            DateTime(
                monthList[0].timeStamp.year, monthList[0].timeStamp.month, i),
            dayAvg));
    }
    return avgList;
  }

  static List<TemperatureTimedData> temperatureDayData(
      {required TimedData bigList, required DateTime dateTime}) {
    List<TemperatureTimedData> dayList = [];
    for (int i = 0; i < bigList.temperature.length; i++) {
      if (bigList.temperature[i].timeStamp.day == dateTime.day &&
          bigList.temperature[i].timeStamp.month == dateTime.month &&
          bigList.temperature[i].timeStamp.year == dateTime.year) {
        dayList.add(bigList.temperature[i]);
      }
    }
    dayList.sort((a, b) {
      return a.timeStamp.compareTo(b.timeStamp);
    });
    return dayList;
  }

  static List<TemperatureTimedData> temperatureMonthData(
      {required TimedData bigList, required DateTime dateTime}) {
    List<TemperatureTimedData> monthList = [], avgList = [];
    int daysInMonth = DateTime(dateTime.year, dateTime.month + 1, 0).day;
    if (bigList.temperature.length == 0) return [];
    for (int i = 0; i < bigList.temperature.length; i++) {
      if (bigList.temperature[i].timeStamp.month == dateTime.month &&
          bigList.temperature[i].timeStamp.year == dateTime.year) {
        monthList.add(bigList.temperature[i]);
      }
    }
    monthList.sort((a, b) {
      return b.timeStamp.compareTo(a.timeStamp);
    });
    for (int i = 0; i <= daysInMonth; i++) {
      double dayAvg = 0;
      for (int e = 0; e < monthList.length; e++) {
        if (monthList[e].timeStamp.day == i) {
          if (monthList[e].value != 0) {
            if (dayAvg == 0)
              dayAvg += monthList[e].value;
            else {
              dayAvg += monthList[e].value;
              dayAvg = dayAvg / 2;
            }
          }
        }
      }
      if (dayAvg != 0)
        avgList.add(
          TemperatureTimedData(
            DateTime(
                monthList[0].timeStamp.year, monthList[0].timeStamp.month, i),
            double.parse(dayAvg.toStringAsFixed(2)),
          ),
        );
    }
    return avgList;
  }

  static List<HeartBeatTimedData> heartBeatDayData(
      {required TimedData bigList, required DateTime dateTime}) {
    List<HeartBeatTimedData> dayList = [];
    for (int i = 0; i < bigList.heartBeat.length; i++) {
      if (bigList.heartBeat[i].timeStamp.day == dateTime.day &&
          bigList.heartBeat[i].timeStamp.month == dateTime.month &&
          bigList.heartBeat[i].timeStamp.year == dateTime.year) {
        dayList.add(bigList.heartBeat[i]);
      }
    }
    dayList.sort((a, b) {
      return a.timeStamp.compareTo(b.timeStamp);
    });
    return dayList;
  }

  static List<HeartBeatTimedData> heartBeatMonthData(
      {required TimedData bigList, required DateTime dateTime}) {
    List<HeartBeatTimedData> monthList = [], avgList = [];
    int daysInMonth = DateTime(dateTime.year, dateTime.month + 1, 0).day;
    if (bigList.heartBeat.length == 0) return [];
    for (int i = 0; i < bigList.heartBeat.length; i++) {
      if (bigList.heartBeat[i].timeStamp.month == dateTime.month &&
          bigList.heartBeat[i].timeStamp.year == dateTime.year) {
        monthList.add(bigList.heartBeat[i]);
      }
    }

    monthList.sort((a, b) {
      return b.timeStamp.compareTo(a.timeStamp);
    });
    for (int i = 0; i <= daysInMonth; i++) {
      int dayAvg = 0;
      for (int e = 0; e < monthList.length; e++) {
        if (monthList[e].timeStamp.day == i) {
          if (monthList[e].value != 0) {
            if (dayAvg == 0)
              dayAvg += monthList[e].value;
            else {
              dayAvg += monthList[e].value;
              dayAvg = dayAvg ~/ 2;
            }
          }
        }
      }
      if (dayAvg != 0)
        avgList.add(
          HeartBeatTimedData(
              DateTime(
                  monthList[0].timeStamp.year, monthList[0].timeStamp.month, i),
              dayAvg),
        );
    }
    return avgList;
  }

  static double maxValue(List<dynamic> dataList) {
    if (dataList is List<GlucoseTimedData>) {
      return dataList
          .reduce(
              (current, next) => current.value > next.value ? current : next)
          .value
          .toDouble();
    } else if (dataList is List<TemperatureTimedData>) {
      return dataList
          .reduce(
              (current, next) => current.value > next.value ? current : next)
          .value;
    } else if (dataList is List<HeartBeatTimedData>) {
      return dataList
          .reduce(
              (current, next) => current.value > next.value ? current : next)
          .value
          .toDouble();
    } else
      return -1;
  }

  static double minValue(List<dynamic> dataList) {
    if (dataList is List<GlucoseTimedData>) {
      return dataList
          .reduce(
              (current, next) => current.value < next.value ? current : next)
          .value
          .toDouble();
    } else if (dataList is List<TemperatureTimedData>) {
      return dataList
          .reduce(
              (current, next) => current.value < next.value ? current : next)
          .value;
    } else if (dataList is List<HeartBeatTimedData>) {
      return dataList
          .reduce(
              (current, next) => current.value < next.value ? current : next)
          .value
          .toDouble();
    } else
      return -1;
  }

  static DataField getDataField(List<dynamic> dataList) {
    if (dataList is List<GlucoseTimedData>) return DataField.glucoze;
    if (dataList is List<TemperatureTimedData>) return DataField.temperature;
    return DataField.glucoze;
  }
}

class TimedData {
  List<GlucoseTimedData> glucose = [];
  List<TemperatureTimedData> temperature = [];
  List<HeartBeatTimedData> heartBeat = [];

  TimedData(List<Map<String, dynamic>> measurementsModel, DataField dataField) {
    if (measurementsModel.length > 0) {
      for (int i = 0; i < measurementsModel.length; i++) {
        if (dataField == DataField.glucoze)
          glucose.add(GlucoseTimedData(measurementsModel[i]['Date'].toDate(),
              measurementsModel[i]['Value']));

        if (dataField == DataField.temperature) {
          temperature.add(TemperatureTimedData(
              measurementsModel[i]['Date'].toDate(),
              measurementsModel[i]['Value']));
        }
        if (dataField == DataField.heartBeat) {
          heartBeat.add(HeartBeatTimedData(
              measurementsModel[i]['Date'].toDate(),
              measurementsModel[i]['Value']));
        }
      }
    }
  }
}

class GlucoseTimedData {
  DateTime timeStamp;
  int value;
  GlucoseTimedData(this.timeStamp, this.value);
}

class BloodPressureTimedData {
  DateTime timeStamp;
  int systolicPressure;
  int diastolicPressure;
  BloodPressureTimedData(
      {required this.timeStamp,
      required this.diastolicPressure,
      required this.systolicPressure});
}

class TemperatureTimedData {
  DateTime timeStamp;
  double value;
  TemperatureTimedData(this.timeStamp, this.value);
}

class HeartBeatTimedData {
  DateTime timeStamp;
  int value;
  HeartBeatTimedData(this.timeStamp, this.value);
}
