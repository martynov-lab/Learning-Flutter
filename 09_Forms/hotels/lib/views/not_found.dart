import 'package:flutter/material.dart';

class NoteFound extends StatelessWidget {
  const NoteFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Страница не найдена'),
        ),
      ),
    );
  }
}