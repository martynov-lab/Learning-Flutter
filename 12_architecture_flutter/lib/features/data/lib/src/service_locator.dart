import 'package:data/src/datasources/impl_person_remote_data_source.dart';
import 'package:data/src/datasources/person_remote_data_source.dart';
import 'package:data/src/repositories/person_repository_impl.dart';
import 'package:domain/module_domain.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class ServiceLocatorData {
  static final _sl = GetIt.instance;

  T get<T extends Object>() => _sl.get<T>();

  static final instance = ServiceLocatorData();

  void init() {
    // Repository
    _sl.registerLazySingleton<PersonRemoteDataSource>(
        () => PersonRemoteDataSourcesImpl(client: _sl()));

    _sl.registerLazySingleton<PersonRepository>(
        () => PersonRepositoryImpl(personRemoteDataSource: _sl()));

    // External
    _sl.registerLazySingleton(() => http.Client());
  }
}
