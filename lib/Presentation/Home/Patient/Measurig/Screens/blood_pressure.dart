import 'dart:developer';

import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_bloc.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_event.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_state.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/graph_controller.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/widgets/gluco_graph.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/widgets/select_butt.dart';
import 'package:e_health/Services/GetDataServices.dart';
import 'package:e_health/Services/StoreDataServices.dart';
import 'package:e_health/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BloodPressureScreen extends StatefulWidget {
  const BloodPressureScreen({required this.uid});
  final String uid;

  @override
  State<BloodPressureScreen> createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<BloodPressureScreen> {
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
      create: (context) => GlucoMeasurmentBloc(),
      child: BlocBuilder<GlucoMeasurmentBloc, GlucoMeasurmentState>(
        builder: (context, state) {
          if (state is GlucoFirstLoadState) {
            context.read<GlucoMeasurmentBloc>().add(
                GlucoLoadData(uid: widget.uid, selectedView: selectedView));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      context.read<GlucoMeasurmentBloc>().add(GlucoLoadData(
                          uid: widget.uid,
                          dateTime: dateTime,
                          selectedView: selectedView));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff3f51b5),
                      minimumSize: Size(150.sp, 30.sp),
                      maximumSize: Size(150.sp, 40.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.sp),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Measure',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GraphController(
                            actualDateTime: dateTime,
                            next: () {
                              if (selectedView == SelectedView.monthSelected)
                                dateTime = dateTime.add(oneMonth);
                              else if (selectedView ==
                                  SelectedView.weeekSelected)
                                dateTime = dateTime.add(oneWeek);
                              else
                                dateTime = dateTime.add(oneDay);
                              context.read<GlucoMeasurmentBloc>().add(
                                  GlucoLoadData(
                                      uid: widget.uid,
                                      selectedView: selectedView,
                                      dateTime: dateTime));
                            },
                            nextPage: () {},
                            previous: () {
                              if (selectedView == SelectedView.monthSelected)
                                dateTime = dateTime.subtract(oneMonth);
                              else if (selectedView ==
                                  SelectedView.weeekSelected)
                                dateTime = dateTime.subtract(oneWeek);
                              else
                                dateTime = dateTime.subtract(oneDay);
                              context.read<GlucoMeasurmentBloc>().add(
                                  GlucoLoadData(
                                      uid: widget.uid,
                                      selectedView: selectedView,
                                      dateTime: dateTime));
                            },
                            previousPage: () {}),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GlocoGraph(
                        dataList:
                            state is GlucoDataloadedState ? state.dataList : [],
                        selectedView: selectedView,
                        dayTab: () {
                          selectedView = SelectedView.daySelected;
                          context.read<GlucoMeasurmentBloc>().add(GlucoLoadData(
                              uid: widget.uid,
                              selectedView: selectedView,
                              dateTime: dateTime));
                        },
                        monthTab: () {
                          selectedView = SelectedView.monthSelected;
                          context.read<GlucoMeasurmentBloc>().add(GlucoLoadData(
                              uid: widget.uid,
                              selectedView: selectedView,
                              dateTime: dateTime));
                        },
                        weekTab: () {
                          selectedView = SelectedView.weeekSelected;
                          context.read<GlucoMeasurmentBloc>().add(GlucoLoadData(
                              uid: widget.uid,
                              selectedView: selectedView,
                              dateTime: dateTime));
                        },
                      )
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
