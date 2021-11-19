import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_todo_list/pages/authorization_page.dart';
import 'package:flutter_todo_list/pages/not_found.dart';
import 'package:flutter_todo_list/pages/profile_page.dart';
import 'package:flutter_todo_list/pages/todo_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Center(
        child: Text('Что-то пошло не так'),
      );
    }
    if (!_initialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return MaterialApp(
      title: 'Todo list',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return NotFound();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case AuthorizationPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return AuthorizationPage();
            });

          case TodoListPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (BuildContext context) {
              return TodoListPage(user: args['user']);
            });

          case ProfilePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return ProfilePage();
            });

          default:
            MaterialPageRoute(builder: (BuildContext context) {
              return NotFound();
            });
        }
      },
      theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline1: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white)),
          unselectedWidgetColor: Colors.white),
      home: AuthorizationPage(),
    );
  }
}
