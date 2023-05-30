import 'dart:developer';

import 'package:e_health/Presentation/Home/Models/data_enums.dart';
import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_event.dart';
import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_state.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/history_graph.dart';
import 'package:e_health/Services/GetDataServices.dart';
import 'package:e_health/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlucoHistoryBloc extends Bloc<GlucoHistoryEvent, GlucoHistoryState> {
  GlucoHistoryBloc() : super(GlucoFirstLoadState()) {
    on<GlucoLoadData>((event, emit) async {
      List<GlucoseTimedData> smallList = [];

      List<Map<String, dynamic>> data;
      TimedData timedData;
      GetDataServices service = GetDataServices();
      data = await service.getMeasurementData(uid: event.uid, type: 'Glucose');
      timedData = TimedData(data, DataField.glucoze);
      DateTime dateTime = event.dateTime ?? timedData.glucose[0].timeStamp;

      if (event.selectedView == SelectedView.monthSelected)
        smallList = GraphService.glucoMonthData(
            bigList: TimedData(data, DataField.glucoze), dateTime: dateTime);
      else if (event.selectedView == SelectedView.weeekSelected)
        smallList = GraphService.glucoMonthData(
            bigList: TimedData(data, DataField.glucoze), dateTime: dateTime);
      else
        smallList = GraphService.glucoDayData(
            bigList: TimedData(data, DataField.glucoze), dateTime: dateTime);
      for (int i = 0; i < smallList.length; i++) {
        // log(smallList[i].value.toString() +
        //     " - " +
        //     smallList[i].timeStamp.toString());
      }
      emit(GlucoDataloadedState(
          smallDataList: smallList, bigDataList: timedData.glucose));
    });
  }
}
