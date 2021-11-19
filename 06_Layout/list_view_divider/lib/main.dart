import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Divider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListViewDivider(),
    );
  }
}

class ListViewDivider extends StatefulWidget {
  ListViewDivider({Key key}) : super(key: key);

  @override
  _ListViewDividerState createState() => _ListViewDividerState();
}

class _ListViewDividerState extends State<ListViewDivider> {
  List<int> data = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: data.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Text('${data[index]}'),
            );
          },
        ),
      ),
    );
  }
}
