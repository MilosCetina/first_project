import 'package:dartz/dartz.dart';
import 'package:first_project/core/error/failures.dart';
import 'package:first_project/core/usecase/usecase.dart';
import 'package:first_project/features/simple_app/domain/repositories/simple_app_repository.dart';

import '../entities/login.dart';

class PostLogin extends UseCase<Login, LoginParams> {
  final SimpleAppRepository _repo;

  PostLogin(this._repo);

  @override
  Future<Either<Failure, Login>> call(LoginParams params) async {
    return await _repo.login(params);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    this.email = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "returnSecureToken": "true",
      };
}
