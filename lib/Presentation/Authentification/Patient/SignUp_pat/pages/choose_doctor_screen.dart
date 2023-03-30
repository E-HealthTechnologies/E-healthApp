import 'dart:developer';

import 'package:e_health/Presentation/Authentification/Commun/widgets/blue_button.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/buttom_text.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/costume_drop_down_menu.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/doctor_block_widget.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/bloc/path_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseDoctorScreen extends StatefulWidget {
  const ChooseDoctorScreen({Key? key}) : super(key: key);

  @override
  State<ChooseDoctorScreen> createState() => _ChooseDoctorScreenState();
}

class _ChooseDoctorScreenState extends State<ChooseDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                padding: EdgeInsets.fromLTRB(20.sp, 50.sp, 20.sp, 20.sp),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 14.sp, 0.sp, 50.sp),
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (BuildContext ctx, index) {
                            return DoctorBlockWidget(
                              docName: 'Dr. Fleen Lflenni',
                              specialist: 'Cardiologue',
                              hospital: 'Hospital d’Alger',
                              email: 'Example@gmail.com',
                              color: (index == 1)
                                  ? Color(0xffA2E2A5)
                                  : Colors.white,
                              onPressed: () {
                                log(index.toString());
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 92.sp, 5.sp),
                        width: double.infinity,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<PatSignUpBloc>(context)
                                    .add(PatChangePageEvent(page: 1));
                              },
                              child: Icon(Icons.arrow_back),
                            ),
                            SizedBox(width: 28.sp),//nothing
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
                      child: BlueButton(
                        title: 'Continue',
                        onPressed: () {
                          // BlocProvider.of<PatSignUpBloc>(context)
                          //     .add(PatChangePageEvent(page: 1));
                        },
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
  }
}
