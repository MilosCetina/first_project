import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_project/features/simple_app/domain/repositories/simple_app_repository.dart';

import '../../../domain/usecases/post_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final PostLogin loginUsecase;

  AuthBloc(this.loginUsecase) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      print("tu sam");
      print(loginUsecase.toString());
      final failureOrLogin = await loginUsecase.call(event.body);
      print("failure login $failureOrLogin");
      failureOrLogin.fold((l) => emit(AuthFailure(message: l.toString())), (r) {return emit(AuthSuccess());});
    });
  }
}
