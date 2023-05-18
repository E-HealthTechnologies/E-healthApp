import 'package:flutter/material.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlucoseScreen extends StatefulWidget {
  const GlucoseScreen({Key? key}) : super(key: key);

  @override
  State<GlucoseScreen> createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<GlucoseScreen> {
  // late PatMeasuringBloc _patMeasuringBloc;

  @override
  void initState() {
    super.initState();
    // _patMeasuringBloc = BlocProvider.of<PatMeasuringBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Glucose'),
    );
  }
}
