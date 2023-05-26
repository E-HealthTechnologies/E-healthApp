import 'package:e_health/Presentation/Authentification/Patient/SignUp_pat/screen/patient_sign_up.dart';
import 'package:e_health/Presentation/Home/Patient/Screens/patient_home_screen.dart';
import 'package:e_health/Presentation/routing/routes.dart';
import 'package:e_health/Presentation/routing/transition_page_route_builder.dart';
import 'package:e_health/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';







import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Presentation/Loading/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            breakpoints: [
              ResponsiveBreakpoint.resize(350, name: MOBILE),
              ResponsiveBreakpoint.autoScale(600, name: TABLET),
              ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ],
          ),
          title: 'Ehealth',
          debugShowCheckedModeBanner: false,
          // home: PatLoginScreen(),
          //initialRoute: '/',
          home: (PatHomeScreen()),
          onGenerateRoute: (settings) {
            //nothing
            final routes = Routes.getRoutes(settings);
            final WidgetBuilder builder = routes[settings.name]!;
            return FadePageRouteBuilder(
              builder: builder,
              settings: settings,
            );
          },
        );
      },
      // child: MaterialApp(
      //   builder: (context, widget) => ResponsiveWrapper.builder(
      //     BouncingScrollWrapper.builder(context, widget!),
      //     breakpoints: [
      //       ResponsiveBreakpoint.resize(350, name: MOBILE),
      //       ResponsiveBreakpoint.autoScale(600, name: TABLET),
      //       ResponsiveBreakpoint.resize(800, name: DESKTOP),
      //     ],
      //   ),
      //   title: 'Ehealth',
      //   debugShowCheckedModeBanner: false,
      //   home: PatLoginScreen(),
      //   //initialRoute: '/',
      //   onGenerateRoute: (settings) {
      //     final routes = Routes.getRoutes(settings);
      //     final WidgetBuilder builder = routes[settings.name]!;
      //     return FadePageRouteBuilder(
      //       builder: builder,
      //       settings: settings,
      //     );
      //   },
      // ),
    );
  }
}
