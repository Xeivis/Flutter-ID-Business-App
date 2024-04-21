import 'package:flutter/material.dart';
import 'package:id_card/provider/config_provider.dart';
import 'package:id_card/theme/theme.dart';
import 'package:id_card/pages/home.dart';
import 'package:id_card/pages/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConfigProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigProvider>(
      builder: (context, configProvider, child) {
        lightTheme = ThemeData(
          brightness: Brightness.light,
          colorSchemeSeed: configProvider.themeColor,
        );
        darkTheme = ThemeData(
          brightness: Brightness.dark,
          colorSchemeSeed: configProvider.themeColor,
        );
        return MaterialApp(
          title: "ID Card",
          themeMode: context.watch<ConfigProvider>().darkThemeOption.mode,
          theme: lightTheme,
          darkTheme: darkTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => const Home(),
            '/settings': (context) => const Settings(),
          },
        );
      },
    );
  }
}
