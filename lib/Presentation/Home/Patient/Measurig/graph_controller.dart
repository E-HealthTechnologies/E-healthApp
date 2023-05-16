import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GraphController extends StatelessWidget {
  DateTime actualDateTime;
  Function next, previous, nextPage, previousPage;
  GraphController(
      {super.key,
      required this.actualDateTime,
      required this.next,
      required this.previous,
      required this.nextPage,
      required this.previousPage});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.sp,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.sp),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(50, 50, 50, 0.4),
              blurRadius: 1.5,
              offset: Offset(0, 0.7),
              spreadRadius: 0.5,
            ),
          ]),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: Container(
                height: 25.sp,
                width: 25.sp,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.sp),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(50, 50, 50, 0.4),
                        blurRadius: 1.5,
                        offset: Offset(0, 0.7),
                        spreadRadius: 0.5,
                      ),
                    ]),
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 17.sp,
                ),
              ),
              onTap: () {
                previous();
              },
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "${actualDateTime.year} - ${actualDateTime.month} - ${actualDateTime.day}",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              child: Container(
                height: 25.sp,
                width: 25.sp,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.sp),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(50, 50, 50, 0.4),
                        blurRadius: 1.5,
                        offset: Offset(0, 0.7),
                        spreadRadius: 0.5,
                      ),
                    ]),
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.sp,
                ),
              ),
              onTap: () {
                next();
              },
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
