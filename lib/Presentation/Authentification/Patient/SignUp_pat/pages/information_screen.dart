import 'dart:developer';

import 'package:e_health/Presentation/Authentification/Commun/widgets/blue_button.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/buttom_text.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/costume_drop_down_menu.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/bloc/path_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  String? selected = null  , selected2 = null;
  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.fromLTRB(28, 57, 29, 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 92.sp, 14.sp),
                            width: double.infinity,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<PatSignUpBloc>(context)
                                        .add(PatChangePageEvent(page: 0));
                                  },
                                  child: Icon(Icons.arrow_back),
                                ),
                                SizedBox(width: 28.sp),
                                Text(
                                  'Fill Your Profile',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30.sp),
                            width: 200.sp,
                            height: 200.sp,
                            child: Image.asset(
                              'assets/images/fill_info.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          CostumeTextField(
                            hintText: 'First Name',
                            onChanged: (String) {},
                          ),
                          SizedBox(height: 15.sp),
                          CostumeTextField(
                            hintText: 'Last Name',
                            onChanged: (String) {},
                          ),
                          SizedBox(height: 15.sp),
                          CostumeTextField(
                            hintText: 'Date of Birth',
                            onChanged: (String) {},
                            suffixIcon: GestureDetector(
                              onTap: (() {
                                log('message');
                              }),
                              child: Icon(FontAwesomeIcons.calendar),
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CostumeTextField(
                                onChanged: (String) {},
                                small: true,
                                hintText: 'Weight (Kg)',
                              ),
                              CustomDropDownMenu(
                                selectedValue: selected,
                                list: list,
                                hint: 'Blood Group',
                                small: true,
                                onChanged: (String? value) {
                                  log(value.toString());
                                  setState(() {
                                    selected = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 15.sp),
                          CustomDropDownMenu(
                            selectedValue: selected2,
                            list: list,
                            hint: 'Gender',
                            onChanged: (String? value) {
                              log(value.toString());
                              setState(() {
                                selected2 = value;
                              });
                            },
                          ),
                          SizedBox(height: 15.sp),
                          CostumeTextField(
                            onChanged: (String) {},
                            hintText: 'Phone Number',
                            suffixIcon: GestureDetector(
                              onTap: (() {
                                log('message');
                              }),
                              child: Icon(FontAwesomeIcons.phone),
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          BlueButton(
                            title: 'Next',
                            onPressed: () {
                              // log('message');
                              BlocProvider.of<PatSignUpBloc>(context)
                                  .add(PatChangePageEvent(page: 2));
                            },
                          ),
                        ],
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