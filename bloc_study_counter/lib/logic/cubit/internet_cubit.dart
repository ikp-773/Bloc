import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_study_counter/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription internetConnectivityStreamSubscription;

  InternetCubit(
    this.connectivity,
  ) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return internetConnectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobileData);
      } else {
        emitInternetDisconnected();
      }
    });
  }

  @override
  Future<void> close() {
    internetConnectivityStreamSubscription.cancel();
    return super.close();
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnectedState(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnectedState());
}
