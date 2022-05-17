import 'package:advanced_widgets/common/theme.dart';
import 'package:advanced_widgets/common/theme_switcher.dart';
import 'package:advanced_widgets/pages/weather_indicator.dart';
import 'package:flutter/material.dart';

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
                width: MediaQuery.of(context).size.width,
                child: isShowDetailedWeather
                    ? Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: WeatherIndicator(
                                opacityVisible: opacityVisible),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: WeatherIndicator(
                                opacityVisible: opacityVisible),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Облачно'),
                          const Text('12°'),
                        ],
                      ),
              ),
            ),
            Slider(
              activeColor: Colors.grey[300],
              min: 0.0,
              max: 1.0,
              label: '$opacityVisible',
              divisions: 10,
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
