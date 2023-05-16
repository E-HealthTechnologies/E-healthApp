import 'dart:developer';

import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_event.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_state.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/widgets/gluco_graph.dart';
import 'package:e_health/Services/GetDataServices.dart';
import 'package:e_health/Services/graph_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlucoMeasurmentBloc
    extends Bloc<GlucoMeasurmentEvent, GlucoMeasurmentState> {
  GlucoMeasurmentBloc() : super(GlucoFirstLoadState()) {
    on<GlucoLoadData>((event, emit) async {
      List<GlucoseTimedData> smallList = [];

      emit(GlucoLoadingState());
      List<Map<String, dynamic>> data;
      TimedData timedData;
      GetDataServices service = GetDataServices();
      data = await service.getMeasurementData(uid: event.uid, type: 'Glucose');
      timedData = TimedData(data);
      DateTime dateTime = event.dateTime ?? timedData.glucose[0].timeStamp;

      if (event.selectedView == SelectedView.monthSelected)
        smallList = GraphService.glucoMonthData(
            bigList: TimedData(data), dateTime: dateTime);
      else if (event.selectedView == SelectedView.weeekSelected)
        smallList = GraphService.glucoMonthData(
            bigList: TimedData(data), dateTime: dateTime);
      else
        smallList = GraphService.glucoDayData(
            bigList: TimedData(data), dateTime: dateTime);
      emit(GlucoDataloadedState(smallList));
    });
  }
}
