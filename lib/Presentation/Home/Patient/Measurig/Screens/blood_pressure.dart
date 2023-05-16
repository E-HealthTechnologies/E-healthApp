import 'dart:developer';

import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_bloc.dart';
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
  late PatMeasuringBloc _patMeasuringBloc;

  @override
  void initState() {
    super.initState();
    _patMeasuringBloc = BlocProvider.of<PatMeasuringBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data;
    List<GlucoseTimedData> smallList = [];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(
        //   'Click to start measuring',
        //   style: TextStyle(
        //     fontWeight: FontWeight.w400,
        //     fontSize: 15.sp,
        //     color: Colors.white,
        //   ),
        // ),
        // SizedBox(height: 20.sp),
        ElevatedButton(
          onPressed: () async {
            GetDataServices service = GetDataServices();
            data = await service.getMeasurementData(
                uid: widget.uid, type: 'Glucose');
            print(data.length);
            smallList = GraphService.glucoDayData(
                bigList: TimedData(data),
                dateTime: DateTime.parse("2023-07-02 10:50:40.056570"));
            print(smallList.length.toString());
            for (int i = 0; i < smallList.length; i++) {
              log(smallList[i].value.toString());
            }
            _patMeasuringBloc
                .add(GetDataEvent(data: data, dataList: smallList));
            print(smallList.length);
            /** **************** */
            // for (int i = 1; i < 50; i++) {
            //   var rnd = Random();
            //   int min = 70;
            //   int max = 150;
            //   int value = min + rnd.nextInt(max - min);
            //   final json = {
            //     // 'Date': DateFormat.yMd()
            //     //     .add_jm()
            //     //     .format(DateTime.now().add(Duration(days: i))),
            //     'Date': DateTime.now().add(Duration(days: i, hours: i)),
            //     'Value': value,
            //     // 'Value big': value~/2,
            //   };
            //   StoreDataServices service = StoreDataServices();
            //   service.uploadData(
            //     uid: widget.uid,
            //     type: 'Blood Pressure',
            //     data: json,
            //   );
            // }
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
        SizedBox(height: 40.sp),
        Container(
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
                    dataSource: _patMeasuringBloc.state.dataList,
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
        ),
      ],
    );
  }
}
