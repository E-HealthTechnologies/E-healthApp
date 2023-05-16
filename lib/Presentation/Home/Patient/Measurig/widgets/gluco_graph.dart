import 'package:e_health/Services/graph_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GlocoGraph extends StatelessWidget {
  late List<GlucoseTimedData> dataList;
  late bool isDaySelected, isMonthSelected, isWeekSelected;
  GlocoGraph({
    super.key,
    required this.dataList,
    required this.isDaySelected,
    required this.isWeekSelected,
    required this.isMonthSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Color(0x00f5f5f5),
        // color: Colors.white,
        child: SfCartesianChart(
          borderWidth: 0,
          plotAreaBorderWidth: 0,

          // Initialize category axis
          primaryXAxis: DateTimeAxis(
            // minimum: DateTime.parse("2023-05-16 13:50:33.396256"),
            // maximum: DateTime.parse("2023-07-05 13:50:40.059106"),
            axisLine: AxisLine(color: Color(0x00000000)),
            majorGridLines: MajorGridLines(
              color: Color(0x00000000),
            ),
          ),
          primaryYAxis: NumericAxis(
            // interval: 10,
            // minimum: 50,
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
                xValueMapper: (GlucoseTimedData sales, _) => sales.timeStamp,
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
    );
  }
}
