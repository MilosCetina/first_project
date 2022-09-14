import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_project/features/simple_app/domain/usecases/get_data.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final GetData dataUsecase;

  DataBloc(this.dataUsecase) : super(DataInitial()) {
    on<GetDataEvent>((event, emit) async {
      print("U data blocu sam");
      final failureOrLogin = await dataUsecase.call(event.body);
      print("failure getting data $failureOrLogin");
      failureOrLogin.fold((l) => emit(DataFailure(message: l.toString())), (r) {return emit(DataSuccess());});
    });
  }
}
