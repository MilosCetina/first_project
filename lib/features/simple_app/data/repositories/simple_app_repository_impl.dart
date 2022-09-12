import 'package:dartz/dartz.dart';
import 'package:first_project/core/error/exceptions.dart';
import 'package:first_project/core/error/failures.dart';
import 'package:first_project/features/simple_app/domain/entities/login.dart';
import 'package:first_project/features/simple_app/domain/repositories/simple_app_repository.dart';
import 'package:first_project/features/simple_app/domain/usecases/post_login.dart';

import '../datasources/remote/simple_app_remote_data_source.dart';

class SimpleAppRepositoryImpl implements SimpleAppRepository{
  final SimpleAppRemoteDataSource simpleAppRemoteDataSource;

  const SimpleAppRepositoryImpl(this.simpleAppRemoteDataSource);

  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams) async {
    try{
      final response = await simpleAppRemoteDataSource.login(loginParams);
      
      return Right(response.toEntity());
    } on ServerException catch(e){
      return Left(ServerFailure(e.message));
    }
  }

}