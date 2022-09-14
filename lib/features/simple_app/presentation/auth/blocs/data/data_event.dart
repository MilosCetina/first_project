part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
}

class GetDataEvent extends DataEvent{
  final DataParams body;

  const GetDataEvent(this.body);

  @override
  List<Object?> get props => [body];
}
