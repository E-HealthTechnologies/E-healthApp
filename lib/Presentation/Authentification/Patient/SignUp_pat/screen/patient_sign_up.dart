import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/pages/choose_doctor_screen.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/pages/email_screen.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/bloc/path_auth_bloc.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/pages/information_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PathAuthScreen extends StatefulWidget {
  const PathAuthScreen({Key? key}) : super(key: key);

  @override
  State<PathAuthScreen> createState() => _PathAuthScreenState();
}

class _PathAuthScreenState extends State<PathAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: PatSignUpBloc(),
      // create: (context) => PathAuthBloc(),
      child: BlocListener<PatSignUpBloc, PatSignUpState>(
        listener: (context, state) {},
        child: BlocBuilder<PatSignUpBloc, PatSignUpState>(
          builder: (context, state) {

            if(state.page==0){
              return EmailScreen();
            }else if(state.page==1){
            return InformationScreen();
            }
            else{
              return ChooseDoctorScreen();
            }

          },
        ),
      ),
    );
  }
}
