import 'dart:developer';

import 'package:e_health/Presentation/Home/Patient/DashBoard/bloc/pat_dash_board_bloc.dart';
import 'package:e_health/Presentation/Widgets/PatProfileWidget.dart';
import 'package:e_health/Presentation/Widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class PatDashScreen extends StatefulWidget {
  // PatDashScreen({required this.uid});
  //
  // final String uid;
  PatDashScreen();

  @override
  State<PatDashScreen> createState() => _PatHomeScreenState();
}

class _PatHomeScreenState extends State<PatDashScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  late PatDashBoardBloc _patDashBoardBloc;

  void initState() {
    super.initState();
    _patDashBoardBloc = PatDashBoardBloc();
    _patDashBoardBloc.add(GetPatientEvent(uid: user!.uid));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _patDashBoardBloc,
      child: BlocListener<PatDashBoardBloc, PatDashBoardState>(
        listener: (context, state) {},
        child: BlocBuilder<PatDashBoardBloc, PatDashBoardState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                body: (state.status == DashBoardStatus.loadingPatient)
                    ? Center(
                        child: Lottie.asset(
                          'assets/lottie/loading-green.json',
                          height: 100,
                          frameRate: FrameRate(120),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Container(
                          
                          margin:
                              EdgeInsets.fromLTRB(11.sp, 0.sp, 11.sp, 20.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 0.sp),
                                      child: PatProfileWidget(
                                        name: state.patient.fName +
                                            ' ' +
                                            state.patient.lName,
                                        age: state.patient.dateOfBirth,
                                        weight: state.patient.weight,
                                        blood: state.patient.blood,
                                        sex: state.patient.gender,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.sp),
                                  Text(
                                    'Measurements',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25.sp),
                                  ),
                                  SizedBox(height: 15.sp),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InfoBoxWidget(
                                        icon: Icon(
                                          Icons.bloodtype,
                                          size: 35.sp,
                                        ),
                                        title: 'Blood Pressure',
                                        value: '140/90mmHg',
                                      ),
                                      InfoBoxWidget(
                                        icon: Icon(
                                          Icons.bloodtype_rounded,
                                          size: 35.sp,
                                        ),
                                        title: 'Glucose',
                                        value: '99 mg/dL',
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15.sp),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InfoBoxWidget(
                                        icon: Icon(
                                          Icons.monitor_heart,
                                          size: 35.sp,
                                        ),
                                        title: 'Heart Beat',
                                        value: '40 BPM',
                                      ),
                                      InfoBoxWidget(
                                        icon: Icon(
                                          Icons.hotel_rounded,
                                          size: 35.sp,
                                        ),
                                        title: 'Tempurature',
                                        value: '37 C°',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.sp,
                              ),
                              BlueButton(
                                onPressed: () {
                                  log(state.patient.fName);
                                  log(state.patient.lName);
                                  log(state.patient.weight);
                                  log(state.patient.phone);
                                  log(state.patient.dateOfBirth);
                                  log(state.patient.email);
                                  log(state.patient.password);
                                  log(state.patient.blood);
                                  log(state.patient.gender);
                                },
                                title: 'Start Measuring',
                              ),
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
      padding: EdgeInsets.fromLTRB(22.69.sp, 17.53.sp, 18.7.sp, 20.sp),
      width: 160.sp,
      height: 140.sp,
      decoration: BoxDecoration(
        color: Color(0x5F49CAAE),
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
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp),
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
