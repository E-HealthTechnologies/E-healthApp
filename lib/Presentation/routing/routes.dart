import 'package:e_health/Presentation/Authentification/Patient/Login_pat/screen/pat_login_screen.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/pages/email_screen.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/pages/information_screen.dart';
import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/screen/patient_sign_up.dart';
import 'package:e_health/Presentation/Loading/loading_screen.dart';
import 'package:e_health/Presentation/OnBoarding/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

// GoRouter configuration
// final router = GoRouter(
//   routes: [
//     GoRoute(path: '/', builder: (context, state) => LoadingScreen()),
//     GoRoute(path: '/onBoard', builder: (context, state) => OnBoardingScreen()),
//     GoRoute(path: '/pat/login', builder: (context, state) => PatLoginScreen()),
//
//   ],
// );


class Routes {//nothing
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        '/': (context) => LoadingScreen(),
        '/onBoard': ((context) => OnBoardingScreen()),
        '/pat/signIn': ((context) => PatLoginScreen()),
        '/pat/signUp': ((context) => PathAuthScreen()),
        '/pat/signUp/info': ((context) => InformationScreen()),


  };
}
