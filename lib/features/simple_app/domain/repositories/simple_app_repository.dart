import 'package:dartz/dartz.dart';
import 'package:first_project/features/simple_app/domain/entities/login.dart';
import 'package:first_project/features/simple_app/domain/usecases/post_login.dart';

import '../../../../core/error/failures.dart';

abstract class SimpleAppRepository{
  Future<Either<Failure, Login>> login(LoginParams loginParams);
}