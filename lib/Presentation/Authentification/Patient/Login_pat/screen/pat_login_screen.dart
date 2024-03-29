import 'dart:developer';

import 'package:e_health/Presentation/Widgets/blue_button.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/buttom_text.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:e_health/Presentation/Authentification/Patient/Login_pat/bloc/pat_login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class PatLoginScreen extends StatefulWidget {
  const PatLoginScreen({Key? key}) : super(key: key);

  @override
  State<PatLoginScreen> createState() => _PatLoginScreenState();
}

class _PatLoginScreenState extends State<PatLoginScreen> {
  bool isChecked = false;
  late PatLoginBloc _patSignUpBloc;

  @override
  void initState() {
    super.initState();
    _patSignUpBloc = PatLoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double femm = 1 * 0.97;

    return Scaffold(
      body: BlocProvider.value(
        value: _patSignUpBloc,
        child: BlocListener<PatLoginBloc, PatLoginState>(
          listener: (context, state) {
            if (state.status == Status.accountSuccess) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                title: 'You have been logged in succesfully',
                btnCancel: null,
                btnOkOnPress: () {
                  Navigator.pushNamed(context, '/pat/Home');
                },
              )..show();
            }
            if (state.status == Status.accountFail) {
              log('fail');
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Failed to load your account',
                  desc: state.errorMessage,
                  btnOk: null,
                  btnCancelOnPress: () {},
                  btnCancelText: 'Ok')
                ..show();
            }
          },
          child: BlocBuilder<PatLoginBloc, PatLoginState>(
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0xfff5f5f5),
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:
                              EdgeInsets.fromLTRB(28.sp, 131.sp, 29.sp, 28.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'LOGO',
                                    style: TextStyle(
                                      fontSize: 80.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff3f51b5),
                                    ),
                                  ),
                                  SizedBox(height: 40.sp),
                                  Text(
                                    'Log in to Account',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  SizedBox(height: 40.sp),
                                  CostumeTextField(
                                    onChanged: (String) {
                                      BlocProvider.of<PatLoginBloc>(context)
                                          .add(PatEmailEvent(email: String));
                                    },
                                    hintText: 'Email',
                                    prefixIcon: Icon(FontAwesomeIcons.envelope),
                                  ),
                                  SizedBox(height: 15.sp),
                                  CostumeTextField(
                                    onChanged: (String) {
                                      BlocProvider.of<PatLoginBloc>(context)
                                          .add(PatPasswordEvent(
                                              password: String));
                                    },
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.lock_outline),
                                    suffixIcon: GestureDetector(
                                      onTap: (() {
                                        log(state.email);
                                      }),
                                      child: Icon(FontAwesomeIcons.eye),
                                    ),
                                    hide: true,
                                  ),
                                  SizedBox(height: 2.sp),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 7.sp),
                                      Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity(
                                            horizontal: -4, vertical: -4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                        ),
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                          (states) => BorderSide(
                                              width: 2.0.sp,
                                              color: Color.fromARGB(
                                                  100, 33, 150, 243)),
                                        ),
                                        checkColor: Colors.white,
                                        value: state.rememberMe,
                                        onChanged: (bool? value) {
                                          BlocProvider.of<PatLoginBloc>(context)
                                              .add(PatRememberMeEvent(
                                                  remember: value));
                                        },
                                      ),
                                      SizedBox(width: 5.sp),
                                      Text(
                                        'Remember me',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.sp),
                                  (state.status != Status.loadingAccount)
                                      ? BlueButton(
                                          title: 'Sign In',
                                          onPressed: () async {
                                            log(state.status.toString());
                                            _patSignUpBloc
                                                .add(PatCreateEvent());
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
                                ],
                              ),
                              SizedBox(height: 50.sp),
                              BottomText(
                                //nothing
                                text1: 'Don’t have an account? ',
                                text2: 'Sign Up',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/pat/signUp');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
