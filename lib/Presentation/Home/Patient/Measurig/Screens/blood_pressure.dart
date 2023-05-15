import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_bloc.dart';
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
    List<SalesData> dataList = [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Click to start measuring',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20.sp),
        ElevatedButton(
          onPressed: () async {
            // GetDataServices service = GetDataServices();
            // data = await service.getMeasurementData(
            //     uid: widget.uid, type: 'Glucose');
            // print(data.length);
            // for (int i = 0; i < data.length; i++) {
            //   dataList.add(
            //       SalesData(value: data[i]['Value'], date: data[i]['Date']));
            // }
            //
            // _patMeasuringBloc.add(GetDataEvent(data: data, dataList: dataList));
            // print(dataList.length);

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
            //     'Date' : DateTime.now().add(Duration(days: i , hours: i)),
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
        SizedBox(height: 20.sp),
        Container(
          child: SfCartesianChart(
            backgroundColor: Colors.white,
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                dataSource: _patMeasuringBloc.state.dataList,
                xValueMapper: (SalesData sales, _) => sales.date,
                yValueMapper: (SalesData sales, _) => sales.value,
              ),
            ],
            // primaryYAxis: ,
          ),
        ),
      ],
    );
  }
}

class SalesData {
  SalesData({required this.value, required this.date});
  final String date;
  final int value;
}
