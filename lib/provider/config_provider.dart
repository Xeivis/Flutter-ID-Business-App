import 'package:flutter/material.dart';
import 'package:id_card/model/config.dart';
import 'package:id_card/model/contact.dart';

class ConfigProvider with ChangeNotifier {
  Configuration config = Configuration(
    themeColor: Colors.deepOrange,
    darkThemeOption: 0,
    currentContact: Contact(
      "Your Name",
      "Title / Job position",
      "Your phone number",
      "Your email",
      "@Your nametag",
    ),
  );

  void setColorTheme(Color color){
    config.themeColor = color;
    notifyListeners();
  }
}
