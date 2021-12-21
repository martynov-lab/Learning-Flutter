import 'package:data/module_data.dart';
import 'package:get_it/get_it.dart';

import 'person_list_bloc.dart';

class ServiceLocatorBloc {
  static final _sl = GetIt.instance;

  T get<T extends Object>() => _sl.get<T>();

  static final instance = ServiceLocatorBloc();

  void init() {
    ServiceLocatorData.instance.init();
    // UseCases
    _sl.registerFactory<PersonListBloc>(
      () => PersonListBloc(
        personRepository: ServiceLocatorData.instance.get<PersonRepository>(),
      ),
    );
  }
}
