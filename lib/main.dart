import 'package:e_health/Presentation/routing/routes.dart';
import 'package:e_health/Presentation/routing/transition_page_route_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ehealth',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final routes = Routes.getRoutes(settings);
        final WidgetBuilder builder = routes[settings.name]!;
        return FadePageRouteBuilder(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}
