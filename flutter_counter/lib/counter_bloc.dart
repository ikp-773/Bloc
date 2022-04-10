import 'dart:async';

enum CounterAction { incerment, decrement, reset }

class CounterBloc {
  late int counter;
  final _streamController = StreamController<int>();
  StreamSink<int> get counterSink => _streamController.sink;
  Stream<int> get counterStream => _streamController.stream;

  final _eventController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventController.sink;
  Stream<CounterAction> get eventStream => _eventController.stream;

  CounterBloc() {
    counter = 0;

    eventStream.listen(
      (event) {
        if (event == CounterAction.incerment)
          counter++;
        else if (event == CounterAction.decrement)
          counter--;
        else if (event == CounterAction.reset) counter = 0;
      },
    );

    counterSink.add(counter);
  }
}
