import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownMenu extends StatelessWidget {
  CustomDropDownMenu({
    required this.list,
    this.small = false,
    required this.hint,
    required this.onChanged,
    this.selectedValue = null,
  });

  final List<String> list;
  final bool small;
  final String hint;
  final Function(String?) onChanged;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 3.sp, left: 10.sp),
      margin: EdgeInsets.fromLTRB(0, 0, 3.sp, 0),
      width: small ? 140.sp : 330.sp,
      height: 50.sp,
      decoration: BoxDecoration(
        color: Color(0xffE1E1E1),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0.sp),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          items: list.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          hint: Text(
            hint,
            style:
                TextStyle(color: Colors.black.withAlpha(100), fontSize: 18.sp),
          ),
          iconSize: 35.sp,
          icon: Icon(Icons.arrow_drop_down_rounded),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
