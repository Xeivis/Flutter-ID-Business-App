import 'package:flutter/material.dart';
import 'package:id_card/model/contact.dart';

class Configuration {
  Color themeColor;
  int darkThemeOption;
  Contact currentContact;

  Configuration({
    required this.themeColor,
    required this.darkThemeOption,
    required this.currentContact,
  });
}
