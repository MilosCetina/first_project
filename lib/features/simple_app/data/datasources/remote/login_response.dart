import 'package:equatable/equatable.dart';

import '../../../domain/entities/login.dart';

class LoginResponse extends Equatable {
  final String id;
  final String token;

  const LoginResponse({required this.id, required this.token});

  LoginResponse.fromJson(dynamic json)
      : id = json['localId'],
        token = json['idToken'];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['localId'] = id;
    map['idToken'] = token;

    return map;
  }

  Login toEntity() => Login(token, id);

  @override
  List<Object?> get props => [
    id,
    token,
  ];
}