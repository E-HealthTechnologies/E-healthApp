import 'package:e_health/Presentation/Home/Models/data_enums.dart';
import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_bloc.dart';
import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_event.dart';
import 'package:e_health/Presentation/Home/Patient/history/gluco_history/gluco_history_state.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/data_scroll.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/history_graph.dart';
import 'package:e_health/Services/graph_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

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
  List<GlucoseTimedData> smallList = [], bigList = [];
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
          if (state is GlucoDataloadedState) {
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
              padding: EdgeInsets.all(8.sp),
              child: state is GlucoFirstLoadState
                  ? Container(
                      height: 700,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        'assets/lottie/loading-green.json',
                        height: 70.sp,
                        frameRate: FrameRate(100),
                        repeat: false,
                      ),
                    )
                  : Column(
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

                                context.read<GlucoHistoryBloc>().add(
                                    GlucoLoadData(
                                        uid: widget.uid,
                                        selectedView: selectedView,
                                        dateTime: dateTime));
                              },
                              monthTab: () {
                                selectedView = SelectedView.monthSelected;
                                context.read<GlucoHistoryBloc>().add(
                                    GlucoLoadData(
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
                                else if (selectedView ==
                                    SelectedView.weeekSelected)
                                  dateTime = dateTime.add(oneWeek);
                                else
                                  dateTime = dateTime.add(oneDay);
                                context.read<GlucoHistoryBloc>().add(
                                    GlucoLoadData(
                                        uid: widget.uid,
                                        selectedView: selectedView,
                                        dateTime: dateTime));
                              },
                              previous: () {
                                if (selectedView == SelectedView.monthSelected)
                                  dateTime = dateTime.subtract(oneMonth);
                                else if (selectedView ==
                                    SelectedView.weeekSelected)
                                  dateTime = dateTime.subtract(oneWeek);
                                else
                                  dateTime = dateTime.subtract(oneDay);
                                context.read<GlucoHistoryBloc>().add(
                                    GlucoLoadData(
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
