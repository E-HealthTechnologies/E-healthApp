import 'package:flutter/material.dart';

class PatSignUpScreen extends StatefulWidget {
  const PatSignUpScreen({Key? key}) : super(key: key);

  @override
  State<PatSignUpScreen> createState() => _PatSignUpScreenState();
}

class _PatSignUpScreenState extends State<PatSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pat signUp'),
      ),
    );
  }
}
