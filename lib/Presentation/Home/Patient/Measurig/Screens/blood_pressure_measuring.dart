import 'dart:developer';
import 'dart:math';

import 'package:e_health/Services/StoreDataServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              // context.read<GlucoHistoryBloc>().add(GlucoLoadData(
              //     uid: widget.uid,
              //     dateTime: dateTime,
              //     selectedView: selectedView));
              DateTime refDate = DateTime.now();
              for (int i = 1; i < 50; i++) {
                for (int i = 0; i < 4; i++) {
                  var rnd = Random();
                  int systoMin = 90, diastoMin = 60;
                  int systoMax = 120, diastoMax = 75;
                  int systoValue = systoMin + rnd.nextInt(systoMax - systoMin);
                  int diastoValue =
                      diastoMin + rnd.nextInt(diastoMax - diastoMin);
                  final json = {
                    // 'Date': DateFormat.yMd().add_jm().format(
                    //       DateTime.now().add(
                    //         Duration(
                    //           days: Random().nextInt(1),
                    //           minutes: 20 + Random().nextInt(39),
                    //           hours: Random().nextInt(23),
                    //         ),
                    //       ),
                    //     ),

                    'Date': refDate,
                    'systolicPressure': systoValue,
                    'diastolicPressure': diastoValue,
                    // 'Value big': value~/2,
                  };
                  StoreDataServices service = StoreDataServices();
                  service.uploadData(
                    uid: widget.uid,
                    type: 'Blood Pressure',
                    data: json,
                  );
                  refDate = refDate.add(Duration(
                    minutes: 20 + Random().nextInt(39),
                    hours: Random().nextInt(8),
                  ));
                }
                refDate = refDate.add(Duration(
                  days: 1,
                ));
              }
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
    );
  }
}
