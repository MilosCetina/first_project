part of 'simple_app_bloc.dart';

abstract class SimpleAppEvent extends Equatable {
  const SimpleAppEvent();
}

class GetLogin extends SimpleAppEvent{
  final String email;
  final String password;

  GetLogin({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

}
