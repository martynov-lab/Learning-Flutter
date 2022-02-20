import 'package:flutter/material.dart';

ThemeData greenThemeLight() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green[600],
      scaffoldBackgroundColor: Colors.grey[100],
      backgroundColor: Colors.green[600],
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
      backgroundColor: Colors.brown[600],
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
      backgroundColor: Colors.deepPurple[600],
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
      backgroundColor: Colors.indigo[600],
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
      backgroundColor: Colors.blueGrey[600],
      appBarTheme: const AppBarTheme(color: Colors.blueGrey),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 16, color: Colors.grey[200]),
        headline4: TextStyle(
            fontSize: 20, color: Colors.grey[300], fontWeight: FontWeight.w800),
        headline1: TextStyle(fontSize: 26, color: Colors.grey[300]),
        subtitle1: TextStyle(
            fontSize: 18, color: Colors.grey[200], fontWeight: FontWeight.w800),
        bodyText1: TextStyle(fontSize: 16, color: Colors.grey[400]),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blueGrey[600],
        foregroundColor: Colors.grey[200],
      ),
      // buttonTheme: const ButtonThemeData(
      //   buttonColor: Colors.blueGrey,
      //   height: 80,
      //   textTheme: ButtonTextTheme.accent,
      // ),
      // colorScheme:
      //     ColorScheme.fromSwatch().copyWith(secondary: Colors.grey[200]),
    );
// ThemeData _themeLight = ThemeData.light();

// ThemeData themeLight = _themeLight.copyWith(
//   //accentColor: Colors.black54,
//   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
//       .copyWith(secondary: Colors.black54),
//   primaryColor: Colors.white,
//   primaryColorDark: Colors.deepOrange[100],
//   //! цвет circularProgressIndicator
//   //colorScheme: ColorScheme.light(primary: Colors.black54),
//   //! цвет фона AlertDialog
//   dialogBackgroundColor: Colors.grey[400],
//   //! TextTheme
//   textTheme: _textLight(_themeLight.textTheme),
//   //! AppBar
//   appBarTheme: AppBarTheme(
//     color: Colors.black54,
//     actionsIconTheme: IconThemeData(
//       color: Colors.deepOrange[100],
//     ),
//   ),
//   //! textField
//   inputDecorationTheme: const InputDecorationTheme(
//     focusedBorder: UnderlineInputBorder(
//       borderSide: BorderSide(color: Colors.grey),
//     ),
//     // hintStyle: TextStyle(
//     //   color: Colors.black54,
//     //   fontSize: 16,
//     // ),
//     // labelStyle: TextStyle(color: Colors.deepOrange[100]),
//     // suffixStyle: TextStyle(
//     //     backgroundColor: Colors.deepOrange[100], color: Colors.deepOrange[100]),
//   ),
//   //! Card
//   cardTheme: CardTheme(
//     color: Colors.deepOrange[100],
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     elevation: 10,
//     margin: const EdgeInsets.all(15),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//   ),
//   //! BottomNavigationBar
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: Colors.black54,
//     selectedItemColor: Colors.deepOrange[100],
//     showSelectedLabels: true,
//   ),
//   //! ElevatedButton
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       primary: Colors.deepOrange[100],
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//       onPrimary: Colors.black,
//       textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//     ),
//   ),
// );

// TextTheme _textLight(TextTheme base) {
//   return base.copyWith(
//     headline4: base.headline4!.copyWith(
//       color: Colors.black54,
//       fontSize: 20,
//     ),
//     headline6: base.headline6!.copyWith(
//       color: Colors.black,
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//     ),
//     button: base.button!.copyWith(
//       color: Colors.black,
//       fontSize: 18,
//     ),
//     bodyText1: base.bodyText1!.copyWith(
//       color: Colors.black,
//       fontSize: 18,
//     ),
//     bodyText2: base.bodyText2!.copyWith(
//       color: Colors.black,
//       fontSize: 16,
//     ),
//   );
// }
