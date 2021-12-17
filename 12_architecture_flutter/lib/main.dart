import 'package:architecture_flutter/features/presentation/lib/pages/home_page.dart';
import 'package:architecture_flutter/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/person_list_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocatorPresentantion.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonListBloc>(
      create: (context) =>
          ServiceLocatorPresentantion.instance.get<PersonListBloc>()
            ..add(PersonListLoaded()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
