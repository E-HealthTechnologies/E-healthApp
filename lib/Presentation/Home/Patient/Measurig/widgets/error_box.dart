import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecErrorBox extends StatelessWidget {
  String errorText;
  Color? boxColor;
  RecErrorBox({super.key, required this.errorText, this.boxColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.sp,
      width: errorText.length + 200.sp,
      decoration: BoxDecoration(
          color: boxColor ?? Colors.red[600],
          borderRadius: BorderRadius.circular(10.sp)),
      alignment: Alignment.center,
      // color: ,
      child: Text(
        errorText,
        style: TextStyle(
          color: Color(0xFFF0F0F0),
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
