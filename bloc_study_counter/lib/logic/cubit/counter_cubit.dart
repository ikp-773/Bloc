import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_study_counter/constants/enums.dart';
import 'package:bloc_study_counter/logic/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetCubitStreamSubscription;
  CounterCubit({required this.internetCubit})
      : super(const CounterState(counterValue: 0)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetCubitStreamSubscription =
        internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnectedState) {
        if (internetState.connectionType == ConnectionType.wifi) {
          increment();
        } else if (internetState.connectionType == ConnectionType.mobileData) {
          decrement();
        }
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetCubitStreamSubscription.cancel();
    return super.close();
  }
}
