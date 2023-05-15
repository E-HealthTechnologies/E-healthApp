import 'package:e_health/Presentation/Authentification/Doctor/SignUp_doc/bloc/doc_sign_up_bloc.dart';
import 'package:e_health/Presentation/Authentification/Doctor/SignUp_doc/pages/email_screen.dart';
import 'package:e_health/Presentation/Authentification/Doctor/SignUp_doc/pages/information_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocSignUpScreen extends StatefulWidget {
  const DocSignUpScreen({Key? key}) : super(key: key);

  @override
  State<DocSignUpScreen> createState() => _DocSignUpScreenState();
}

class _DocSignUpScreenState extends State<DocSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: DocSignUpBloc(),
      child: BlocListener<DocSignUpBloc, DocSignUpState>(
        listener: (context, state) {},
        child: BlocBuilder<DocSignUpBloc, DocSignUpState>(
          builder: (context, state) {

            if(state.page==0){
              return DocEmailScreen();
            }else {
            return DocInformationScreen();
            }

          },
        ),
      ),
    );
  }
}