import 'package:flutter/material.dart';

Color seed = Colors.lightGreen; 

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorSchemeSeed: seed,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorSchemeSeed: seed,
);
