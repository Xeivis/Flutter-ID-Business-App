import 'package:flutter/material.dart';
import 'package:id_card/theme/theme.dart';
import 'package:id_card/pages/home.dart';
import 'package:id_card/pages/settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void handleColorChange(Color color) {
    setState(() {
      lightTheme = ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: color,
      );
      darkTheme = ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: color,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ID Card",
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(
              handleColorChange: handleColorChange,
            ),
        '/settings': (context) => Settings(
              handleColorChange: handleColorChange,
            ),
      },
    );
  }
}
