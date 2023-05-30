import 'dart:developer';

import 'package:e_health/Presentation/Home/Patient/Measurig/heart_beat_measure/heart_beat_measure_bloc.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/heart_beat_measure/heart_beat_measure_event.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/heart_beat_measure/heart_beat_measure_state.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/widgets/error_box.dart';
import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_widget.dart';
import 'package:e_health/Services/ehealth_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'dart:math' as math;

class HeartBeatMeasureScreen extends StatelessWidget {
  HeartBeatMeasureScreen({required this.uid});
  final String uid;
  TextStyle noResultTextStyle = TextStyle(
      fontSize: 65.sp, color: Color(0x3F0F0F0F), fontWeight: FontWeight.w100);
  TextStyle reesultTextStyle = TextStyle(
      fontSize: 65.sp, color: Color(0x9F0F0F0F), fontWeight: FontWeight.w300);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HeartBeatMeasureBloc(),
      child: BlocBuilder<HeartBeatMeasureBloc, HeartBeatMeasureState>(
        builder: (context, state) {
          if (state is DeviceNotConnected) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await HandshakeDiag.showDiag(context);
              if (EhealthModule.deviceAddr == null)
                context
                    .read<HeartBeatMeasureBloc>()
                    .add(DeviceCOnnectionFailed());
              else
                context
                    .read<HeartBeatMeasureBloc>()
                    .add(DeviceConnectionSucceed());
            });
          }
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              // height: 700,
              width: MediaQuery.of(context).size.width - 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300.sp,
                    width: 300.sp,
                    child: Stack(
                      children: [
                        Transform.rotate(
                          angle: math.pi,
                          child: DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 1, // width ÷ height
                            progress:
                                state is HeartBeatMeasureStarted ? 360 : 0,
                            maxProgress: 360,

                            animationDuration: Duration(seconds: 15),
                            corners: StrokeCap.butt,
                            backgroundColor: Color(0xFFE9E9E9),
                            foregroundColor: Color(0xFF49CAAE),
                            foregroundStrokeWidth: 3.sp,
                            backgroundStrokeWidth: 2.sp,
                            animation: true,
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30.sp,
                              ),
                              Lottie.asset(
                                'assets/lottie/simple_heartbeat.json',
                                height: 45.sp,
                                frameRate: FrameRate(60),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                state is GotHeartBeatMeasureRespence
                                    ? "${state.heartBeatResult.heartRate}"
                                    : "_ _",
                                style: state is GotHeartBeatMeasureRespence
                                    ? reesultTextStyle
                                    : noResultTextStyle,
                              ),
                              Text(
                                "BPM",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Color(0xAF0F0F0F),
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<HeartBeatMeasureBloc>()
                          .add(SendHeartBeatMeasureRequest(uid: uid));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff3f51b5),
                      minimumSize: Size(120.sp, 30.sp),
                      maximumSize: Size(120.sp, 40.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.sp),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  state is DeviceFailedToConnected
                      ? RecErrorBox(errorText: "Failed to connect to Device")
                      : state is HeartBeatMeasureMeassureError
                          ? RecErrorBox(errorText: "Measurment error")
                          : state is HeartBeatMeasureWaitingFinger
                              ? RecErrorBox(
                                  errorText:
                                      "Please put your finger on the sensor",
                                  boxColor: Colors.amber,
                                )
                              : RecErrorBox(
                                  errorText: '',
                                  boxColor: Color(0x00),
                                ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
