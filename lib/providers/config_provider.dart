import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:id_card/models/contact.dart';
import 'package:id_card/models/theme_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigProvider with ChangeNotifier {
  Color themeColor = Colors.teal;
  ThemeOption darkThemeOption = ThemeOption.system;
  Contact currentContact = Contact(
    "Your Name",
    "Title / Job position",
    null,
    "Your phone number",
    "Your email",
    "@YourNametag",
  );

  void setContact(Contact contact) async {
    currentContact = contact;
    notifyListeners();
  }

  void setContactName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', value);
    currentContact.name = value;
    notifyListeners();
  }

  void setContactTitle(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title', value);
    currentContact.title = value;
    notifyListeners();
  }

  void setContactImage(dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      if (kIsWeb) {
      } else {
        prefs.setString('image', value);
      }
    }
    currentContact.image = value;
    notifyListeners();
  }

  void setContactPhone(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', value);
    currentContact.phone = value;
    notifyListeners();
  }

  void setContactEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', value);
    currentContact.email = value;
    notifyListeners();
  }

  void setContactNametag(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nametag', value);
    currentContact.nametag = value;
    notifyListeners();
  }

  void setColorTheme(Color color) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('themeColor', color.toString());
    themeColor = color;
    notifyListeners();
  }

  void setThemeOption(ThemeOption option) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeOption', option.toString());
    darkThemeOption = option;
    notifyListeners();
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setContactName(prefs.getString('name') ?? "Your Name");
    setContactTitle(prefs.getString('title') ?? "Title / Job position");
    setContactImage(prefs.getString('image'));
    setContactPhone(prefs.getString('phone') ?? 'Your phone number');
    setContactEmail(prefs.getString('email') ?? "Your email");
    setContactNametag(prefs.getString('nametag') ?? "@YourNametag");
    // setColorTheme(
    //   Color(
    //     int.parse(
    //         (prefs.getString('themeColor') ??
    //             Colors.teal.toString().split('(0x')[1].split(')')[0]),
    //         radix: 16),
    //   ),
    // );
    setThemeOption(
      ThemeOption.values.firstWhere(
        (t) =>
            t.toString() ==
            (prefs.getString('themeOption') ?? ThemeOption.system.toString()),
      ),
    );
  }

  void deleteData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    loadData();
    notifyListeners();
  }
}
