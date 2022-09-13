import 'dart:convert';

import '../../../../../core/error/exceptions.dart';
import '../../../domain/usecases/get_data.dart';
import '../../../domain/usecases/post_login.dart';
import '../../models/simple_app_model.dart';
import 'package:http/http.dart' as http;

import 'login_response.dart';

abstract class SimpleAppRemoteDataSource{
  // Future<SimpleAppModel> getData();
  // Future<SimpleAppModel> getLink();
  Future<LoginResponse> login(LoginParams loginParams);
  Future<SimpleAppModel> data(DataParams dataParams);
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
      final url = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAD3SARICdEM8UteFzAtjqS5AnfdtHXSeQ");
      final response = await client.post(url, body: loginParams.toJson());

      print("dosao sam u datasource od data");

      print(json.decode(response.body));


      if(response.statusCode == 200){
        final result = LoginResponse.fromJson(json.decode(response.body));
        return result;
      }else{
        throw ServerException("Server ne valja");
      }
    } on ServerException catch (e){
      throw ServerException(e.message);
    }
  }

  @override
  Future<SimpleAppModel> data(DataParams dataParams) async {
    try{
      final url = Uri.parse("https://icb-first-project-default-rtdb.europe-west1.firebasedatabase.app");
      final response = await client.get(url);
      final result = SimpleAppModel.fromJson(response.body);

      if(response.statusCode == 200){
        return result;
      } else{
        throw ServerException("Server ne valja");
      }
    } on ServerException catch(e){
      throw ServerException(e.message);
    }
  }


}