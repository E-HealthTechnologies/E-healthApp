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
