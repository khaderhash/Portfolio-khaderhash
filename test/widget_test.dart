import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khaderhash_portfolio/main.dart';
import 'package:khaderhash_portfolio/utils/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('portfolio landing page renders and toggles theme', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const MyPortfolioApp(),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    // Nav wordmark and the hero headline.
    expect(find.text('Khader Hwaijeh'), findsOneWidget);
    expect(find.text('Available for new projects'), findsOneWidget);

    // App starts in dark mode, so the toggle offers the light-mode icon.
    expect(find.byIcon(Icons.light_mode_outlined), findsOneWidget);

    await tester.tap(find.byIcon(Icons.light_mode_outlined));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byIcon(Icons.dark_mode_outlined), findsOneWidget);
  });
}
