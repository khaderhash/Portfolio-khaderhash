import 'package:flutter/material.dart';

// Colours live in lib/theme/app_colors.dart; the ThemeData builders in
// lib/theme/app_theme.dart.
export '../theme/app_theme.dart' show buildLightTheme, buildDarkTheme;

class ThemeProvider extends ChangeNotifier {
  // Light (sage) first: it is the palette's 60% and the first impression.
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme() {
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
