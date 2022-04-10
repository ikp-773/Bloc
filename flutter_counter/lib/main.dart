import 'package:flutter/material.dart';
import 'package:flutter_counter/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    print("-----------------------------\n\n\n\n\n\n\n\n");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder(
                  stream: counterBloc.counterStream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                print("+++++++++++");
                counterBloc.eventSink.add(CounterAction.incerment);
              },
              tooltip: 'Increment',
              child: Icon(Icons.add_rounded),
            ),
            FloatingActionButton(
              onPressed: () {
                print("--------------");

                counterBloc.eventSink.add(CounterAction.decrement);
              },
              tooltip: 'Decrement',
              child: Icon(Icons.remove_rounded),
            ),
            FloatingActionButton(
              onPressed: () {
                print("wooooooooooooooooooooow");

                counterBloc.eventSink.add(CounterAction.reset);
              },
              tooltip: 'Reset',
              child: Icon(Icons.refresh_rounded),
            ),
          ],
        ));
  }
}
