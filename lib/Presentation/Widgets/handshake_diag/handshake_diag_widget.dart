import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_bloc.dart';
import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_event.dart';
import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HandshakeDiag {
  static Future showDiag(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => HandshakeBloc(),
            child: BlocBuilder<HandshakeBloc, HandshakeState>(
              builder: (context, state) {
                if (state is HandshakeInitState)
                  context.read<HandshakeBloc>().add(SendHandShake());
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0)), //this right here
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 30,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: state is GotHandshakeRespence
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Lottie.asset(
                                      'assets/lottie/success.json',
                                      height: 50,
                                      frameRate: FrameRate(100),
                                      repeat: false,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Device found",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10.0), //this right here
                                          color: const Color(0xFF34C759),
                                        ),
                                        height: 30,
                                        width: 100,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Continue',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                )
                              : state is WaitingHandshakeRespence
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Lottie.asset(
                                          'assets/lottie/wireless-loading.json',
                                          height: 80,
                                          frameRate: FrameRate(120),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        const Text(
                                          'Searching',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: Color(0xFF0F0F0F),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Lottie.asset(
                                          'assets/lottie/failed.json',
                                          height: 50,
                                          frameRate: FrameRate(100),
                                          repeat: false,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "No device found",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0), //this right here
                                              color: const Color(0xFFFF5252),
                                            ),
                                            height: 30,
                                            width: 100,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'Try again',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFFFFFF),
                                              ),
                                            ),
                                          ),
                                          onTap: () async {
                                            context
                                                .read<HandshakeBloc>()
                                                .add(SendHandShake());
                                          },
                                        ),
                                      ],
                                    ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
