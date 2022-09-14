import 'package:dartz/dartz.dart';
import 'package:first_project/features/simple_app/domain/entities/login.dart';
import 'package:first_project/features/simple_app/domain/entities/simple_app.dart';
import 'package:first_project/features/simple_app/domain/usecases/post_login.dart';

import '../../../../core/error/failures.dart';
import '../usecases/get_data.dart';

abstract class SimpleAppRepository{
  Future<Either<Failure, Login>> login(LoginParams loginParams);
  Future<Either<Failure, SimpleAppList>> data(DataParams dataParams);
}