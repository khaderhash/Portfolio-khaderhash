import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_layot.dart';
import 'utils/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyPortfolioApp(),
    ),
  );
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final darkBg = const Color(0xFF021a12);
    final darkSurface = const Color(0xFF0b291f);
    final neonGreen = const Color(0xFF00ff94);

    final lightBg = const Color(0xFFF3F5F4);
    final lightSurface = Colors.white;
    final forestGreen = const Color(0xFF006d4e);

    return MaterialApp(
      title: 'Khader Hwaijeh | Software Engineer',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBg,
        primaryColor: neonGreen,
        cardColor: darkSurface,
        appBarTheme: AppBarTheme(backgroundColor: darkBg, elevation: 0),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        iconTheme: IconThemeData(color: neonGreen),
      ),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: lightBg,
        primaryColor: forestGreen,
        cardColor: lightSurface,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBg,
          elevation: 0,
          iconTheme: IconThemeData(color: forestGreen),
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
        iconTheme: IconThemeData(color: forestGreen),
      ),
      home: const MainLayout(),
    );
  }
}
