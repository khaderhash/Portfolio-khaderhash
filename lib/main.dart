import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khaderhash_portfolio/pages/ai_page.dart';
import 'package:khaderhash_portfolio/pages/cyber_page.dart';
import 'package:khaderhash_portfolio/pages/front_page.dart';
import 'package:khaderhash_portfolio/pages/mobile_app_page.dart';
import 'package:provider/provider.dart';
import 'main_layot.dart';
import 'utils/theme_provider.dart';
import 'pages/roadmap_page.dart';

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

    final darkBg = const Color(0xFF070A12);
    final darkSurface = const Color(0xFF101624);
    final neonGreen = const Color(0xFF34F5A6);
    final blueAccent = const Color(0xFF62D7FF);

    final lightBg = const Color(0xFFF6F8FB);
    final lightSurface = Colors.white;
    final forestGreen = const Color(0xFF087C61);

    return MaterialApp(
      title: 'Khader Hwaijeh | Software Engineer',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: neonGreen,
          brightness: Brightness.dark,
          primary: neonGreen,
          secondary: blueAccent,
          surface: darkSurface,
        ),
        scaffoldBackgroundColor: darkBg,
        primaryColor: neonGreen,
        cardColor: darkSurface,
        textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme),
        appBarTheme: AppBarTheme(
          backgroundColor: darkBg.withValues(alpha: 0.82),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        iconTheme: IconThemeData(color: neonGreen),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: forestGreen,
          brightness: Brightness.light,
          primary: forestGreen,
          secondary: const Color(0xFF2563EB),
          surface: lightSurface,
        ),
        scaffoldBackgroundColor: lightBg,
        primaryColor: forestGreen,
        cardColor: lightSurface,
        textTheme: GoogleFonts.cairoTextTheme(ThemeData.light().textTheme),
        appBarTheme: AppBarTheme(
          backgroundColor: lightBg.withValues(alpha: 0.86),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: forestGreen),
        ),
        iconTheme: IconThemeData(color: forestGreen),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      // Routing
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLayout(),
        '/roadmap': (context) => const RoadmapPage(),
        '/ai': (context) => const AiPage(),
        '/cyber': (context) => const CyberPage(),
        '/front': (context) => const FrontPage(),
        '/mobile': (context) => const MobileAppPage(),
      },
    );
  }
}
