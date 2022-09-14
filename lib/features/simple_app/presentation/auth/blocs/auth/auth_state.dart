part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState{
  @override
  List<Object> get props => [];
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({
    required this.message,
  });

  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  final String userToken;
  final String localId;

  const AuthSuccess({required this.userToken, required this.localId});

  @override
  List<Object> get props => [userToken, localId];
}
