import 'package:advanced_widgets/common/theme_switcher.dart';
import 'package:flutter/material.dart';

class TextWeatherWidget extends StatefulWidget {
  @override
  State<TextWeatherWidget> createState() => _TextWeatherWidgetState();
}

class _TextWeatherWidgetState extends State<TextWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Облачно',
              style: ThemeSwitcher.of(context)
                  ?.themeModel
                  .theme
                  .textTheme
                  .bodyText2),
          Text('12°',
              style: ThemeSwitcher.of(context)
                  ?.themeModel
                  .theme
                  .textTheme
                  .bodyText2),
        ],
      ),
    );
  }
}
