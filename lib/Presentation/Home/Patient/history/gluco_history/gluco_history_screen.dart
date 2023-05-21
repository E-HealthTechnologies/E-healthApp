import 'dart:developer';
import 'dart:math';

import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_bloc.dart';
import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_event.dart';
import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_state.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/data_scroll.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/gluco_graph.dart';
import 'package:e_health/Services/StoreDataServices.dart';
import 'package:e_health/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Expanded(
                  //   child: Center(
                  //     child: ElevatedButton(
                  //       onPressed: () async {
                  //         // context.read<GlucoHistoryBloc>().add(GlucoLoadData(
                  //         //     uid: widget.uid,
                  //         //     dateTime: dateTime,
                  //         //     selectedView: selectedView));
                  //         DateTime refDate = DateTime.now();
                  //         for (int i = 1; i < 50; i++) {
                  //           for (int i = 0; i < 4; i++) {
                  //             var rnd = Random();
                  //             int min = 70;
                  //             int max = 150;
                  //             int value = min + rnd.nextInt(max - min);
                  //             final json = {
                  //               // 'Date': DateFormat.yMd().add_jm().format(
                  //               //       DateTime.now().add(
                  //               //         Duration(
                  //               //           days: Random().nextInt(1),
                  //               //           minutes: 20 + Random().nextInt(39),
                  //               //           hours: Random().nextInt(23),
                  //               //         ),
                  //               //       ),
                  //               //     ),

                  //               'Date': refDate,
                  //               'Value': value,
                  //               // 'Value big': value~/2,
                  //             };
                  //             StoreDataServices service = StoreDataServices();
                  //             service.uploadData(
                  //               uid: widget.uid,
                  //               type: 'Glucose',
                  //               data: json,
                  //             );
                  //             refDate = refDate.add(Duration(
                  //               minutes: 20 + Random().nextInt(39),
                  //               hours: Random().nextInt(8),
                  //             ));
                  //           }
                  //           refDate = refDate.add(Duration(
                  //             days: 1,
                  //           ));
                  //         }
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
                      GlocoGraph(
                        dataList: state is GlucoDataloadedState
                            ? state.smallDataList
                            : [],
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
                      state is GlucoDataloadedState
                          ? Container(
                              height: 200.sp,
                              child: HistoryNumericDataField(
                                dataList: state.bigDataList,
                              ),
                            )
                          : Container(),
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
