import 'package:flutter/material.dart';

class MyTheme{
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(primary: Colors.white),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
  );
}

class ScheduleThemeService{

}
