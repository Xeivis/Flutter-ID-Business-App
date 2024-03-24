import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_card/theme/theme.dart';
import 'package:id_card/pages/home.dart';
import 'package:id_card/pages/settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme;
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      currentTheme = darkTheme;
    } else {
      currentTheme = lightTheme;
    }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: currentTheme.colorScheme.primary,
      ),
    );
    return MaterialApp(
      title: "ID Card",
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/settings': (context) => const Settings(),
      },
    );
  }
}
