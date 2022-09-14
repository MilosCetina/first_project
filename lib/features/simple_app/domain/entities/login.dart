import 'package:equatable/equatable.dart';

class Login extends Equatable{
  final String token;
  final String userId;

  const Login(this.token, this.userId);

  @override
  List<Object> get props => [token, userId];
}