import 'package:advanced_widgets/common/theme_switcher.dart';
import 'package:flutter/material.dart';

class TextWeatherWidget extends StatefulWidget {
  @override
  State<TextWeatherWidget> createState() => _TextWeatherWidgetState();
}

class _TextWeatherWidgetState extends State<TextWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Облачно',
            textAlign: TextAlign.center,
            style: ThemeSwitcher.of(context)
                ?.themeModel
                .theme
                .textTheme
                .bodyText2),
        Text('12°',
            textAlign: TextAlign.center,
            style: ThemeSwitcher.of(context)
                ?.themeModel
                .theme
                .textTheme
                .bodyText2),
      ],
    );
  }
}
