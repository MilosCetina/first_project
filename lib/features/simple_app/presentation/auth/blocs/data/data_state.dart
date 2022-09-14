part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  const DataState();
}

class DataInitial extends DataState {
  @override
  List<Object> get props => [];
}

class DataLoading extends DataState {
  @override
  List<Object> get props => [];
}

class DataFailure extends DataState {
  final String message;

  const DataFailure({
    required this.message,
  });

  @override
  List<Object> get props => [];
}

class DataSuccess extends DataState {
  @override
  List<Object> get props => [];
}


