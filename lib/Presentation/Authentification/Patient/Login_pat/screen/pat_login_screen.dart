import 'dart:developer';

import 'package:e_health/Presentation/Authentification/Commun/widgets/blue_button.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/buttom_text.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatLoginScreen extends StatefulWidget {
  const PatLoginScreen({Key? key}) : super(key: key);

  @override
  State<PatLoginScreen> createState() => _PatLoginScreenState();
}

class _PatLoginScreenState extends State<PatLoginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double femm = 1 * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          // padding: EdgeInsets.fromLTRB(28 * 1, 131 * 1, 29 * 1, 29 * 1),
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
                child: Padding(
                  padding: EdgeInsets.fromLTRB(28 * 1, 131 * 1, 29 * 1, 29 * 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          SizedBox(height: 40 * 1),
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
                              log(String);
                            },
                            hintText: 'Email',
                            prefixIcon: Icon(FontAwesomeIcons.envelope),
                          ),
                          SizedBox(height: 15.sp),
                          CostumeTextField(
                            onChanged: (String) {},
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: GestureDetector(
                              onTap: (() {
                                log('message');
                                //      BlocProvider.of<AuthBloc>(context).add(
                                //      PasswordVisibiltyChangeEvent(
                                //      !context.read<AuthBloc>().state.passwordVisible));
                              }),
                              child: Icon(FontAwesomeIcons.eye),
                            ),
                            hide: true,
                          ),
                          SizedBox(height: 2.sp),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 7.sp),
                              Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity:
                                    VisualDensity(horizontal: -4, vertical: -4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.sp),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                      width: 2.0.sp,
                                      color: Color.fromARGB(100, 33, 150, 243)),
                                ),
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
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
                          BlueButton(
                            title: 'Sign In',
                            onPressed: () {
                              log('message');
                            },
                          ),
                        ],
                      ),
                      BottomText(
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
            ],
          ),
        ),
      ),
    );
  }
}
