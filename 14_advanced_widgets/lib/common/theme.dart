import 'package:flutter/material.dart';

ThemeData greenThemeLight() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green[200],
      scaffoldBackgroundColor: Colors.grey[100],
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(color: Colors.green[600]),
      textTheme: TextTheme(
        headline6: const TextStyle(fontSize: 16, color: Colors.white),
        headline4: TextStyle(
            fontSize: 32,
            color: Colors.green[600],
            fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[600]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[850], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
        bodyText2: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.green[600],
        height: 80,
        textTheme: ButtonTextTheme.accent,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    );

ThemeData brownThemeLight() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.brown[200],
      scaffoldBackgroundColor: Colors.grey[50],
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(color: Colors.brown[600]),
      textTheme: TextTheme(
        headline6: const TextStyle(fontSize: 16, color: Colors.white),
        headline4: TextStyle(
            fontSize: 32,
            color: Colors.brown[600],
            fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[600]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[850], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
        bodyText2: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.brown[600],
        foregroundColor: Colors.white,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.brown[600],
        height: 80,
        textTheme: ButtonTextTheme.accent,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    );

ThemeData deepPurpleThemeLight() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.deepPurple[200],
      scaffoldBackgroundColor: Colors.grey[50],
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(color: Colors.deepPurple[600]),
      textTheme: TextTheme(
        headline6: const TextStyle(fontSize: 16, color: Colors.white),
        headline4: TextStyle(
            fontSize: 32,
            color: Colors.deepPurple[400],
            fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[600]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[850], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
        bodyText2: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepPurple[600],
        foregroundColor: Colors.white,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.deepPurple[600],
        height: 80,
        textTheme: ButtonTextTheme.accent,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    );

ThemeData indigoThemeLight() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.indigo[200],
      scaffoldBackgroundColor: Colors.grey[50],
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(color: Colors.indigo[600]),
      textTheme: TextTheme(
        headline6: const TextStyle(fontSize: 16, color: Colors.white),
        headline4: TextStyle(
            fontSize: 32,
            color: Colors.indigo[600],
            fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[600]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[850], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
        bodyText2: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.indigo[600],
        foregroundColor: Colors.white,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.indigo[600],
        height: 80,
        textTheme: ButtonTextTheme.accent,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    );

ThemeData blueGreyThemeDark() => ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey[200],
      scaffoldBackgroundColor: Colors.blueGrey[900],
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 16, color: Colors.grey[200]),
        headline4: TextStyle(
            fontSize: 32, color: Colors.grey[600], fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[300]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[200], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
        bodyText2: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blueGrey[600],
        foregroundColor: Colors.grey[200],
      ),
    );

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  textTheme: TextTheme(
    headline6: TextStyle(fontSize: 16, color: Colors.grey[200]),
    headline4: TextStyle(
        fontSize: 32, color: Colors.blue[600], fontWeight: FontWeight.w800),
    headline1: TextStyle(fontSize: 26, color: Colors.grey[300]),
    subtitle1: TextStyle(
        fontSize: 18, color: Colors.grey[200], fontWeight: FontWeight.w800),
    bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
    bodyText2: TextStyle(fontSize: 16, color: Colors.grey[600]),
  ),
);

ThemeData _themeDark = ThemeData.dark();

ThemeData themeDark = _themeDark.copyWith(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
  textTheme: TextTheme(
    headline6: TextStyle(fontSize: 16, color: Colors.grey[200]),
    headline4: TextStyle(
        fontSize: 32, color: Colors.grey[300], fontWeight: FontWeight.w800),
    headline1: TextStyle(fontSize: 26, color: Colors.grey[300]),
    subtitle1: TextStyle(
        fontSize: 18, color: Colors.grey[200], fontWeight: FontWeight.w800),
    bodyText1: const TextStyle(fontSize: 16, color: Colors.white),
    bodyText2: const TextStyle(fontSize: 16, color: Colors.white),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blueGrey[600],
    foregroundColor: Colors.grey[200],
  ),
);
