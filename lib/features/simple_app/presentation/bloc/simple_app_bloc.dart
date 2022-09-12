import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/login.dart';

part 'simple_app_event.dart';
part 'simple_app_state.dart';

class SimpleAppBloc extends Bloc<SimpleAppEvent, SimpleAppState> {
  final Login login;

  SimpleAppBloc({required this.login}) : super(Empty()) {
    on<SimpleAppEvent>((event, emit) {

    });
  }
}
