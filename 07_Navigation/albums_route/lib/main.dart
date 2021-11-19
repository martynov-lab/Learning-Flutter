import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataArtists {
  final String name;
  final String about;

  DataArtists(this.name, this.about);

  DataArtists.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        about = json['about'];
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return NotFound();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            });
            break;
          case AlbumsPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return AlbumsPage();
            });
          case Artist.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (BuildContext context) {
              if (args != null && args.containsKey('name')) {
                print(args['name']);
                return Artist(name: args['name'], about: args['about']);
              }
              return Artist();
            });
          default:
            MaterialPageRoute(builder: (BuildContext context) {
              return NotFound();
            });
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  static const routeName = '/';
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(HomePage.routeName);
                  print('TAP Home');
                },
              ),
              ListTile(
                title: Text('Albums'),
                onTap: () {
                  Navigator.of(context).pushNamed(AlbumsPage.routeName);
                  print('TAP Albums');
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Routes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Routes',
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumsPage extends StatefulWidget {
  static const routeName = '/albums';
  AlbumsPage({Key key}) : super(key: key);

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  var data_list = const [];

  Future loadDataList() async {
    String content = await rootBundle.loadString('assets/artists.json');
    List collection = json.decode(content);
    List<DataArtists> _data =
        collection.map((json) => DataArtists.fromJson(json)).toList();

    setState(() {
      data_list = _data;
    });
  }

  void initState() {
    loadDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                ListTile(
                  title: Text('Home'),
                  onTap: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                    print('TAP Home');
                  },
                ),
                ListTile(
                  title: Text(
                    'Albums',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(AlbumsPage.routeName);
                    print('TAP Albums');
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(),
        body: Container(
          child: ListView.builder(
            itemCount: data_list.length,
            itemBuilder: (BuildContext context, int index) {
              DataArtists data = data_list[index];
              return ListTile(
                title: Text(data.name),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pushNamed(Artist.routeName,
                      arguments: {'name': data.name, 'about': data.about});
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class Artist extends StatefulWidget {
  static const routeName = '/artist';
  Artist({Key key, this.name, this.about}) : super(key: key);
  String name, about;

  @override
  _ArtistState createState() => _ArtistState();
}

class _ArtistState extends State<Artist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text('${widget.about}'),
          ),
        ),
      ),
    );
  }
}

class NotFound extends StatelessWidget {
  const NotFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Страница не найдена!'),
        ),
      ),
    );
  }
}
