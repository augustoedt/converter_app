import 'package:flutter/material.dart';

class ThemeService{
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff23252D),
    appBarTheme: AppBarTheme(
      color: const Color(0xff23252D),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
    )

  );
}
