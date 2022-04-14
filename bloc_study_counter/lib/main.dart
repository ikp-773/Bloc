import 'package:bloc_study_counter/presentation/screens/home_screen.dart';
import 'package:bloc_study_counter/presentation/screens/second_screen.dart';
import 'package:bloc_study_counter/presentation/screens/thiird_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_study_counter/logic/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Counter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const MyHomePage(title: 'Home Page'),
            ),
        '/second': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(
                title: 'Second Screen', color: Colors.amber)),
        '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(
                  title: 'Third Screen', color: Colors.deepOrangeAccent),
            ),
      },
    );
  }
}
