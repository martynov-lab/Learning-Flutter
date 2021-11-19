import 'package:catch_error/fetch_file.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CatchError(),
    );
  }
}

class CatchError extends StatefulWidget {
  static const routeName = '/fetch';
  CatchError({Key key}) : super(key: key);

  @override
  _CatchErrorState createState() => _CatchErrorState();
}

class _CatchErrorState extends State<CatchError> {
  Future<String> _text;
  //bool hasError = false;
  @override
  void initState() {
    super.initState();
    _text = fetchFileFromAssets('assets/data.txt');
    //getData();
  }

  // getData() async {
  //   try {
  //     _text = fetchFileFromAssets('assets/text_example1.txt');
  //   } catch (e) {
  //     setState(() {
  //       print(e);
  //       hasError = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catch error'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            FutureBuilder(
              future: _text,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.done:
                    return snapshot.hasError
                        ? Text("файл не найден")
                        : Text(
                            snapshot.data,
                            textAlign: TextAlign.justify,
                          );
                  default:
                    Center(
                      child: CircularProgressIndicator(),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}