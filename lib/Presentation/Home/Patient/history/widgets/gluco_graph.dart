import 'package:e_health/Presentation/Home/Patient/history/widgets/graph_controller.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/select_butt.dart';
import 'package:e_health/Services/graph_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum SelectedView {
  daySelected,
  monthSelected,
  weeekSelected,
}

class GlocoGraph extends StatelessWidget {
  late List<GlucoseTimedData> dataList;
  late Function dayTab, monthTab, weekTab;
  late SelectedView selectedView;
  DateTime actualDateTime;
  Function next, previous;
  GlocoGraph({
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

  double minValue = 30, maxValue = 140;
  @override
  Widget build(BuildContext context) {
    if (dataList.length > 1) {
      maxValue = dataList
          .reduce(
              (current, next) => current.value > next.value ? current : next)
          .value
          .toDouble();
      minValue = dataList
          .reduce(
              (current, next) => current.value < next.value ? current : next)
          .value
          .toDouble();
    }

    return Container(
      color: Color(0x00f5f5f5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                child: Row(
                  children: [
                    TransButtonText(
                      lable: 'Day',
                      onTab: () {
                        dayTab();
                      },
                      state: selectedView == SelectedView.daySelected,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TransButtonText(
                      lable: 'Week',
                      onTab: () {
                        weekTab();
                      },
                      state: selectedView == SelectedView.weeekSelected,
                    ),
                    SizedBox(
                      width: 5,
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
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          Container(
            color: Color(0xf5f5f5),
            // color: Colors.white,
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
              ),
              primaryYAxis: NumericAxis(
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
              palette: <Color>[Colors.red],

              series: <ScatterSeries<GlucoseTimedData, DateTime>>[
                ScatterSeries<GlucoseTimedData, DateTime>(
                    dataSource: dataList,
                    xValueMapper: (GlucoseTimedData values, _) =>
                        values.timeStamp,
                    yValueMapper: (GlucoseTimedData values, _) => values.value,
                    color: Colors.amber
                    // gradient: LinearGradient(
                    //   colors: [Color.fromARGB(255, 255, 0, 0), Color(0x0Fffffff)],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                    ),
              ],
            ),
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
