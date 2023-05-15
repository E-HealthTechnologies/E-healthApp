import 'dart:developer';

import 'package:e_health/Presentation/Widgets/blue_button.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/buttom_text.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:e_health/Presentation/Authentification/Doctor/SignUp_doc/bloc/doc_sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocEmailScreen extends StatefulWidget {
  const DocEmailScreen();

  @override
  State<DocEmailScreen> createState() => _DocEmailScreenState();
}

class _DocEmailScreenState extends State<DocEmailScreen> {
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
                  padding: EdgeInsets.fromLTRB(28, 131, 29, 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 38),
                            child: Text(
                              'LOGO',
                              style: TextStyle(
                                fontSize: 80.sp,
                                fontWeight: FontWeight.w700,
                                // height: (1.2175 * 1 / 1),
                                color: Color(0xff3f51b5),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(1, 0, 0, 40),
                            child: Text(
                              'Welcome Doctor \nCreate Your Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                // height: 1.2175 * 1 / 1,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(1, 0, 0, 15),
                            child: CostumeTextField(
                              onChanged: (String value) {
                                BlocProvider.of<DocSignUpBloc>(context)
                                    .add(DocSignEmailEvent(email: value));
                              },
                              hintText: 'Email',
                              prefixIcon: Icon(FontAwesomeIcons.envelope),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(1, 0, 0, 15),
                            child: CostumeTextField(
                              onChanged: (String value) {
                                BlocProvider.of<DocSignUpBloc>(context)
                                    .add(DocSignPasswordEvent(password: value));
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
                          ),
                          BlueButton(
                            //nothing
                            title: 'Sign Up',
                            onPressed: () {
                              // Navigator.pushNamed(context, '/pat/signUp/info');
                              BlocProvider.of<DocSignUpBloc>(context)
                                  .add(DocChangePageEvent(page: 1));
                            },
                          ),
                        ],
                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}