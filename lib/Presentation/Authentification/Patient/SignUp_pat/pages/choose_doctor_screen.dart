import 'dart:developer';

import 'package:e_health/Presentation/Authentification/Commun/Models/Doctor_data_model.dart';
import 'package:e_health/Presentation/Widgets/blue_button.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/doctor_block_widget.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/bloc/path_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ChooseDoctorScreen extends StatefulWidget {
  const ChooseDoctorScreen();

  @override
  State<ChooseDoctorScreen> createState() => _ChooseDoctorScreenState();
}

class _ChooseDoctorScreenState extends State<ChooseDoctorScreen> {
  String docUid = '';
  late PatSignUpBloc _patSignUpBloc;

  @override
  void initState() {
    super.initState();
    // _patSignUpBloc = PatSignUpBloc();
    _patSignUpBloc = BlocProvider.of<PatSignUpBloc>(context);
    _patSignUpBloc.add(GetDoctorsEvent());
  }

  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<PatSignUpBloc>(context).state;
    int selectedDoctor = -1;
    return BlocListener<PatSignUpBloc, PatSignUpState>(
      listener: (context, state) {
        if (state.accStatus == CreateAccStatus.success) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Your Account has been created successfully',
            btnCancel: null,
            btnOkOnPress: () {
              Navigator.pushNamed(context, '/pat/Home');
            },
          )..show();
        }
        if (state.accStatus == CreateAccStatus.fail) {
          log('fail');
          AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Your Account has not been created',
              desc: state.errorMessage,
              btnOk: null,
              btnCancelOnPress: () {},
              btnCancelText: 'Ok')
            ..show();
        }
      },
      child: BlocBuilder<PatSignUpBloc, PatSignUpState>(
        builder: (context, state) {
          return Scaffold(
            body: (state.status == Status.loadingDoctors)
                ? Center(
                    child: Lottie.asset(
                      'assets/lottie/loading-green.json',
                      height: 100,
                      frameRate: FrameRate(120),
                    ),
                  )
                : Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Color(0xfff5f5f5),
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ResponsiveWrapper.of(context).isLargerThan(TABLET)
                            ? Expanded(
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.blue,
                                  child: Center(
                                    child: Text(
                                      'Welcome to Ehealth',
                                      style: TextStyle(
                                          fontSize: 60.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(20.sp, 50.sp, 20.sp, 20.sp),
                            child: Stack(
                              children: [
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0, 14.sp, 0.sp, 50.sp),
                                    child: (state.doctors.length != 0)
                                        ? ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: state.doctors.length,
                                            itemBuilder:
                                                (BuildContext ctx, index) {
                                              List<DoctorDataModel> doctor =
                                                  state.doctors;
                                              return DoctorBlockWidget(
                                                docName: doctor[index].fullName,
                                                specialist:
                                                    doctor[index].speciality,
                                                hospital: doctor[index]
                                                        .hosName +
                                                    ' | ' +
                                                    doctor[index].hosAddress,
                                                email: doctor[index].email,
                                                color: (index == selectedDoctor)
                                                    ? Color(0xffA2E2A5)
                                                    : Colors.white,
                                                onPressed: () {
                                                  setState(() {
                                                    selectedDoctor = index;
                                                  });
                                                  log(selectedDoctor.toString());
                                                  docUid = state
                                                      .doctors[index].id
                                                      .toString();
                                                  _patSignUpBloc.add(
                                                      PatSignDocUIDEvent(
                                                          docUid: docUid));
                                                },
                                              );
                                            },
                                          )
                                        : Container(),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topCenter,
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(0, 0, 92.sp, 5.sp),
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.pop(context);
                                            _patSignUpBloc.add(
                                                PatChangePageEvent(page: 1));
                                          },
                                          child: Icon(Icons.arrow_back),
                                        ),
                                        SizedBox(width: 28.sp), //nothing
                                        Text(
                                          'Choose your doctor',
                                          style: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: (state.accStatus !=
                                          CreateAccStatus.loading)
                                      ? BlueButton(
                                          title: 'Continue',
                                          onPressed: () {
                                            _patSignUpBloc
                                                .add(PatCreateAccountEvent());
                                          },
                                        )
                                      : ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff3f51b5),
                                            minimumSize: Size(330.sp, 50.sp),
                                            maximumSize: Size(330.sp, 50.sp),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.sp),
                                            ),
                                          ),
                                          child: Lottie.asset(
                                            'assets/lottie/loading-green.json',
                                            height: 100,
                                            frameRate: FrameRate(120),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
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
