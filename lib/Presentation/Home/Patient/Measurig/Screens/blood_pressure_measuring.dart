import 'dart:developer';

import 'package:flutter/material.dart';

class BloodPressureScreen extends StatefulWidget {
  const BloodPressureScreen({required this.uid});
  final String uid;

  @override
  State<BloodPressureScreen> createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<BloodPressureScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      "Blood pressure measure",
    ));
  }
}
