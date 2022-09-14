import 'package:first_project/features/simple_app/data/repositories/simple_app_repository_impl.dart';
import 'package:first_project/features/simple_app/domain/usecases/post_login.dart';
import 'package:first_project/features/simple_app/presentation/auth/blocs/auth/auth_bloc.dart';
import 'package:first_project/features/simple_app/presentation/auth/blocs/data/data_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/simple_app/data/datasources/remote/simple_app_remote_data_source.dart';
import 'features/simple_app/domain/repositories/simple_app_repository.dart';
import 'features/simple_app/domain/usecases/get_data.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //!Blocs
  sl.registerFactory(
    () => AuthBloc(
      sl(),
    ),
  );

  sl.registerFactory(
    () => DataBloc(
      sl(),
    ),
  );

  //Use cases
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => GetData(sl()));

  //Repository
  sl.registerLazySingleton<SimpleAppRepository>(
      () => SimpleAppRepositoryImpl(sl()));

  //Data sources
  sl.registerLazySingleton<SimpleAppRemoteDataSource>(
      () => SimpleAppRemoteDataSourceImpl(client: sl()));

  //!Core

  //!External
  sl.registerLazySingleton(() => http.Client());
}
