import 'package:flutter/material.dart';

class PatLoginScreen extends StatefulWidget {
  const PatLoginScreen({Key? key}) : super(key: key);

  @override
  State<PatLoginScreen> createState() => _PatLoginScreenState();
}

class _PatLoginScreenState extends State<PatLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pat Login'),
      ),
    );
  }
}
