import 'package:advanced_widgets/common/theme.dart';
import 'package:advanced_widgets/common/theme_switcher.dart';
import 'package:advanced_widgets/pages/home_page.dart';
import 'package:advanced_widgets/Widgets/weather_indicator.dart';
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
