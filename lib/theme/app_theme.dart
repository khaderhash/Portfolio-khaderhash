import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Both themes are built from [AppColors] by one function, so light and dark
/// can only differ where the palette says they do.
///
/// Accent roles:
///   colorScheme.primary   the TEXT-SAFE accent: forest on light, yellow on
///                         dark. Use it for accent text, icons and thin lines.
///   colorScheme.secondary always yellow: a FILL (buttons, active states)
///                         with onSecondary (forest) on top.
ThemeData buildLightTheme() => _buildTheme(dark: false);
ThemeData buildDarkTheme() => _buildTheme(dark: true);

/// The forest "secondary" theme for the navbar and footer in BOTH modes.
/// It is the dark theme, so everything inside picks up sage text and the
/// yellow text-safe accent without per-widget colour code.
ThemeData get forestTheme => _forestTheme ??= buildDarkTheme();
ThemeData? _forestTheme;

ThemeData _buildTheme({required bool dark}) {
  final bg = dark ? AppColors.darkBg : AppColors.lightBg;
  final surface = dark ? AppColors.darkSurface : AppColors.lightSurface;
  final surfaceAlt = dark ? AppColors.darkSurfaceAlt : AppColors.lightSurfaceAlt;
  final border = dark ? AppColors.darkBorder : AppColors.lightBorder;
  final text = dark ? AppColors.darkText : AppColors.lightText;
  final muted = dark ? AppColors.darkMuted : AppColors.lightMuted;
  final accent = dark ? AppColors.yellow : AppColors.forest;

  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.forest,
    brightness: dark ? Brightness.dark : Brightness.light,
  ).copyWith(
    primary: accent,
    onPrimary: dark ? AppColors.forest : AppColors.sage,
    secondary: AppColors.yellow,
    onSecondary: AppColors.forest,
    surface: surface,
    onSurface: text,
    onSurfaceVariant: muted,
    surfaceContainerLowest: bg,
    surfaceContainerHighest: surfaceAlt,
    outline: border,
    outlineVariant: border,
    scrim: AppColors.scrim,
  );

  // Yellow-filled CTA: forest label, lighter yellow on hover/focus, and a
  // forest ring when focused so it stays visible on the yellow fill.
  final ctaStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith(
      (s) => s.contains(WidgetState.hovered) || s.contains(WidgetState.focused)
          ? AppColors.yellowHover
          : AppColors.yellow,
    ),
    foregroundColor: const WidgetStatePropertyAll(AppColors.forest),
    overlayColor: WidgetStatePropertyAll(
        AppColors.forest.withValues(alpha: 0.08)),
    side: WidgetStateProperty.resolveWith(
      (s) => s.contains(WidgetState.focused)
          ? BorderSide(color: dark ? AppColors.sage : AppColors.forest, width: 2)
          : BorderSide.none,
    ),
  );

  final base = dark
      ? ThemeData.dark(useMaterial3: true)
      : ThemeData.light(useMaterial3: true);

  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: bg,
    canvasColor: bg,
    primaryColor: accent,
    cardColor: surface,
    dividerColor: border,
    focusColor: accent.withValues(alpha: 0.14),
    hoverColor: accent.withValues(alpha: 0.06),
    highlightColor: accent.withValues(alpha: 0.10),
    splashColor: accent.withValues(alpha: 0.10),
    textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: text,
      displayColor: text,
    ),
    iconTheme: IconThemeData(color: text),
    // Navbar colour (also the legacy guide pages' AppBar).
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.forest,
      foregroundColor: AppColors.sage,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: AppColors.sage),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: accent,
      selectionColor: AppColors.yellow.withValues(alpha: dark ? 0.35 : 0.6),
      selectionHandleColor: accent,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (s) => (dark ? AppColors.sage : AppColors.forest).withValues(
          alpha: s.contains(WidgetState.hovered) ||
                  s.contains(WidgetState.dragged)
              ? 0.6
              : 0.35,
        ),
      ),
      radius: const Radius.circular(8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ctaStyle),
    filledButtonTheme: FilledButtonThemeData(style: ctaStyle),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: accent,
        side: BorderSide(color: accent),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: accent),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      labelStyle: TextStyle(color: muted),
      hintStyle: TextStyle(color: muted),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: accent, width: 2),
      ),
    ),
    cardTheme: CardThemeData(
      color: surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: border),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: surfaceAlt,
      side: BorderSide(color: border),
      labelStyle: TextStyle(color: text),
    ),
    dividerTheme: DividerThemeData(color: border, thickness: 1),
    popupMenuTheme: PopupMenuThemeData(
      color: surface,
      surfaceTintColor: Colors.transparent,
      textStyle: TextStyle(color: text),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: surface,
      barrierColor: AppColors.scrim,
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: dark ? AppColors.sage : AppColors.forest,
        borderRadius: BorderRadius.circular(6),
      ),
      textStyle: TextStyle(
        color: dark ? AppColors.forest : AppColors.sage,
        fontSize: 12,
      ),
    ),
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
