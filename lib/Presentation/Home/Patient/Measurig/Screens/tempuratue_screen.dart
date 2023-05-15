import 'package:flutter/material.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/bloc/pat_measuring_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({Key? key}) : super(key: key);

  @override
  State<TemperatureScreen> createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<TemperatureScreen> {
  late PatMeasuringBloc _patMeasuringBloc;

  @override
  void initState() {
    super.initState();
    _patMeasuringBloc = BlocProvider.of<PatMeasuringBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Temperature'),
    );
  }
}
