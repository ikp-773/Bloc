import 'package:bloc_study_counter/constants/enums.dart';
import 'package:bloc_study_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_study_counter/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnectedState) {
          if (state.connectionType == ConnectionType.wifi) {
            BlocProvider.of<CounterCubit>(context).increment();
          } else if (state.connectionType == ConnectionType.mobileData) {
            BlocProvider.of<CounterCubit>(context).decrement();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnectedState) {
                  if (state.connectionType == ConnectionType.wifi) {
                    return const Text(
                      'WiFi',
                    );
                  } else if (state.connectionType ==
                      ConnectionType.mobileData) {
                    return const Text(
                      'Mobile Data',
                    );
                  }
                } else if (state is InternetDisconnectedState) {
                  return const Text(
                    'Disconnected',
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 8),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented!) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Incremented'),
                    duration: Duration(milliseconds: 200),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Decremented'),
                    duration: Duration(milliseconds: 200),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove_rounded),
                ),
                const SizedBox(width: 40),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add_rounded),
                ),
              ],
            ),
            const SizedBox(height: 50),
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              tooltip: 'Second Screen',
              child: const Icon(Icons.navigate_next_rounded),
            ),
            const SizedBox(height: 50),
            FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              tooltip: 'Second Screen',
              child: const Icon(Icons.navigate_next_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
