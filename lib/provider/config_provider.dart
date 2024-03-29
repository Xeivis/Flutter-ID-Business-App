import 'package:flutter/material.dart';
import 'package:id_card/model/contact.dart';
import 'package:id_card/model/theme_options.dart';

class ConfigProvider with ChangeNotifier {
  Color themeColor = Colors.teal;
  ThemeOption darkThemeOption = ThemeOption.system;
  Contact currentContact = Contact(
      "Your Name",
      "Title / Job position",
      "Your phone number",
      "Your email",
      "@Your nametag",
    );

  void setContact(Contact contact){
    currentContact = contact;
    notifyListeners();
  }

  void setColorTheme(Color color){
    themeColor = color;
    notifyListeners();
  }

  void setThemeOption(ThemeOption option){
    darkThemeOption = option;
    notifyListeners();
  }
}
