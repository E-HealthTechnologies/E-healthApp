import 'package:e_health/Presentation/Home/Patient/Measurig/Screens/blood_pressure.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/Screens/glucose_screen.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/Screens/heart_beat_screen.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/Screens/tempuratue_screen.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_container/tab_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatMeasuringScreen extends StatefulWidget {
  PatMeasuringScreen();

  @override
  State<PatMeasuringScreen> createState() => _PatHomeScreenState();
}

class _PatHomeScreenState extends State<PatMeasuringScreen> {
  late PatMeasuringBloc _patMeasuringBloc;
  final User? user = FirebaseAuth.instance.currentUser;

  void initState() {
    super.initState();
    _patMeasuringBloc = PatMeasuringBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _patMeasuringBloc,
      child: BlocListener<PatMeasuringBloc, PatMeasuringState>(
        listener: (context, state) {},
        child: BlocBuilder<PatMeasuringBloc, PatMeasuringState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                body: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(11.sp, 0.sp, 11.sp, 20.sp),
                    child: TabContainer(
                      color: Theme.of(context).colorScheme.secondary,
                      children: [
                        TemperatureScreen(),
                        BloodPressureScreen(uid: user!.uid),
                        GlucoseScreen(),
                        HeartBeatScreen(),
                      ],
                      selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                      ),
                      // isStringTabs: false,
                      tabs: [
                        'Temperature',
                        'Blood Pressure',
                        'Glucose',
                        'Heart Beat',
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class InfoBoxWidget extends StatelessWidget {
  const InfoBoxWidget(
      {required this.icon, required this.title, required this.value});
  final Widget icon;
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(22.69.sp, 17.53.sp, 18.7.sp, 30.sp),
      width: 160.sp,
      height: 140.sp,
      decoration: BoxDecoration(
        color: Color(0xfff5e1e9),
        borderRadius: BorderRadius.circular(24.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Icon(
                Icons.more_horiz,
                size: 20.sp,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp),
              ),
              FittedBox(
                child: Text(
                  value,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 25.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
