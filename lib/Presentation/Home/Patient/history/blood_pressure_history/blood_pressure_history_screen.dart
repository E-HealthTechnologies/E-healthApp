import 'package:flutter/material.dart';

class BloodPressureHistory extends StatelessWidget {
  const BloodPressureHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Text(
        "Blood Pressure History",
        style: TextStyle(
          color: Colors.black,
          fontSize: 50,
        ),
      ),
    ));
  }
}
