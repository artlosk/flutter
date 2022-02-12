import 'package:flutter/material.dart';

enum MyThemeKeys { Day, Night }

class MyThemes {
  static final ThemeData dayTheme = ThemeData(
    primaryColor: Colors.blue,
    canvasColor: Colors.black,
    shadowColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final ThemeData nightTheme = ThemeData(
    primaryColor: Colors.black,
    canvasColor: Colors.white,
    shadowColor: Colors.yellow,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.Day:
        return dayTheme;
      case MyThemeKeys.Night:
        return nightTheme;
      default:
        return dayTheme;
    }
  }
}
