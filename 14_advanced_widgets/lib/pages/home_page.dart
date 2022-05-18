import 'package:advanced_widgets/common/theme.dart';
import 'package:advanced_widgets/common/theme_switcher.dart';
import 'package:advanced_widgets/pages/animation_widget.dart';
import 'package:flutter/material.dart';

import '../common/inner_shadow.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeData? currentTheme;
  bool isShowDetailedWeather = false;
  double opacityVisible = 0.0;

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
        backgroundColor:
            ThemeSwitcher.of(context)?.themeModel.theme.backgroundColor,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                radius: 50,
                backgroundColor:
                    ThemeSwitcher.of(context)?.themeModel.theme.primaryColor,
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
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 70),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isShowDetailedWeather = !isShowDetailedWeather;
                });
              },
              child: SizedBox(
                height: 80,
                width: 80,
                child: AnimationWidget(
                  opacityVisible: opacityVisible,
                  isShowAnimation: isShowDetailedWeather,
                ),
              ),
            ),
            SizedBox(height: 50),
            InnerShadow(
              blur: 5,
              color: Colors.black,
              offset: const Offset(2, 2),
              child: Text(
                'Weather',
                style: TextStyle(
                    fontSize: 92,
                    fontWeight: FontWeight.w900,
                    color: Colors.red[300]),
              ),
            ),
            Slider(
              activeColor: Colors.grey[300],
              inactiveColor:
                  ThemeSwitcher.of(context)?.themeModel.theme.primaryColor,
              min: 0.0,
              max: 1.0,
              label: '$opacityVisible',
              divisions: 100,
              value: opacityVisible,
              onChanged: (v) {
                setState(() {
                  opacityVisible = v;
                });
              },
            )
          ],
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
