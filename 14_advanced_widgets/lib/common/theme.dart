import 'package:flutter/material.dart';

ThemeData greenThemeLight() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green[600],
      scaffoldBackgroundColor: Colors.grey[100],
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(color: Colors.green[600]),
      textTheme: TextTheme(
        headline6: const TextStyle(fontSize: 16, color: Colors.white),
        headline4: TextStyle(
            fontSize: 20, color: Colors.grey[800], fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[600]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[850], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
      primaryColor: Colors.brown[600],
      scaffoldBackgroundColor: Colors.grey[50],
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(color: Colors.brown[600]),
      textTheme: TextTheme(
        headline6: const TextStyle(fontSize: 16, color: Colors.white),
        headline4: TextStyle(
            fontSize: 20,
            color: Colors.brown[800],
            fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[600]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[850], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
      primaryColor: Colors.deepPurple[600],
      scaffoldBackgroundColor: Colors.grey[50],
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(color: Colors.deepPurple[600]),
      textTheme: TextTheme(
        headline6: const TextStyle(fontSize: 16, color: Colors.white),
        headline4: TextStyle(
            fontSize: 20,
            color: Colors.deepPurple[800],
            fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[600]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[850], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
      primaryColor: Colors.indigo[600],
      scaffoldBackgroundColor: Colors.grey[50],
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(color: Colors.indigo[600]),
      textTheme: TextTheme(
        headline6: const TextStyle(fontSize: 16, color: Colors.white),
        headline4: TextStyle(
            fontSize: 20,
            color: Colors.indigo[800],
            fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[600]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[850], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
      primaryColor: Colors.blueGrey[600],
      scaffoldBackgroundColor: Colors.blueGrey[900],
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 16, color: Colors.grey[200]),
        headline4: TextStyle(
            fontSize: 20, color: Colors.grey[300], fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[300]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[200], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[400]),
        bodyText2: TextStyle(fontSize: 16, color: Colors.grey[400]),
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
);

ThemeData _themeDark = ThemeData.dark();

ThemeData themeDark = _themeDark.copyWith(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
  textTheme: TextTheme(
    headline6: TextStyle(fontSize: 16, color: Colors.grey[200]),
    headline4: TextStyle(
        fontSize: 20, color: Colors.grey[300], fontWeight: FontWeight.w800),
    headline1: TextStyle(fontSize: 26, color: Colors.grey[300]),
    subtitle1: TextStyle(
        fontSize: 18, color: Colors.grey[200], fontWeight: FontWeight.w800),
    bodyText1: const TextStyle(fontSize: 16, color: Colors.white),
    bodyText2: const TextStyle(fontSize: 16, color: Colors.white),
  ),
);
