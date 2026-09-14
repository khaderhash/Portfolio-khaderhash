import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_layot.dart';
import 'utils/theme_provider.dart';
import 'pages/ai_page.dart';
import 'pages/cyber_page.dart';
import 'pages/front_page.dart';
import 'pages/mobile_app_page.dart';
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
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Khader Hwaijeh — Software Engineer',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
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
