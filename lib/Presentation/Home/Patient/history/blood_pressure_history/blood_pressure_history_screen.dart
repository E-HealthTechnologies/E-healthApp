import 'package:e_health/Presentation/Home/Models/data_enums.dart';
import 'package:e_health/Presentation/Home/Patient/history/blood_pressure_history/blood_pressure_bloc.dart';
import 'package:e_health/Presentation/Home/Patient/history/blood_pressure_history/blood_pressure_event.dart';
import 'package:e_health/Presentation/Home/Patient/history/blood_pressure_history/blood_pressure_state.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/data_scroll.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/history_graph.dart';
import 'package:e_health/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodPressureHistoryScreen extends StatefulWidget {
  const BloodPressureHistoryScreen({required this.uid});
  final String uid;

  @override
  State<BloodPressureHistoryScreen> createState() =>
      _BloodPressureHistoryScreenState();
}

class _BloodPressureHistoryScreenState
    extends State<BloodPressureHistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  SelectedView selectedView = SelectedView.daySelected;
  DateTime dateTime = DateTime.now();
  List<BloodPressureTimedData> smallList = [], bigList = [];
  static const Duration oneMonth = Duration(days: 30),
      oneDay = Duration(days: 1),
      oneWeek = Duration(days: 7);
  bool isSystoVisible = true, isDiastoVisible = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BloodPressureHistoryBloc(),
      child: BlocBuilder<BloodPressureHistoryBloc, BloodPressureHistoryState>(
        builder: (context, state) {
          if (state is BloodPressureFirstLoadState) {
            context.read<BloodPressureHistoryBloc>().add(BloodPressureLoadData(
                uid: widget.uid, selectedView: selectedView));
          }
          if (state is BloodPressureDataloadedState) {
            bigList = state.bigDataList;
            smallList = state.smallDataList;
          }
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      HistoryDataGraph(
                        dataList: smallList,
                        selectedView: selectedView,
                        dayTab: () {
                          selectedView = SelectedView.daySelected;

                          context.read<BloodPressureHistoryBloc>().add(
                              BloodPressureLoadData(
                                  uid: widget.uid,
                                  selectedView: selectedView,
                                  dateTime: dateTime));
                        },
                        monthTab: () {
                          selectedView = SelectedView.monthSelected;
                          context.read<BloodPressureHistoryBloc>().add(
                              BloodPressureLoadData(
                                  uid: widget.uid,
                                  selectedView: selectedView,
                                  dateTime: dateTime));
                        },
                        weekTab: () {
                          selectedView = SelectedView.weeekSelected;
                          context.read<BloodPressureHistoryBloc>().add(
                                BloodPressureLoadData(
                                  uid: widget.uid,
                                  selectedView: selectedView,
                                  dateTime: dateTime,
                                ),
                              );
                        },
                        actualDateTime: dateTime,
                        next: () {
                          if (selectedView == SelectedView.monthSelected)
                            dateTime = dateTime.add(oneMonth);
                          else if (selectedView == SelectedView.weeekSelected)
                            dateTime = dateTime.add(oneWeek);
                          else
                            dateTime = dateTime.add(oneDay);
                          context.read<BloodPressureHistoryBloc>().add(
                              BloodPressureLoadData(
                                  uid: widget.uid,
                                  selectedView: selectedView,
                                  dateTime: dateTime));
                        },
                        previous: () {
                          if (selectedView == SelectedView.monthSelected)
                            dateTime = dateTime.subtract(oneMonth);
                          else if (selectedView == SelectedView.weeekSelected)
                            dateTime = dateTime.subtract(oneWeek);
                          else
                            dateTime = dateTime.subtract(oneDay);
                          context.read<BloodPressureHistoryBloc>().add(
                              BloodPressureLoadData(
                                  uid: widget.uid,
                                  selectedView: selectedView,
                                  dateTime: dateTime));
                        },
                        isDiastoVisible: isDiastoVisible,
                        isSystoVisible: isSystoVisible,
                        onDiastoTab: () {
                          isDiastoVisible = !isDiastoVisible;
                          setState(() {});
                        },
                        onSystoTab: () {
                          isSystoVisible = !isSystoVisible;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Container(
                        height: 1.sp,
                        color: Color(0x1F0F0F0F),
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Container(
                        height: 200.sp,
                        child: HistoryNumericDataField(
                          dataList: bigList,
                        ),
                      )
                    ],
                  ),
                  // SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
