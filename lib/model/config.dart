import 'package:flutter/material.dart';
import 'package:id_card/model/contact.dart';

class Configuration {
  Color themeColor;
  ThemeOption darkThemeOption;
  Contact currentContact;

  Configuration({
    required this.themeColor,
    required this.darkThemeOption,
    required this.currentContact,
  });
}

enum ThemeOption {light, dark, system}
