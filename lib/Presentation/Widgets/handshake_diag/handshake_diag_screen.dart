import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_bloc.dart';
import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_event.dart';
import 'package:e_health/Presentation/Widgets/handshake_diag/handshake_diag_states.dart';
import 'package:e_health/Services/ehealth_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:udp/udp.dart';

class HandshakeExample extends StatelessWidget {
  HandshakeExample({super.key});

  String message = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HandshakeBloc(),
      child: BlocBuilder<HandshakeBloc, HandshakeState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFF000000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Handshake",
                      style: TextStyle(
                        color: Color(0xFFF0F0F0),
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    state is WaitingHandshakeRespence
                        ? const Text(
                            'Waiting for respence',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFF0F0F0),
                            ),
                          )
                        : InkWell(
                            child: Container(
                              color: const Color(0xFFF0F0F0),
                              height: 40,
                              width: 100,
                              alignment: Alignment.center,
                              child: const Text(
                                "send",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            onTap: () async {
                              context
                                  .read<HandshakeBloc>()
                                  .add(SendHandShake());
                            },
                          ),
                    const SizedBox(
                      height: 40,
                    ),
                    state is GotHandshakeRespence
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Fond Device: ",
                                style: TextStyle(
                                  color: Color(0xFFF0F0F0),
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${EhealthModule.deviceAddr?.address} [ ${EhealthModule.deviceId} ]",
                                style: const TextStyle(
                                  color: Color(0xFFF0F0F0),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void sendsmth() async {
  UDP sender = await UDP.bind(Endpoint.any(port: 1232));
  await sender.send(
      "Hello World!".codeUnits, Endpoint.broadcast(port: Port(2409)));
}
