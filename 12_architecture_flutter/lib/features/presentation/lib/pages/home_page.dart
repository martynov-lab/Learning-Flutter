import 'package:flutter/material.dart';
import 'package:presentation/widgets/persons_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PersonsList(),
    );
  }
}
