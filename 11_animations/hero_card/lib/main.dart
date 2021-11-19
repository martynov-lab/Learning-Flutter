import 'package:flutter/material.dart';
import 'package:hero_card/space.dart';

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
      home: HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: spaces
              .map(
                (space) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailView(data: space),
                      ),
                    );
                  },
                  child: Container(
                    //margin: const EdgeInsets.only(bottom: 10),
                    height: 150,
                    child: Card(
                      elevation: 5,
                      color: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: Hero(
                              tag: space.id,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(15.0)),
                                      child: Image.asset(space.image,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Positioned(
                                    right: 20,
                                    bottom: -20,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.yellow,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Hero(
                              tag: "${space.id}-title",
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    space.description,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   padding: const EdgeInsets.all(8),
                          //   color: Colors.yellow,
                          //   child: Icon(Icons.add),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({Key key, this.data}) : super(key: key);
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: data.id,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Image.asset(data.image),
                    Positioned(
                      right: 20,
                      bottom: -20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.yellow,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                )),
            Hero(
              tag: "${data.id}-title",
              child: Container(
                padding: const EdgeInsets.only(
                    top: 20, right: 10, left: 10, bottom: 10),
                child: Material(
                  child: Text(data.description),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
