import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlutterDemoHomePage(),
    );
  }
}

class TabItem {
  String title;
  Icon icon;
  TabItem({this.title, this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: 'Photo', icon: Icon(Icons.photo)),
  TabItem(title: 'Chat', icon: Icon(Icons.chat)),
  TabItem(title: 'Albums', icon: Icon(Icons.album)),
];

class FlutterDemoHomePage extends StatefulWidget {
  FlutterDemoHomePage({Key key}) : super(key: key);

  @override
  _FlutterDemoHomePageState createState() => _FlutterDemoHomePageState();
}

class _FlutterDemoHomePageState extends State<FlutterDemoHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController _controller;
  int summ = 200;
  bool _isHidden = true;
  TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      print('Listener: ${_tabController.index}');
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  void toggleWidget() {
    //скрытие и появление кнопки FloatingActionButton
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void toggleBottomSheet() {
    _controller = scaffoldKey.currentState.showBottomSheet(
      (context) => Container(
        padding: const EdgeInsets.only(top: 30, bottom: 50),
        color: Colors.white,
        height: 200,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Сумма'),
              leading: Icon(Icons.credit_card),
              trailing: Text('$summ' + ' руб'),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[400],
                  elevation: 4,
                ),
                child: Text(
                  'Оплатить',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  print(
                      'pressed BottomSheet Pay'); //закрытие BottomSheet по кнопке Оплатить
                  _controller.close();
                  _controller = null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Flutter DemoHome Page'),
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  }),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    DrawerHeader(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      ),
                    ),
                    ListTile(
                      title: Text('Home'),
                      leading: Icon(Icons.home),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        print("pressed Drwaer Home");
                      },
                    ),
                    ListTile(
                      title: Text('Profile'),
                      leading: Icon(Icons.portrait),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        print("pressed Drwaer Profile");
                      },
                    ),
                    ListTile(
                      title: Text('Image'),
                      leading: Icon(Icons.image),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        print("pressed Drwaer Image");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[400],
                        elevation: 4,
                      ),
                      child: Text(
                        'Выход',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        print('pressed Drwaer Exit');
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[400],
                        elevation: 4,
                      ),
                      child: Text(
                        'Регистрация',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        print('pressed Drwaer Registration');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                ),
                Text('Username'),
              ],
            ),
          ),
        ),
        floatingActionButton: !_isHidden
            ? null
            : FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  toggleBottomSheet();
                  toggleWidget();
                  _controller.closed.then((value) { //отображаю кнопку после закрытия BottomSheet !!!!!!!!!!!!!!!!!!!!!!!!!!!!1
                    print("BottomSheet closing");
                    toggleWidget();
                  });
                }),

        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              color: Colors.green[100],
              child: Center(
                child: Text(
                  'Photo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[600]),
                ),
              ),
            ),
            Container(
              color: Colors.yellow[100],
              child: Center(
                child: Text(
                  'Chat',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[600]),
                ),
              ),
            ),
            Container(
              color: Colors.blue[100],
              child: Center(
                child: Text(
                  'Albums',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _tabController.index = index;
              _currentTabIndex = index;
            });
          },
          currentIndex: _currentTabIndex,
          items: [
            for (final item in _tabBar)
              BottomNavigationBarItem(label: item.title, icon: item.icon)
          ],
        ),
      ),
    );
  }
}

