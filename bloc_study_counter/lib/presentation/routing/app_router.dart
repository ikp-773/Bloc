import 'package:bloc_study_counter/presentation/screens/home_screen.dart';
import 'package:bloc_study_counter/presentation/screens/second_screen.dart';
import 'package:bloc_study_counter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(title: 'HomePage'),
        );
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                title: 'Second Screen', color: Colors.amber));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                title: 'Third Screen', color: Colors.deepOrange));
      default:
        return null;
    }
  }
}
