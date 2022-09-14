import 'package:dartz/dartz.dart';
import 'package:first_project/core/error/failures.dart';
import 'package:first_project/core/usecase/usecase.dart';
import 'package:first_project/features/simple_app/domain/entities/simple_app.dart';
import 'package:first_project/features/simple_app/domain/repositories/simple_app_repository.dart';

class GetData extends UseCase<SimpleAppList, DataParams> {
  final SimpleAppRepository _repo;

  GetData(this._repo);

  @override
  Future<Either<Failure, SimpleAppList>> call(DataParams params) async {
    print("u usecaseu sam");
    return await _repo.data(params);
  }
}

class DataParams {
  int page;
  String authToken;

  DataParams({this.page = 1, required this.authToken});

  Map<String, dynamic> toJson() => {
        "page": page,
      };
}
