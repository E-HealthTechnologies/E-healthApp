import 'package:flutter/material.dart';

class TemperatureHistory extends StatelessWidget {
  const TemperatureHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Text(
        "Temperature History",
        style: TextStyle(
          color: Colors.black,
          fontSize: 50,
        ),
      ),
    ));
  }
}
