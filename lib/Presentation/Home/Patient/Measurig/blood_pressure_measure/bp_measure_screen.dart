import 'dart:math';
import 'package:e_health/Presentation/Home/Patient/Measurig/blood_pressure_measure/bp_measure_bloc.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/blood_pressure_measure/bp_measure_event.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/blood_pressure_measure/bp_measure_state.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/widgets/error_box.dart';
import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_widget.dart';
import 'package:e_health/Services/ehealth_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

class BloodPressureMeasureScreen extends StatelessWidget {
  BloodPressureMeasureScreen({super.key});

  TextStyle reesultTextStyle = TextStyle(
      fontSize: 65.sp, color: Color(0xAF0F0F0F), fontWeight: FontWeight.w200);
  TextStyle stateTextStyle = TextStyle(
      fontSize: 35.sp, color: Color(0x9F0F0F0F), fontWeight: FontWeight.w300);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BloodPressureMeasureBloc(),
      child: BlocBuilder<BloodPressureMeasureBloc, BloodPressureMeasureState>(
        builder: (context, state) {
          if (state is DeviceNotConnected) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              // Add Your Code here.
              await HandshakeDiag.showDiag(context);
              if (EhealthModule.deviceAddr == null)
                context
                    .read<BloodPressureMeasureBloc>()
                    .add(DeviceCOnnectionFailed());
              else
                context
                    .read<BloodPressureMeasureBloc>()
                    .add(DeviceConnectionSucceed());
            });
          }
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 700,
              width: MediaQuery.of(context).size.width - 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.sp,
                              ),
                              Transform.rotate(
                                angle: state is BloodPressureMeasureDef
                                    ? math.pi
                                    : 0,
                                child: Lottie.asset(
                                  state is BloodPressureMeasureInitDevice
                                      ? 'assets/lottie/loading-green.json'
                                      : state is BloodPressureMeasureStartPump
                                          ? 'assets/lottie/arrow_up_yellow.json'
                                          : state is BloodPressureMeasureInf
                                              ? 'assets/lottie/arrow_up_green.json'
                                              : state is BloodPressureMeasureDef
                                                  ? 'assets/lottie/arrow_up_green.json'
                                                  : state is GotBloodPressureMeasureRespence
                                                      ? 'assets/lottie/blood_pressure.json'
                                                      : state is DeviceFailedToConnected
                                                          ? 'assets/lottie/error.json'
                                                          : state is BloodPressureMeasureMeassureError
                                                              ? 'assets/lottie/failed.json'
                                                              : 'assets/lottie/blood_pressure.json',
                                  height: 80.sp,
                                  frameRate: FrameRate(240),
                                  repeat: !(state
                                      is BloodPressureMeasureMeassureError),
                                ),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                state is BloodPressureMeasureInitDevice
                                    ? 'Initializing Device'
                                    : state is BloodPressureMeasureStartPump
                                        ? 'Start Pumping'
                                        : state is BloodPressureMeasureInf
                                            ? 'Inflating'
                                            : state is BloodPressureMeasureDef
                                                ? 'Measuring'
                                                : state is GotBloodPressureMeasureRespence
                                                    ? '${state.bloodPressureResult.systolicSPressure}/${state.bloodPressureResult.diastolicPressure}'
                                                    : state is BloodPressureMeasureMeassureError
                                                        ? 'Measurement failed'
                                                        : '_ _',
                                style: state is GotBloodPressureMeasureRespence
                                    ? reesultTextStyle
                                    : stateTextStyle,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                state is GotBloodPressureMeasureRespence
                                    ? "mg/dL"
                                    : '',
                                style: TextStyle(
                                  fontSize: 25.sp,
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
                  SizedBox(
                    height: 50.sp,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<BloodPressureMeasureBloc>()
                          .add(SendBloodPressureMeasureRequest());
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
                  SizedBox(
                    height: 50.sp,
                  ),
                  state is DeviceFailedToConnected
                      ? RecErrorBox(errorText: "Failed to connect to Device")
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
