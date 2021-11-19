import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Field Styled',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TextFieldStyled(),
    );
  }
}

class TextFieldStyled extends StatefulWidget {
  TextFieldStyled({Key key}) : super(key: key);

  @override
  _TextFieldStyledState createState() => _TextFieldStyledState();
}

class _TextFieldStyledState extends State<TextFieldStyled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                ),
                labelText: 'Search',
                labelStyle: const TextStyle(color: Colors.purple),
                hintText: 'Введите значение',
                helperText: 'Поле для поиска заметок',
                suffixIcon: const Icon(Icons.search, color: Colors.purple),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
