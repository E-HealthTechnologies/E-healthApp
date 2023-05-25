import 'package:e_health/Presentation/Home/Patient/Measurig/heart_beat_measure/heart_beat_measure_bloc.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/heart_beat_measure/heart_beat_measure_event.dart';
import 'package:e_health/Presentation/Home/Patient/Measurig/heart_beat_measure/heart_beat_measure_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartBeatMeasureScreen extends StatelessWidget {
  const HeartBeatMeasureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: BlocProvider(
        create: (context) => HeartBeatMeasureBloc(),
        child: BlocBuilder<HeartBeatMeasureBloc, HeartBeatMeasureState>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Heart beat",
                    style: TextStyle(
                      color: Color(0xFFF0F0F0),
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    child: Container(
                      color: const Color(0xFFF0F0F0),
                      height: 50,
                      width: 120,
                      alignment: Alignment.center,
                      child: const Text(
                        'Measure',
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 22,
                        ),
                      ),
                    ),
                    onTap: () => context
                        .read<HeartBeatMeasureBloc>()
                        .add(SendHeartBeatMeasureRequest()),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  state is GotHeartBeatMeasureRespence
                      ? Text(
                          "Got result: ${state.heartBeatResult.heartRate}",
                          style: const TextStyle(
                              color: Color(0xFFF0F0F0), fontSize: 18),
                        )
                      : Text(
                          state is WaitingHeartBeatMeasureRespence
                              ? 'Wating respence'
                              : state is HeartBeatMeasureConnectionError
                                  ? 'Failed to connected with device'
                                  : state is DeviceNotConnected
                                      ? 'Device not connected'
                                      : '',
                          style: const TextStyle(
                            color: Color(0xFFF0F0F0),
                            fontSize: 18,
                          ),
                        )

                  // Container(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
