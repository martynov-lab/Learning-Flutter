import 'package:data/src/datasources/person_repository.dart';
import 'package:get_it/get_it.dart';

import 'datasources/person_remote_data_source.dart';

class ServiceLocatorData {
  static final _sl = GetIt.instance;

  T get<T extends Object>() => _sl.get<T>();

  static final instance = ServiceLocatorData();

  void init() {
    // Repository
    _sl.registerLazySingleton<PersonRepository>(
        () => PersonRemoteDataSources());
  }
}
