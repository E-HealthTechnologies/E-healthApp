import 'dart:developer';

import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_bloc.dart';
import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_event.dart';
import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_state.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/gluco_graph.dart';
import 'package:e_health/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class GlucoHistoryScreen extends StatefulWidget {
  const GlucoHistoryScreen({required this.uid});
  final String uid;

  @override
  State<GlucoHistoryScreen> createState() => _GlucoHistoryScreenState();
}

class _GlucoHistoryScreenState extends State<GlucoHistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  SelectedView selectedView = SelectedView.daySelected;
  DateTime dateTime = DateTime.now();
  List<GlucoseTimedData> smallList = [];
  static const Duration oneMonth = Duration(days: 30),
      oneDay = Duration(days: 1),
      oneWeek = Duration(days: 7);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlucoHistoryBloc(),
      child: BlocBuilder<GlucoHistoryBloc, GlucoHistoryState>(
        builder: (context, state) {
          if (state is GlucoFirstLoadState) {
            context.read<GlucoHistoryBloc>().add(
                GlucoLoadData(uid: widget.uid, selectedView: selectedView));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child: Center(
                  //     child: ElevatedButton(
                  //       onPressed: () async {
                  //         context.read<GlucoHistoryBloc>().add(GlucoLoadData(
                  //             uid: widget.uid,
                  //             dateTime: dateTime,
                  //             selectedView: selectedView));
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Color(0xff3f51b5),
                  //         minimumSize: Size(150.sp, 30.sp),
                  //         maximumSize: Size(150.sp, 40.sp),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(50.sp),
                  //         ),
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           'Measure',
                  //           style: TextStyle(
                  //             fontSize: 14.sp,
                  //             fontWeight: FontWeight.w600,
                  //             color: Color(0xffffffff),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      GlocoGraph(
                        dataList:
                            state is GlucoDataloadedState ? state.dataList : [],
                        selectedView: selectedView,
                        dayTab: () {
                          selectedView = SelectedView.daySelected;
                          context.read<GlucoHistoryBloc>().add(GlucoLoadData(
                              uid: widget.uid,
                              selectedView: selectedView,
                              dateTime: dateTime));
                        },
                        monthTab: () {
                          selectedView = SelectedView.monthSelected;
                          context.read<GlucoHistoryBloc>().add(GlucoLoadData(
                              uid: widget.uid,
                              selectedView: selectedView,
                              dateTime: dateTime));
                        },
                        weekTab: () {
                          selectedView = SelectedView.weeekSelected;
                          context.read<GlucoHistoryBloc>().add(
                                GlucoLoadData(
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
                          context.read<GlucoHistoryBloc>().add(GlucoLoadData(
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
                          context.read<GlucoHistoryBloc>().add(GlucoLoadData(
                              uid: widget.uid,
                              selectedView: selectedView,
                              dateTime: dateTime));
                        },
                      ),
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
