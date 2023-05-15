
import 'package:e_health/Presentation/Widgets/blue_button.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/costume_drop_down_menu.dart';
import 'package:e_health/Presentation/Authentification/Commun/widgets/custome_text_field.dart';
import 'package:e_health/Presentation/Authentification/Doctor/SignUp_doc/bloc/doc_sign_up_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocInformationScreen extends StatefulWidget {
  const DocInformationScreen({Key? key}) : super(key: key);

  @override
  State<DocInformationScreen> createState() => _DocInformationScreenState();
}

class _DocInformationScreenState extends State<DocInformationScreen> {
  List<String> gender = <String>['Mle', 'Female'];

  String? selected = null, selected2 = null;

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
                                    BlocProvider.of<DocSignUpBloc>(context)
                                        .add(DocChangePageEvent(page: 0));
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
                            hintText: 'Full Name',
                            onChanged: (String value) {
                              BlocProvider.of<DocSignUpBloc>(context)
                                  .add(DocSignFullNameEvent(fullName: value));
                            },
                          ),
                          SizedBox(height: 15.sp),
                          CustomDropDownMenu(
                            selectedValue: selected2,
                            list: gender,
                            hint: 'Gender',
                            onChanged: (String? value) {
                              BlocProvider.of<DocSignUpBloc>(context)
                                  .add(DocSignGenderEvent(gender: value!));
                              setState(() {
                                selected2 = value;
                              });
                            },
                          ),
                          SizedBox(height: 15.sp),
                          CostumeTextField(
                            hintText: 'Specialty',
                            onChanged: (String value) {
                              BlocProvider.of<DocSignUpBloc>(context)
                                  .add(DocSignSpecialtyEvent(specialty: value));
                            },
                          ),
                          SizedBox(height: 15.sp),
                          CostumeTextField(
                            hintText: 'Hospital Name',
                            onChanged: (String value) {
                              BlocProvider.of<DocSignUpBloc>(context)
                                  .add(DocSignHosNameEvent(hosName: value));
                            },
                          ),
                          SizedBox(height: 15.sp),
                          CostumeTextField(
                            hintText: 'Hospital Address',
                            onChanged: (String value) {
                              BlocProvider.of<DocSignUpBloc>(context).add(
                                  DocSignHosAddressEvent(hosAddress: value));
                            },
                          ),
                          SizedBox(height: 20.sp),
                          BlueButton(
                            title: 'Next',
                            onPressed: () async {
                              var state =
                                  BlocProvider.of<DocSignUpBloc>(context).state;

                              BlocProvider.of<DocSignUpBloc>(context)
                                  .add(DocCreateAccountEvent());
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
