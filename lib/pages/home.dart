import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_card/classes/contact.dart';
import 'package:id_card/theme/theme.dart';
import '../widgets/contact_info.dart';
import '../widgets/main_info.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // MOCK DATA
  final Contact contact = Contact(
    "Xeivis",
    "Software Developer",
    "666666666",
    "Some@Random.mail",
    // "supermegalognemail@thatnohumanbeingwoulduse.internet",
    "@xeivis",
  );

  _HomeState();
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
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 5,
                child: MainInfo(
                  contact: contact,
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ContactInfo(
                    contact: contact,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
          child: const Icon(
            Icons.settings,
          ),
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          elevation: 0,
          onPressed: () {},
        ),
      ),
    );
  }
}
