import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200,
    primary: Color.fromARGB(255, 179, 88, 72),
    secondary: Color.fromARGB(255, 218, 243, 74),
    tertiary: Color.fromARGB(255, 255, 0, 0),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Color.fromARGB(255, 83, 212, 163),
    secondary: Color.fromARGB(255, 212, 255, 71),
    tertiary: Color.fromARGB(255, 122, 0, 0),
  ),
);
