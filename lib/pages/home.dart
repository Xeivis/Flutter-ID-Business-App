import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_card/model/contact.dart';
import 'package:id_card/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/config_button.dart';
import '../widgets/contact_info.dart';
import '../widgets/main_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // MOCK DATA
  final Contact contact = Contact(
    "Your Name",
    "Title / Job position",
    "Phone number",
    "YourEmail@Your.Domain",
    "@YourSocialMediaTag",
  );

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

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
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(onPressed: _incrementCounter, child: const Text('+1')),
                FutureBuilder(
                    future: _counter,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        case ConnectionState.active:
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Text(
                              'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                              'This should persist across restarts.',
                            );
                          }
                      }
                    }),
                Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: MainInfo(
                    contact: contact,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ContactInfo(
                    contact: contact,
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
