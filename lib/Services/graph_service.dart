import 'dart:developer';

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
    for (int i = 0; i < bigList.glucose.length; i++) {
      if (bigList.glucose[i].timeStamp.month == dateTime.month &&
          bigList.glucose[i].timeStamp.year == dateTime.year) {
        monthList.add(bigList.glucose[i]);
      }
    }
    monthList.sort((a, b) {
      return a.timeStamp.compareTo(b.timeStamp);
    });
    for (int i = 0; i <= 31; i++) {
      int dayAvg = 0;
      for (int e = 0; e < monthList.length; e++) {
        if (monthList[e].timeStamp.day == i) {
          dayAvg += monthList[i].value;
          dayAvg = dayAvg ~/ 2;
        }
      }
      if (dayAvg != 0)
        avgList.add(GlucoseTimedData(
            DateTime(
                monthList[0].timeStamp.year, monthList[0].timeStamp.month, i),
            dayAvg));
    }
    log('len = ' + avgList.length.toString());
    return avgList;
  }
}

class TimedData {
  late List<GlucoseTimedData> glucose = [];

  TimedData(List<Map<String, dynamic>> measurementsModel) {
    for (int i = 0; i < measurementsModel.length; i++) {
      glucose.add(GlucoseTimedData(DateTime.parse(measurementsModel[i]['Date']),
          measurementsModel[i]['Value']));
    }
  }
}

class GlucoseTimedData {
  DateTime timeStamp;
  int value;
  GlucoseTimedData(this.timeStamp, this.value);
}
