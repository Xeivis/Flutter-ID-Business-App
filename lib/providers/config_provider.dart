import 'package:flutter/material.dart';
import 'package:id_card/models/contact.dart';
import 'package:id_card/models/theme_options.dart';

class ConfigProvider with ChangeNotifier {
  Color themeColor = Colors.teal;
  ThemeOption darkThemeOption = ThemeOption.system;
  Contact currentContact = Contact(
    "Your Name",
    "Title / Job position",
    null,
    "Your phone number",
    "Your email",
    "@Your nametag",
  );

  void setContact(Contact contact) {
    currentContact = contact;
    notifyListeners();
  }

  void setContactName(String value) {
    currentContact.name = value;
    notifyListeners();
  }

  void setContactTitle(String value) {
    currentContact.title = value;
    notifyListeners();
  }

  void setContactImage(dynamic value) {
    currentContact.image = value;
    notifyListeners();
  }

  void setContactPhone(String value) {
    currentContact.phone = value;
    notifyListeners();
  }

  void setContactEmail(String value) {
    currentContact.email = value;
    notifyListeners();
  }

  void setContactNametag(String value) {
    currentContact.nametag = value;
    notifyListeners();
  }

  void setColorTheme(Color color) {
    themeColor = color;
    notifyListeners();
  }

  void setThemeOption(ThemeOption option) {
    darkThemeOption = option;
    notifyListeners();
  }
}
