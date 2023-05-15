// import 'dart:developer';
//
// import 'package:e_health/Presentation/Authentification/Commun/widgets/blue_button.dart';
// import 'package:e_health/Presentation/Authentification/Commun/widgets/buttom_text.dart';
// import 'package:e_health/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
// import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/bloc/path_auth_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class EmailScreen extends StatefulWidget {
//   const EmailScreen();
//
//   @override
//   State<EmailScreen> createState() => _EmailScreenState();
// }
//
// class _EmailScreenState extends State<EmailScreen> {
//   late PatSignUpBloc _patSignUpBloc;
//
//   @override
//   void initState() {
//     super.initState();
//     _patSignUpBloc = PatSignUpBloc();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 390;
//     // double 1 = MediaQuery.of(context).size.width / baseWidth;
//     // double 1 = 1 * 0.97;
//
//     return BlocProvider.value(
//       value: _patSignUpBloc,
//       child: BlocListener<PatSignUpBloc, PatSignUpState>(
//         listener: (context, state) {},
//         child: BlocBuilder<PatSignUpBloc, PatSignUpState>(
//           builder: (context, state) {
//             return Scaffold(
//               body: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Container(
//                   // padding: EdgeInsets.fromLTRB(28 * 1, 131 * 1, 29 * 1, 28 * 1),
//                   width: double.infinity,
//                   height: MediaQuery.of(context).size.height,
//                   decoration: BoxDecoration(
//                     color: Color(0xfff5f5f5),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/background.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ResponsiveWrapper.of(context).isLargerThan(TABLET)
//                           ? Expanded(
//                               child: Container(
//                                 height: MediaQuery.of(context).size.height,
//                                 color: Colors.blue,
//                                 child: Center(
//                                   child: Text(
//                                     'Welcome to Ehealth',
//                                     style: TextStyle(
//                                         fontSize: 60.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : Container(),
//                       Expanded(
//                         child: SingleChildScrollView(
//                           child: Padding(
//                             padding: EdgeInsets.fromLTRB(
//                                 28.sp, 131.sp, 29.sp, 28.sp),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       'LOGO',
//                                       style: TextStyle(
//                                         fontSize: 80.sp,
//                                         fontWeight: FontWeight.w700,
//                                         // height: (1.2175 * 1 / 1),
//                                         color: Color(0xff3f51b5),
//                                       ),
//                                     ),
//                                     SizedBox(height: 40.sp),
//                                     Text(
//                                       'Create New Account',
//                                       style: TextStyle(
//                                         fontSize: 25.sp,
//                                         fontWeight: FontWeight.w600,
//                                         // height: 1.2175 * 1 / 1,
//                                         color: Color(0xff000000),
//                                       ),
//                                     ),
//                                     SizedBox(height: 40.sp),
//                                     CostumeTextField(
//                                       onChanged: (String value) {
//                                         _patSignUpBloc.add(
//                                             PatSignEmailEvent(email: value));
//                                       },
//                                       hintText: 'Email',
//                                       prefixIcon:
//                                           Icon(FontAwesomeIcons.envelope),
//                                     ),
//                                     SizedBox(height: 15.sp),
//                                     CostumeTextField(
//                                       onChanged: (String value) {
//                                         _patSignUpBloc.add(PatSignPasswordEvent(
//                                             password: value));
//                                       },
//                                       hintText: 'Password',
//                                       prefixIcon: Icon(Icons.lock_outline),
//                                       suffixIcon: GestureDetector(
//                                         onTap: (() {
//                                           log('message');
//                                         }),
//                                         child: Icon(FontAwesomeIcons.eye),
//                                       ),
//                                       hide: true,
//                                     ),
//                                     SizedBox(height: 20.sp),
//                                     BlueButton(
//                                       title: 'Sign Up',
//                                       onPressed: () {
//                                         Navigator.pushNamed(
//                                             context, '/pat/signUp/info');
//                                         // BlocProvider.of<PatSignUpBloc>(context)
//                                         //     .add(PatChangePageEvent(page: 1));
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 50.sp),
//                                 BottomText(
//                                   text1: 'Already have an account? ',
//                                   text2: 'Sign in',
//                                   onPressed: () {
//                                     Navigator.pushReplacementNamed(
//                                         context, '/pat/signIn');
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:e_health/Presentation/Widgets/blue_button.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/buttom_text.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/bloc/path_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen();
  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  late PatSignUpBloc _patSignUpBloc;

  @override
  void initState() {
    super.initState();
    _patSignUpBloc = BlocProvider.of<PatSignUpBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    // double 1 = MediaQuery.of(context).size.width / baseWidth;
    // double 1 = 1 * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // padding: EdgeInsets.fromLTRB(28 * 1, 131 * 1, 29 * 1, 28 * 1),
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(28.sp, 131.sp, 29.sp, 28.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'LOGO',
                              style: TextStyle(
                                fontSize: 80.sp,
                                fontWeight: FontWeight.w700,
                                // height: (1.2175 * 1 / 1),
                                color: Color(0xff3f51b5),
                              ),
                            ),
                            SizedBox(height: 40.sp),
                            Text(
                              'Create New Account',
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                // height: 1.2175 * 1 / 1,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(height: 40.sp),
                            CostumeTextField(
                              onChanged: (String value) {
                                _patSignUpBloc
                                    .add(PatSignEmailEvent(email: value));
                              },
                              hintText: 'Email',
                              prefixIcon: Icon(FontAwesomeIcons.envelope),
                            ),
                            SizedBox(height: 15.sp),
                            CostumeTextField(
                              onChanged: (String value) {
                                _patSignUpBloc
                                    .add(PatSignPasswordEvent(password: value));
                              },
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: GestureDetector(
                                onTap: (() {
                                  log('message');
                                }),
                                child: Icon(FontAwesomeIcons.eye),
                              ),
                              hide: true,
                            ),
                            SizedBox(height: 20.sp),
                            BlueButton(
                              title: 'Sign Up',
                              onPressed: () {

                                // Navigator.pushNamed(
                                //     context, '/pat/signUp/info');

                                BlocProvider.of<PatSignUpBloc>(context)
                                    .add(PatChangePageEvent(page: 1));
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 50.sp),
                        BottomText(
                          text1: 'Already have an account? ',
                          text2: 'Sign in',
                          onPressed: () {
                            // Navigator.pushReplacementNamed(
                            //     context, '/pat/signIn');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// showDialog<void>(
// context: context,
// barrierDismissible:
// false, // user must tap button!
// builder: (_) {
// return Dialog(
// shape:
// RoundedRectangleBorder(
// borderRadius:
// BorderRadius
//     .circular(20),
// ),
// backgroundColor:
// Colors.transparent,
// child: Stack(
// children: <Widget>[
// Container(
// padding:
// EdgeInsets.only(
// left: 10,
// top: 50,
// right: 10,
// bottom: 10),
// margin:
// EdgeInsets.only(
// top: 40),
// decoration:
// BoxDecoration(
// shape: BoxShape
//     .rectangle,
// color:
// Colors.white,
// borderRadius:
// BorderRadius
//     .circular(
// 20),
// ),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment
//     .center,
// mainAxisSize:
// MainAxisSize
//     .min,
// children: <
// Widget>[
// Lottie.asset(
// 'assets/lottie/loading-green.json',
// height: 60,
// width: double
//     .infinity,
// )
// ],
// ),
// ),
// ],
// ),
// );
// },
// );
