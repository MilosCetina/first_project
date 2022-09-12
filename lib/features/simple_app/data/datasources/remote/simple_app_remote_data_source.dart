import '../../../../../core/error/exceptions.dart';
import '../../../domain/usecases/post_login.dart';
import '../../models/simple_app_model.dart';
import 'package:http/http.dart' as http;

import 'login_response.dart';

abstract class SimpleAppRemoteDataSource{
  // Future<SimpleAppModel> getData();
  // Future<SimpleAppModel> getLink();
  Future<LoginResponse> login(LoginParams loginParams);
}

class SimpleAppRemoteDataSourceImpl implements SimpleAppRemoteDataSource{
  final http.Client client;

  SimpleAppRemoteDataSourceImpl({required this.client});

  // @override
  // Future<SimpleAppModel> getData() {
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<SimpleAppModel> getLink() {
  //   throw UnimplementedError();
  // }

  @override
  Future<LoginResponse> login(LoginParams loginParams) async {
    try{
      final url = Uri.parse("https://icb-first-project-default-rtdb.europe-west1.firebasedatabase.app");
      final response = await client.post(url, body: loginParams.toJson());

      final result = LoginResponse.fromJson(response.body);

      if(response.statusCode == 200){
        return result;
      }else{
        throw ServerException(result.toString());
      }
    } on ServerException catch (e){
      throw ServerException(e.message);
    }
  }


}