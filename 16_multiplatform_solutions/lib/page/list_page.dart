import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/layout/narrow_layout.dart';
import 'package:multiplatform_solutions/layout/ultra_wide_layout.dart';
import 'package:multiplatform_solutions/layout/wide_layout.dart';
import 'package:multiplatform_solutions/model/person.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _currentPerson = 0;
  late void Function(int) _onPersonTap;
  @override
  void initState() {
    super.initState();
    _onPersonTap = (index) {
      setState(() {
        _currentPerson = index;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: ((context, constraints) {
        return constraints.maxWidth > 600
            ? WideLayout(
                currentPerson: _currentPerson, onPersonTap: _onPersonTap)
            : NarrowLayout(
                currentPerson: _currentPerson, onPersonTap: _onPersonTap);
      }),
    ));
  }
}
