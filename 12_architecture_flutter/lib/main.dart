import 'package:business/module_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'persons_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocatorBloc.instance.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonListBloc _bloc = ServiceLocatorBloc.instance.get<PersonListBloc>();
    return BlocProvider<PersonListBloc>(
      create: (context) => _bloc..add(PersonEventLoaded()),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          backgroundColor: Colors.grey,
          scaffoldBackgroundColor: Colors.grey,
        ),
        home: PersonsList(),
      ),
    );
  }
}
