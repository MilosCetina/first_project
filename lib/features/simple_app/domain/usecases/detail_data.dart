import 'package:dartz/dartz.dart';
import 'package:first_project/core/error/failures.dart';
import 'package:first_project/core/usecase/usecase.dart';
import 'package:first_project/features/simple_app/domain/entities/data_entitie.dart';

class DetailData extends UseCase<DataEntitie ,DetailParams>{

  @override
  Future<Either<Failure, DataEntitie>> call(DetailParams params) {
    throw UnimplementedError();
  }

}

class DetailParams{

}