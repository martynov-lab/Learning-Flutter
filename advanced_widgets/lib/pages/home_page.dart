import 'package:advanced_widgets/common/theme.dart';
import 'package:advanced_widgets/common/theme_switcher.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        //backgroundColor: Theme.of(context).backgroundColor,

        child: Builder(
          builder: (innerContext) => Column(
            children: <Widget>[
              DrawerHeader(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
              ),
              ListTile(
                title: const Text('Green'),
                trailing: const Icon(
                  Icons.invert_colors,
                  color: Colors.green,
                ),
                onTap: () {
                  setState(() {
                    var currentTheme = deepPurpleThemeLight();
                  });
                  print('Green');
                },
              ),
              ListTile(
                title: const Text('Brown'),
                trailing: const Icon(
                  Icons.invert_colors,
                  color: Colors.brown,
                ),
                onTap: () {
                  print('Brown');
                },
              ),
              ListTile(
                title: const Text('Purple'),
                trailing: const Icon(
                  Icons.invert_colors,
                  color: Colors.deepPurple,
                ),
                onTap: () {
                  print('Purple');
                },
              ),
              ListTile(
                title: const Text('Indigo'),
                trailing: const Icon(
                  Icons.invert_colors,
                  color: Colors.indigo,
                ),
                onTap: () {
                  print('Indigo');
                },
              ),
              ListTile(
                title: const Text('Dark'),
                trailing: const Icon(
                  Icons.invert_colors,
                  color: Colors.black,
                ),
                onTap: () {
                  print('Dark');
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text(
          'You have pushed the button this many times:',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
