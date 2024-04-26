import 'package:flutter/material.dart';

enum ThemeOption {
  light('Light', Icons.light_mode, ThemeMode.light),
  dark('Dark', Icons.dark_mode, ThemeMode.dark),
  system('System', Icons.display_settings, ThemeMode.system);

  const ThemeOption(this.label, this.icon, this.mode);
  final String label;
  final IconData icon;
  final ThemeMode mode;
}
