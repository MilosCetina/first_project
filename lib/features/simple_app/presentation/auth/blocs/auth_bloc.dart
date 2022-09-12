import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/post_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final PostLogin? loginUsecase;

  AuthBloc([this.loginUsecase]) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final failureOrLogin = await loginUsecase?.call(event.body);
      
      failureOrLogin?.fold((l) => emit(AuthFailure(message: l.toString())), (r) {return emit(AuthSuccess());});
    });
  }
}
