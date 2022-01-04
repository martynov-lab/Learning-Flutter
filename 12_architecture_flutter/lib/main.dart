import 'package:business/module_domain.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocatorBloc.instance.init();
  runApp(MyApp());
}
