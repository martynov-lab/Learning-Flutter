import 'package:flutter/material.dart';

class Todo {
  UniqueKey id;
  String title;
  bool isDone;

  Todo({required this.id, required this.title, required this.isDone});
}
