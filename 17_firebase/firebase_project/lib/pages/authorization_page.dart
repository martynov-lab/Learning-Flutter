import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_todo_list/pages/profile_page.dart';
import 'package:flutter_todo_list/pages/todo_list.dart';
import 'package:flutter_todo_list/services/authorization_service.dart';
import 'package:flutter_todo_list/services/validator.dart';

class AuthorizationPage extends StatefulWidget {
  static const routeName = '/';
  AuthorizationPage({Key? key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name, _email, _password;
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Container(
          child: Align(
            child: Text(
              'TODO',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          validator: (value) {
            switch (hint) {
              case "Email":
                return Validator.validateEmail(email: value.toString());
              case "Password":
                return Validator.validatePassword(password: value.toString());
              case "User Name":
                return Validator.validateName(name: value.toString());
              default:
            }
          },
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 20,
              color: Colors.white30,
              fontWeight: FontWeight.bold,
            ),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: icon,
              ),
            ),
          ),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Theme.of(context).primaryColor,
        ),
        onPressed: func,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget _formLogin(String label, void func()) {
      return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 80),
              child:
                  _input(Icon(Icons.email), 'Email', _emailController, false),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _input(
                  Icon(Icons.lock), 'Password', _passwordController, true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }

    Widget _formRegister(String label, void func()) {
      return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 40),
              child: _input(
                  Icon(Icons.person), 'User Name', _nameController, false),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child:
                  _input(Icon(Icons.email), 'Email', _emailController, false),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _input(
                  Icon(Icons.lock), 'Password', _passwordController, true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }

    void _loginButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_formKey.currentState!.validate()) {
        User? user = await AthorizationService.singIn(
            email: _email, password: _password);
        if (user != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Вы авторизованы'),
            backgroundColor: Colors.green,
          ));

          Navigator.of(context)
              .pushNamed(TodoListPage.routeName, arguments: {'user': user});

          _emailController.clear();
          _passwordController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Вы ввели не правильный пароль или логин!'),
            backgroundColor: Colors.red,
          ));

          _emailController.clear();
          _passwordController.clear();
        }
      }
    }

    void _registerButtonAction() async {
      _name = _nameController.text;
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_formKey.currentState!.validate()) {
        User? user = await AthorizationService.register(
          name: _name,
          email: _email,
          password: _password,
        );

        if (user != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Вы зарегистрированы'),
            backgroundColor: Colors.green,
          ));
          Navigator.of(context)
              .pushNamed(TodoListPage.routeName, arguments: {'user': user});
          _nameController.clear();
          _emailController.clear();
          _passwordController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Что-то пошло не так'),
            backgroundColor: Colors.red,
          ));
          _nameController.clear();
          _emailController.clear();
          _passwordController.clear();
        }
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _logo(),
            showLogin
                ? Column(
                    children: <Widget>[
                      _formLogin('LOGIN', _loginButtonAction),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Text(
                                'Not registered yet?',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                'Register!',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white38),
                              ),
                              onTap: () {
                                setState(() {
                                  showLogin = false;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      _formRegister('REGISTERE', _registerButtonAction),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Text(
                                'Aready registered?',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white38),
                              ),
                              onTap: () {
                                setState(() {
                                  showLogin = true;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
