part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

class InternetConnectedState extends InternetState {
  final ConnectionType connectionType;

  const InternetConnectedState({
    required this.connectionType,
  });
}

class InternetDisconnectedState extends InternetState {}
