import 'package:flutter/material.dart';

Color kActivecolor = const Color(0xff5E35B1);
Color kInactivecolor = const Color(0xff9575CD);
Color kBgcolor = const Color(0xffEDE7F6);
Color kOverlayColor = Color(0x83B39DDB);

class BmiTheme {
  BmiTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      primaryColor: kActivecolor,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        color: Color(0xff7e57c2),
        centerTitle: true,
        elevation: 5.0,
        shadowColor: kActivecolor,
        titleTextStyle: TextStyle(
          color: kOverlayColor,
          fontWeight: FontWeight.w900,
          fontSize: 26.0,
        ),
      ),
      scaffoldBackgroundColor: Color(0xffd8c8ea));

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff421d79),
    appBarTheme: AppBarTheme(
      color: Color(0xff7e57c2),
      centerTitle: true,
      elevation: 5.0,
      shadowColor: kActivecolor,
      titleTextStyle: TextStyle(
        color: Color(0xff5E35B1),
        fontWeight: FontWeight.w900,
        fontSize: 26.0,
      ),
    ),
  );
}
