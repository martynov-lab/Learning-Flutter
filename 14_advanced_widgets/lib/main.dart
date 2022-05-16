import 'package:advanced_widgets/common/theme.dart';
import 'package:advanced_widgets/common/theme_switcher.dart';
import 'package:advanced_widgets/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //ThemeSwitcher.of(context)?.themeModel.theme = greenThemeLight();
  }

  ThemeData _currentTheme = ThemeData.light();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final model = ThemeSwitcher.of(context)?.themeModel;
    model?.addListener(() {
      //_currentTheme = model.getTheme();
      //print(_currentTheme.backgroundColor);
      setState(() {
        _currentTheme = model.theme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      themeModel: ThemeStyle(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: _currentTheme,
        //ThemeSwitcher.of(context)?.themeModel.theme,
        home: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeData? currentTheme;
  // @override
  // void initState() {
  //   super.initState();
  //   currentTheme = greenThemeLight();
  // }

  // ThemeData currentTheme = greenThemeLight();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ThemeSwitcher.of(context)?.themeModel.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: ThemeSwitcher.of(context)
            ?.themeModel
            .theme
            .appBarTheme
            .backgroundColor,
      ),
      drawer: Drawer(
        //backgroundColor: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                radius: 50,
                backgroundColor:
                    ThemeSwitcher.of(context)?.themeModel.theme.backgroundColor,
              ),
            ),
            ListTile(
              title: const Text('Green'),
              trailing: const Icon(
                Icons.invert_colors,
                color: Colors.green,
              ),
              onTap: () {
                ThemeSwitcher.of(context)?.themeModel.theme = greenThemeLight();
                setState(() {});
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
                ThemeSwitcher.of(context)?.themeModel.theme = brownThemeLight();
                setState(() {});

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
                setState(() {
                  ThemeSwitcher.of(context)?.themeModel.theme =
                      deepPurpleThemeLight();
                });
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
                setState(() {
                  ThemeSwitcher.of(context)?.themeModel.theme =
                      indigoThemeLight();
                });
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
                setState(() {
                  ThemeSwitcher.of(context)?.themeModel.theme = themeDark;
                });
                print('Dark');
              },
            ),
          ],
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
        backgroundColor: ThemeSwitcher.of(context)
            ?.themeModel
            .theme
            .floatingActionButtonTheme
            .backgroundColor,
        onPressed: () {},
      ),
    );
  }
}
