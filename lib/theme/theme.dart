import 'package:flutter/material.dart';

class BmiTheme {
  BmiTheme._();

  static ThemeData lightTheme =
      ThemeData(useMaterial3: true, brightness: Brightness.light);

  static ThemeData darkTheme =
      ThemeData(useMaterial3: true, brightness: Brightness.dark);
}
