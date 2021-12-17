import 'package:domain/module_domain.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/bloc/person_list_bloc.dart';

class ServiceLocatorPresentantion {
  static final _sl = GetIt.instance;

  T get<T extends Object>() => _sl.get<T>();

  static final instance = ServiceLocatorPresentantion();

  void init() {
    ServiceLocatorDomain.instance.init();
    // BLoC / Cubit
    _sl.registerFactory(
      () => PersonListBloc(
          getAllPersons: ServiceLocatorDomain.instance.get<GetAllPersons>()),
    );
  }
}
