import 'package:e_health/Presentation/Home/Patient/Measurig/widgets/select_butt.dart';
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
  GlocoGraph({
    super.key,
    required this.dataList,
    required this.selectedView,
    required this.dayTab,
    required this.monthTab,
    required this.weekTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x00f5f5f5),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              TransButton(
                lable: 'Day',
                onTab: () {
                  dayTab();
                },
                state: selectedView == SelectedView.daySelected,
              ),
              SizedBox(
                width: 10,
              ),
              TransButton(
                lable: 'Week',
                onTab: () {
                  weekTab();
                },
                state: selectedView == SelectedView.weeekSelected,
              ),
              SizedBox(
                width: 10,
              ),
              TransButton(
                lable: 'Month',
                onTab: () {
                  monthTab();
                },
                state: selectedView == SelectedView.monthSelected,
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
                    ? DateTimeIntervalType.minutes
                    : DateTimeIntervalType.days,
                axisLine: AxisLine(color: Color(0x00000000)),
                majorGridLines: MajorGridLines(
                  color: Color(0x00000000),
                ),
              ),
              primaryYAxis: NumericAxis(
                // interval: 10,
                minimum: 30,
                // maximum: 130,
                axisLine: AxisLine(color: Color(0x00000000)),
                majorGridLines: MajorGridLines(
                  color: Color(0x0F000000),
                ),
              ),
              // primaryXAxis: CategoryAxis(),
              palette: <Color>[Colors.red],

              series: <ChartSeries<GlucoseTimedData, DateTime>>[
                LineSeries<GlucoseTimedData, DateTime>(
                    dataSource: dataList,
                    xValueMapper: (GlucoseTimedData sales, _) =>
                        sales.timeStamp,
                    yValueMapper: (GlucoseTimedData sales, _) => sales.value,
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
        ],
      ),
    );
  }
}
