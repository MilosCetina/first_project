part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final LoginParams body;

  const LoginEvent(this.body);

  @override
  List<Object?> get props => [body];

}