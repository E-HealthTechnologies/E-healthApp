import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_health/Presentation/Home/Patient/history/widgets/select_butt.dart';

class GraphController extends StatelessWidget {
  DateTime actualDateTime;
  Function next, previous;
  GraphController(
      {super.key,
      required this.actualDateTime,
      required this.next,
      required this.previous});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TransButtonIcon(
          icon: Icons.arrow_back_ios_new,
          onTab: () {
            previous();
          },
          size: 20,
        ),
        SizedBox(
          width: 10,
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
          width: 10,
        ),
        TransButtonIcon(
          icon: Icons.arrow_forward_ios,
          onTab: () {
            next();
          },
          size: 20,
        ),
      ],
    );
  }
}
