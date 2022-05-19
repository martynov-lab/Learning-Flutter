import 'package:advanced_widgets/Widgets/weather_indicator.dart';
import 'package:advanced_widgets/common/theme.dart';
import 'package:advanced_widgets/common/theme_switcher.dart';
import 'package:advanced_widgets/Widgets/text_weather_indicator.dart';
import 'package:flutter/material.dart';

import '../common/inner_shadow.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleWeather;
  late Animation<double> moveDownWeather;
  late Animation<double> moveLeftWeather;

  late Animation<double> moveDownText;
  late Animation<double> scaleText;
  late Animation<double> opacityText;

  ThemeData? currentTheme;
  bool isShowAnimationWeather = false;

  double opacityVisible = 0.0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    scaleWeather = Tween(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
          parent: controller, curve: Curves.easeInSine /*easeInOutBack*/),
    );
    moveDownWeather = Tween(begin: 0.0, end: 120.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
    );
    moveLeftWeather = Tween(begin: 130.0, end: 0.0).animate(controller);
    scaleText = Tween(begin: 0.0, end: 1.0).animate(controller);
    moveDownText = Tween(begin: 0.0, end: 80.0).animate(controller);
    opacityText = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.350,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );

    controller.addListener(() {
      print('Статус анимацию: ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        if (!isShowAnimationWeather) {
          controller.reverse();
        }
      }
      // if (controller.status == AnimationStatus.dismissed) {
      //    controller.reverse();
      // }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isShowAnimationWeather ? controller.forward() : controller.reverse();

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
                ThemeSwitcher.of(context)?.themeModel.theme =
                    deepPurpleThemeLight();
                setState(() {});
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
                ThemeSwitcher.of(context)?.themeModel.theme =
                    indigoThemeLight();
                setState(() {});
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
                ThemeSwitcher.of(context)?.themeModel.theme = themeDark;
                setState(() {});
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
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AnimatedBuilder(
                animation: controller,
                builder: (context, childWidget) {
                  return Transform.translate(
                    offset:
                        Offset(moveLeftWeather.value, moveDownWeather.value),
                    child: Transform.scale(
                      scale: scaleWeather.value,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowAnimationWeather = !isShowAnimationWeather;
                          });
                          print('Показывать анимацию: $isShowAnimationWeather');
                        },
                        child: Stack(children: [
                          Transform.translate(
                            offset: Offset(0.0, moveDownText.value),
                            child: Opacity(
                              opacity: opacityText.value,
                              child: Transform.scale(
                                scale: scaleText.value,
                                child: TextWeatherWidget(),
                              ),
                            ),
                          ),
                          WeatherIndicator(opacityVisible: opacityVisible),
                        ]),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 50),
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
