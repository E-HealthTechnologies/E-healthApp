
import 'package:e_health/Presentation/Home/Patient/bloc/patient_home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatHistoryScreen extends StatefulWidget {
  // PatHistoryScreen({required this.uid});
  //
  // final String uid;
  PatHistoryScreen();

  @override
  State<PatHistoryScreen> createState() => _PatHomeScreenState();
}

class _PatHomeScreenState extends State<PatHistoryScreen> {
  late PatHomeBloc _patHomeBloc;

  void initState() {
    super.initState();
    // log(widget.uid, name: 'Home screen');
    _patHomeBloc = PatHomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: PatHomeBloc(),
      child: BlocListener<PatHomeBloc, PatHomeState>(
        listener: (context, state) {},
        child: BlocBuilder<PatHomeBloc, PatHomeState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                body: Container(
                  color: Colors.green,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
