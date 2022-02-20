import 'package:flutter/material.dart';

class ThemeSwitcher extends InheritedWidget {
  final ThemeStyle themeModel;

  const ThemeSwitcher({
    required this.themeModel,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  static ThemeSwitcher? of(BuildContext context) {
    // final result = context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>();
    // assert(result != null, 'No ThemeStyle found in context');
    // return result!.themeModel;
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>();
  }

  @override
  bool updateShouldNotify(ThemeSwitcher oldWidget) =>
      themeModel != oldWidget.themeModel;
}

class ThemeStyle extends ChangeNotifier {
  ThemeData? theme;

  getTheme() {
    ThemeData? theme;
    if (this.theme != theme) {
      this.theme = theme;
      notifyListeners();
    }
  }

  //ThemeData? getTheme() => theme;

  //final ThemeData theme;

  //ThemeStyle({required this.theme});
}
