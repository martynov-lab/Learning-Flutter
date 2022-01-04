import 'package:business/module_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/persons_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = ServiceLocatorBloc.instance.get<PersonListBloc>();
    return BlocProvider<PersonListBloc>(
      create: (context) => _bloc..add(PersonLoadedEvent()),
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
