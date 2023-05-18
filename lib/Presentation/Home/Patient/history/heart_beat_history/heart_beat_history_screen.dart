import 'package:flutter/material.dart';

class HeartBeatHistory extends StatelessWidget {
  const HeartBeatHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Text(
        "Heart beat History",
        style: TextStyle(
          color: Colors.black,
          fontSize: 50,
        ),
      ),
    ));
  }
}
