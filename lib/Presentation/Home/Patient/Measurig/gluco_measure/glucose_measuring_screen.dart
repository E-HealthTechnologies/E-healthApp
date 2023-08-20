import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlucoseScreen extends StatelessWidget {
  GlucoseScreen({super.key});
  TextStyle noResultTextStyle = TextStyle(
      fontSize: 65.sp, color: Color(0x3F0F0F0F), fontWeight: FontWeight.w100);
  TextStyle reesultTextStyle = TextStyle(
      fontSize: 65.sp, color: Color(0x9F0F0F0F), fontWeight: FontWeight.w300);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Container(
          height: 700,
          width: MediaQuery.of(context).size.width - 16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(8.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset(
                "assets/images/gluco.png",
                width: 110,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Color(0x0B0F0F0F),
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Color(0xFF0F0F0F),
                      fontSize: 13.sp,
                    ),
                    decoration: InputDecoration(
                      suffix: Padding(
                        padding: EdgeInsets.only(right: 10.0.sp),
                        child: Text(
                          "mg/dL",
                          style: TextStyle(color: Color(0x5F0F0F0F)),
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      labelText: "Please Enter your Measurement results",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF49CAAE),
                          width: 3.sp,
                        ),
                      ),
                    ),
                    onChanged: (input) {},
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff3f51b5),
                  minimumSize: Size(120.sp, 30.sp),
                  maximumSize: Size(120.sp, 40.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.sp),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
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
