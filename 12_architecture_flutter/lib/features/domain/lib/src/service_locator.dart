//import 'package:data/module_data.dart';
import 'package:data/module_data.dart';
import 'package:domain/module_domain.dart';
import 'package:get_it/get_it.dart';

class ServiceLocatorDomain {
  static final _sl = GetIt.instance;

  T get<T extends Object>() => _sl.get<T>();

  static final instance = ServiceLocatorDomain();

  void init() {
    ServiceLocatorData.instance.init();
    // UseCases
    _sl.registerLazySingleton(() =>
        GetAllPersons(personRepository: ServiceLocatorData.instance.get()));
  }
}
