import 'package:flutter/material.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HeartBeatScreen extends StatefulWidget {
  const HeartBeatScreen({Key? key}) : super(key: key);

  @override
  State<HeartBeatScreen> createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<HeartBeatScreen> {

  late PatMeasuringBloc _patMeasuringBloc;

  @override
  void initState() {
    super.initState();
    _patMeasuringBloc = BlocProvider.of<PatMeasuringBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Heart Beat'),);

  }
}
