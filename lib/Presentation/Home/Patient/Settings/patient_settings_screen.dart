
import 'package:e_health/Presentation/Home/Patient/Settings/bloc/pat_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatSettingsScreen extends StatefulWidget {
  // PatSettingsScreen({required this.uid});
  //
  // final String uid;
  PatSettingsScreen();

  @override
  State<PatSettingsScreen> createState() => _PatHomeScreenState();
}

class _PatHomeScreenState extends State<PatSettingsScreen> {
  late PatSettingsBloc _patSettingsBloc;

  void initState() {
    super.initState();
    // log(widget.uid, name: 'Home screen');
    _patSettingsBloc = PatSettingsBloc();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');
    double counter = 0;

    return BlocProvider.value(
      value: _patSettingsBloc,
      child: BlocListener<PatSettingsBloc, PatSettingsState>(
        listener: (context, state) {},
        child: BlocBuilder<PatSettingsBloc, PatSettingsState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                body: Container(
                  color: Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}