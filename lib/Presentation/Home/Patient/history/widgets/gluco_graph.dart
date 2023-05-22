import 'package:e_health/Presentation/Home/Models/data_enums.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/graph_controller.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/select_butt.dart';
import 'package:e_health/Services/graph_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryDataGraph extends StatelessWidget {
  List<GlucoseTimedData> glucoDataList = [];
  List<TemperatureTimedData> temperatureDataList = [];
  List<dynamic> dataList = [];
  Function dayTab, monthTab, weekTab;
  SelectedView selectedView;
  DateTime actualDateTime;
  Function next, previous;
  HistoryDataGraph({
    super.key,
    required this.dataList,
    required this.selectedView,
    required this.dayTab,
    required this.monthTab,
    required this.weekTab,
    required this.actualDateTime,
    required this.next,
    required this.previous,
  });

  List<ScatterSeries<dynamic, DateTime>> oneValueDotSeries() {
    return [
      ScatterSeries<dynamic, DateTime>(
        dataSource: dataList,
        xValueMapper: (dynamic values, _) => values.timeStamp,
        yValueMapper: (dynamic values, _) => values.value,
        animationDuration: 500,
        color: Colors.amber,
        markerSettings: MarkerSettings(
          width: 8.sp,
          height: 8.sp,
        ),
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          textStyle: TextStyle(
            color: Color(0xFF6F6F6F),
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
          ),
        ),
      ),
    ];
  }

  List<XyDataSeries<dynamic, DateTime>> oneValueLineSeries() {
    return <XyDataSeries<dynamic, DateTime>>[
      LineSeries<dynamic, DateTime>(
        dataSource: dataList,
        xValueMapper: (dynamic values, _) => values.timeStamp,
        yValueMapper: (dynamic values, _) => values.value,
        color: Color(0x9F49CAAE),
      ),
      AreaSeries<dynamic, DateTime>(
        dataSource: dataList,
        xValueMapper: (dynamic values, _) => values.timeStamp,
        yValueMapper: (dynamic values, _) => values.value,
        color: Color(0xFF49CAAE),
        gradient: LinearGradient(
          colors: [Color(0x4F49CAAE), Color(0x0Fffffff)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double minValue = 30, maxValue = 140;
    if (dataList.length > 1) {
      maxValue = GraphService.maxValue(dataList);
      minValue = GraphService.minValue(dataList);
    }

    return Container(
      padding: EdgeInsets.all(5.sp),
      color: Color(0x00f5f5f5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.sp,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20.sp,
              ),
              Row(
                children: [
                  TransButtonText(
                    lable: 'Day',
                    onTab: () {
                      dayTab();
                    },
                    state: selectedView == SelectedView.daySelected,
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  TransButtonText(
                    lable: 'Week',
                    onTab: () {
                      weekTab();
                    },
                    state: selectedView == SelectedView.weeekSelected,
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  TransButtonText(
                    lable: 'Month',
                    onTab: () {
                      monthTab();
                    },
                    state: selectedView == SelectedView.monthSelected,
                  ),
                ],
              ),
              SizedBox(
                width: 10.sp,
              ),
              SizedBox(
                width: 5.sp,
              ),
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            color: Color(0xf5f5f5),
            // color: Colors.white,
            height: 200.sp,
            child: SfCartesianChart(
              backgroundColor: Color(0x00f5f5f5),
              borderWidth: 0,
              plotAreaBorderWidth: 0,

              // Initialize category axis
              primaryXAxis: DateTimeAxis(
                intervalType: selectedView == SelectedView.daySelected
                    ? DateTimeIntervalType.auto
                    : DateTimeIntervalType.days,
                axisLine: AxisLine(color: Color(0x00000000)),
                majorGridLines: MajorGridLines(
                  color: Color(0x00000000),
                ),
                rangePadding: selectedView == SelectedView.daySelected
                    ? ChartRangePadding.additional
                    : ChartRangePadding.auto,
                labelStyle: TextStyle(fontSize: 10.sp),
              ),
              primaryYAxis: NumericAxis(
                labelStyle: TextStyle(fontSize: 10.sp),

                // interval: 10,
                minimum: minValue - 10,
                maximum: maxValue + 10,
                // maximum: 130,
                axisLine: AxisLine(color: Color(0x00000000)),
                majorGridLines: MajorGridLines(
                  color: Color(0x0F000000),
                ),
              ),
              // primaryXAxis: CategoryAxis(),

              series: selectedView == SelectedView.daySelected
                  ? oneValueDotSeries()
                  : oneValueLineSeries(),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          GraphController(
            actualDateTime: this.actualDateTime,
            next: () {
              next();
            },
            previous: () {
              previous();
            },
          ),
        ],
      ),
    );
  }
}
