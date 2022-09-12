part of 'simple_app_bloc.dart';

abstract class SimpleAppState extends Equatable {
  const SimpleAppState();
}

class Empty extends SimpleAppState {
  @override
  List<Object> get props => [];
}

class Loading extends SimpleAppState {
  @override
  List<Object> get props => [];
}

class Success extends SimpleAppState {
  @override
  List<Object> get props => [];
}

class Error extends SimpleAppState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}


