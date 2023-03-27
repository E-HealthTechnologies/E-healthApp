import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CostumeTextField extends StatelessWidget {
  const CostumeTextField({
    required this.hintText,
    this.prefixIcon = null,
    this.suffixIcon = null,
    this.hide = false,
    this.enabled = true,
    this.small = false,
    required this.onChanged,
  });
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hide, enabled, small;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 3.sp, 0),
      width: small ? 140.sp : 330.sp,
      height: 50.sp,
      child: TextField(
        onChanged: onChanged,
        enabled: enabled,
        obscureText: hide,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 20.sp),
        decoration: InputDecoration(
          filled: true,
          // fillColor: Color.fromARGB(100, 204, 204, 204),
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
                color: Color.fromARGB(100, 33, 150, 243), width: 2.sp),
          ),
          // prefixIcon:
          //     ImageIcon(AssetImage('assets/icons/email.png')),
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.black.withAlpha(100), fontSize: 18.sp),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
