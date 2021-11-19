import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horizontal List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HorizontalList(),
    );
  }
}

class HorizontalList extends StatefulWidget {
  HorizontalList({Key key}) : super(key: key);

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  List<Widget> data = List.generate(9, (index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.green[(index + 1) * 100],
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
              double _widht = constrains.constrainWidth();
              return _widht > 500
                  ? Container(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              height: 100,
                              child: data[index],
                            );
                          }),
                    )
                  : Container(
                      height: 100,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 100,
                              child: data[index],
                            );
                          }),
                    );
            },
          ),
        ),
      ),
    );
  }
}
