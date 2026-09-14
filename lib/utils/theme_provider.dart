import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme() {
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class AppPalette {
  // Dark
  static const darkBg = Color(0xFF0B0D10);
  static const darkSurface = Color(0xFF14171C);
  static const darkSurfaceAlt = Color(0xFF1B1F26);
  static const darkBorder = Color(0xFF262B33);
  static const darkText = Color(0xFFE8EAED);
  static const darkMuted = Color(0xFF9AA3AE);

  // Light
  static const lightBg = Color(0xFFFBFBFC);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightSurfaceAlt = Color(0xFFF3F4F6);
  static const lightBorder = Color(0xFFE5E7EB);
  static const lightText = Color(0xFF0F172A);
  static const lightMuted = Color(0xFF52606D);

  // Accent — refined emerald (engineering vibe, not neon)
  static const accentDark = Color(0xFF4ADE80); // emerald 400
  static const accentLight = Color(0xFF059669); // emerald 600
  static const secondary = Color(0xFF3B82F6); // blue 500
}

ThemeData buildDarkTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppPalette.darkBg,
    primaryColor: AppPalette.accentDark,
    cardColor: AppPalette.darkSurface,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPalette.accentDark,
      brightness: Brightness.dark,
      primary: AppPalette.accentDark,
      secondary: AppPalette.secondary,
      surface: AppPalette.darkSurface,
    ),
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: AppPalette.darkText,
      displayColor: AppPalette.darkText,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xCC0B0D10),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    iconTheme: const IconThemeData(color: AppPalette.darkText),
    dividerColor: AppPalette.darkBorder,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}

ThemeData buildLightTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppPalette.lightBg,
    primaryColor: AppPalette.accentLight,
    cardColor: AppPalette.lightSurface,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPalette.accentLight,
      brightness: Brightness.light,
      primary: AppPalette.accentLight,
      secondary: AppPalette.secondary,
      surface: AppPalette.lightSurface,
    ),
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: AppPalette.lightText,
      displayColor: AppPalette.lightText,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xEFFBFBFC),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: AppPalette.lightText),
    ),
    iconTheme: const IconThemeData(color: AppPalette.lightText),
    dividerColor: AppPalette.lightBorder,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
