import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_card/theme/theme.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            child: const Text('Go back'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
