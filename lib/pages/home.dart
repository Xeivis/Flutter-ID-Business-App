import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_card/model/theme_options.dart';
import 'package:id_card/provider/config_provider.dart';
import 'package:id_card/theme/theme.dart';
import 'package:provider/provider.dart';
import '../widgets/config_button.dart';
import '../widgets/contact_info.dart';
import '../widgets/main_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme;
    switch (context.read<ConfigProvider>().darkThemeOption) {
      case ThemeOption.dark:
        currentTheme = darkTheme;
        break;
      case ThemeOption.light:
        currentTheme = lightTheme;
        break;
      default:
        if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
          currentTheme = darkTheme;
        } else {
          currentTheme = lightTheme;
        }
    }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: currentTheme.colorScheme.primary,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: Column(
              children: [
                Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: MainInfo(
                    contact: context.watch<ConfigProvider>().currentContact,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ContactInfo(
                    contact: context.watch<ConfigProvider>().currentContact,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const ConfigButton(),
    );
  }
}
