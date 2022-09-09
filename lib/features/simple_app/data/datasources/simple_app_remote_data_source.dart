import '../models/simple_app_model.dart';
import 'package:http/http.dart' as http;

abstract class SimpleAppRemoteDataSource{
  Future<SimpleAppModel> getData();
  Future<SimpleAppModel> getLink();
}

class SimpleAppRemoteDataSourceImpl implements SimpleAppRemoteDataSource{
  final http.Client client;

  SimpleAppRemoteDataSourceImpl({required this.client});

  @override
  Future<SimpleAppModel> getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<SimpleAppModel> getLink() {
    // TODO: implement getLink
    throw UnimplementedError();
  }


}