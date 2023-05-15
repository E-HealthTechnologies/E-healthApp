// import 'dart:developer';
//
// import 'package:e_health/Presentation/Authentification/Commun/widgets/blue_button.dart';
// import 'package:e_health/Presentation/Authentification/Commun/widgets/buttom_text.dart';
// import 'package:e_health/Presentation/Authentification/Commun/widgets/costume_drop_down_menu.dart';
// import 'package:e_health/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
// import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/bloc/path_auth_bloc.dart';
// import 'package:e_health/Presentation/Home/Patient/Screens/patient_home_screen.dart';
// import 'package:e_health/Services/AuthenticationServices.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:age_calculator/age_calculator.dart';
//
// class InformationScreen extends StatefulWidget {
//   const InformationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<InformationScreen> createState() => _InformationScreenState();
// }
//
// class _InformationScreenState extends State<InformationScreen> {
//   List<String> blood = <String>['A', 'B', 'AB', 'O'];
//   List<String> gender = <String>['Mle', 'Female'];
//
//   String? selected = null, selected2 = null;
//
//   DateTime date = DateTime(0000, 00, 00);
//
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
//                         child: Padding(
//                           padding: EdgeInsets.fromLTRB(28, 57, 29, 28),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 //nothing
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     margin:
//                                         EdgeInsets.fromLTRB(0, 0, 92.sp, 14.sp),
//                                     width: double.infinity,
//                                     child: Row(
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             Navigator.pop(context);
//                                             // _patSignUpBloc.add(
//                                             //     PatChangePageEvent(page: 0));
//                                           },
//                                           child: Icon(Icons.arrow_back),
//                                         ),
//                                         SizedBox(width: 28.sp),
//                                         Text(
//                                           'Fill Your Profile',
//                                           style: TextStyle(
//                                             fontSize: 25.sp,
//                                             fontWeight: FontWeight.w500,
//                                             color: Color(0xff000000),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(bottom: 30.sp),
//                                     width: 200.sp,
//                                     height: 200.sp,
//                                     child: Image.asset(
//                                       'assets/images/fill_info.png',
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   CostumeTextField(
//                                     hintText: 'First Name',
//                                     onChanged: (String value) {
//                                       _patSignUpBloc
//                                           .add(PatSignFNameEvent(fName: value));
//                                     },
//                                   ),
//                                   SizedBox(height: 15.sp),
//                                   CostumeTextField(
//                                     hintText: 'Last Name',
//                                     onChanged: (String value) {
//                                       _patSignUpBloc
//                                           .add(PatSignLNameEvent(lName: value));
//                                     },
//                                   ),
//                                   SizedBox(height: 15.sp),
//                                   Container(
//                                     margin: EdgeInsets.fromLTRB(0, 0, 3.sp, 0),
//                                     width: 330.sp,
//                                     height: 50.sp,
//                                     child: GestureDetector(
//                                       onTap: (() {
//                                         showDatePicker(
//                                           context: context,
//                                           initialDate: DateTime.now(),
//                                           firstDate: DateTime(1900),
//                                           lastDate: DateTime.now(),
//                                         ).then((date) {
//                                           setState(() {
//                                             // date = value!;
//                                             _patSignUpBloc.add(PatSignBirthEvent(
//                                                 birth:
//                                                     "${date!.day}-${date.month}-${date.year}"));
//                                           });
//                                         });
//                                       }),
//                                       child: TextField(
//                                         enabled: false,
//                                         style: TextStyle(fontSize: 17.sp),
//                                         decoration: InputDecoration(
//                                           filled: true,
//                                           fillColor: Color(0xffE1E1E1),
//                                           disabledBorder: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(15.sp),
//                                             borderSide: BorderSide.none,
//                                           ),
//                                           border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(15.sp),
//                                             borderSide: BorderSide.none,
//                                           ),
//                                           focusedBorder: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(15.sp),
//                                             borderSide: BorderSide(
//                                                 color: Color.fromARGB(
//                                                     100, 33, 150, 243),
//                                                 width: 2.sp),
//                                           ),
//                                           hintText: state.birth == ''
//                                               ? 'Date of Birth'
//                                               : state.birth,
//                                           hintStyle: TextStyle(
//                                             color: date ==
//                                                     DateTime(0000, 00, 00)
//                                                 ? Colors.black.withAlpha(100)
//                                                 : Colors.black,
//                                             fontSize: 17.sp,
//                                           ),
//                                           suffixIcon:
//                                               Icon(FontAwesomeIcons.calendar),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 15.sp),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       CostumeTextField(
//                                         onChanged: (String value) {
//                                           _patSignUpBloc.add(PatSignWeightEvent(
//                                               weight: value));
//                                         },
//                                         small: true,
//                                         hintText: 'Weight (Kg)',
//                                       ),
//                                       CustomDropDownMenu(
//                                         selectedValue: selected,
//                                         list: blood,
//                                         hint: 'Blood Group',
//                                         small: true,
//                                         onChanged: (String? value) {
//                                           _patSignUpBloc.add(
//                                               PatSignBloodEvent(blood: value!));
//                                           setState(() {
//                                             selected = value;
//                                           });
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 15.sp),
//                                   CustomDropDownMenu(
//                                     selectedValue: selected2,
//                                     list: gender,
//                                     hint: 'Gender',
//                                     onChanged: (String? value) {
//                                       _patSignUpBloc.add(
//                                           PatSignGenderEvent(gender: value!));
//                                       setState(() {
//                                         selected2 = value;
//                                       });
//                                     },
//                                   ),
//                                   SizedBox(height: 15.sp),
//                                   CostumeTextField(
//                                     onChanged: (String value) {
//                                       _patSignUpBloc.add(
//                                         PatSignPhoneEvent(phone: value),
//                                       );
//                                     },
//                                     hintText: 'Phone Number',
//                                     suffixIcon: GestureDetector(
//                                       onTap: (() {
//                                         log('message');
//                                       }),
//                                       child: Icon(FontAwesomeIcons.phone),
//                                     ),
//                                   ),
//                                   SizedBox(height: 20.sp),
//                                   BlueButton(
//                                     title: 'Next',
//                                     onPressed: () async {
//                                       Navigator.pushNamed(
//                                           context, '/pat/signUp/chooseDoc');
//                                       // print(state.email);
//                                       // print(state.password);
//                                       // print(state.firstName);
//                                       // print(state.lastName);
//                                       // print(state.gender);
//                                       // print(state.birth);
//                                       // print(state.weight);
//                                       // print(state.phone);
//                                       // print(state.blood);
//                                       // BlocProvider.of<PatSignUpBloc>(context)
//                                       //     .add(PatChangePageEvent(page: 2));
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
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
import 'package:e_health/Presentation/Authentification/Commun/widgets/costume_drop_down_menu.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/bloc/path_auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationScreen extends StatefulWidget {
  // const InformationScreen(this.controller);
  // final PageController controller;
  const InformationScreen();

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  List<String> blood = <String>['A', 'B', 'AB', 'O'];
  List<String> gender = <String>['Mle', 'Female'];

  String? selected = null, selected2 = null;

  DateTime date = DateTime(0000, 00, 00);

  late PatSignUpBloc _patSignUpBloc;

  @override
  void initState() {
    super.initState();
    // _patSignUpBloc = PatSignUpBloc();
    _patSignUpBloc = BlocProvider.of<PatSignUpBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<PatSignUpBloc>(context).state;

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
                        //nothing
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 92.sp, 14.sp),
                            width: double.infinity,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.pop(context);
                                    _patSignUpBloc.add(
                                        PatChangePageEvent(page: 0));
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
                            onChanged: (String value) {
                              _patSignUpBloc
                                  .add(PatSignFNameEvent(fName: value));
                            },
                          ),
                          SizedBox(height: 15.sp),
                          CostumeTextField(
                            hintText: 'Last Name',
                            onChanged: (String value) {
                              _patSignUpBloc
                                  .add(PatSignLNameEvent(lName: value));
                            },
                          ),
                          SizedBox(height: 15.sp),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 3.sp, 0),
                            width: 330.sp,
                            height: 50.sp,
                            child: GestureDetector(
                              onTap: (() {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                ).then((date) {
                                  setState(() {
                                    // date = value!;
                                    _patSignUpBloc.add(PatSignBirthEvent(
                                        birth:
                                            "${date!.day}-${date.month}-${date.year}"));
                                  });
                                });
                              }),
                              child: TextField(
                                enabled: false,
                                style: TextStyle(fontSize: 17.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffE1E1E1),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    borderSide: BorderSide.none,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(100, 33, 150, 243),
                                        width: 2.sp),
                                  ),
                                  hintText: state.birth == ''
                                      ? 'Date of Birth'
                                      : state.birth,
                                  hintStyle: TextStyle(
                                    color: date == DateTime(0000, 00, 00)
                                        ? Colors.black.withAlpha(100)
                                        : Colors.black,
                                    fontSize: 17.sp,
                                  ),
                                  suffixIcon: Icon(FontAwesomeIcons.calendar),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CostumeTextField(
                                onChanged: (String value) {
                                  _patSignUpBloc
                                      .add(PatSignWeightEvent(weight: value));
                                },
                                small: true,
                                hintText: 'Weight (Kg)',
                              ),
                              CustomDropDownMenu(
                                selectedValue: selected,
                                list: blood,
                                hint: 'Blood Group',
                                small: true,
                                onChanged: (String? value) {
                                  _patSignUpBloc
                                      .add(PatSignBloodEvent(blood: value!));
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
                            list: gender,
                            hint: 'Gender',
                            onChanged: (String? value) {
                              _patSignUpBloc
                                  .add(PatSignGenderEvent(gender: value!));
                              setState(() {
                                selected2 = value;
                              });
                            },
                          ),
                          SizedBox(height: 15.sp),
                          CostumeTextField(
                            onChanged: (String value) {
                              _patSignUpBloc.add(
                                PatSignPhoneEvent(phone: value),
                              );
                            },
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
                            onPressed: () async {
                              _patSignUpBloc.add(PatChangePageEvent(page: 2));

                              // print(state.email);
                              // print(state.password);
                              // print(state.firstName);
                              // print(state.lastName);
                              // print(state.gender);
                              // print(state.birth);
                              // print(state.weight);
                              // print(state.phone);
                              // print(state.blood);
                              // BlocProvider.of<PatSignUpBloc>(context)
                              //     .add(PatChangePageEvent(page: 2));
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
