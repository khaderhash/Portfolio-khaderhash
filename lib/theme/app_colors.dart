import 'package:flutter/material.dart';

/// The site palette: the ONE place colours are defined.
///
/// 60 / 30 / 10:
///   60%  sage    #DDE6DA  light page background
///   30%  forest  #1E3A2B  text, headings, navbar, footer, borders,
///                         and the dark theme's background
///   10%  yellow  #FFD60A  CTA fills, active states, small highlights
///
/// Contrast rules (WCAG, measured):
///   forest on sage   9.7    forest on white   12.4
///   forest on yellow 8.8    yellow on forest   8.8
///   yellow on sage   1.1 -> NEVER yellow text, icons or thin lines on a
///                            light background. In the light theme yellow
///                            is a fill only (with forest on top).
///
/// Every derived tone below is checked against the backgrounds it sits on;
/// the ratio is noted next to it (AA body text needs 4.5).
class AppColors {
  AppColors._();

  // ── Brand ──────────────────────────────────────────────────────
  static const sage = Color(0xFFDDE6DA);
  static const forest = Color(0xFF1E3A2B);
  static const yellow = Color(0xFFFFD60A);
  static const yellowHover = Color(0xFFFFE45C); // forest on it: 9.7
  static const white = Color(0xFFFFFFFF);

  // ── Light theme ───────────────────────────────────────────────
  static const lightBg = sage;
  static const lightSurface = white; // cards on the sage page
  static const lightSurfaceAlt = Color(0xFFEEF3EC); // chips inside cards
  static const lightBorder = Color(0xFFB5C4B1);
  static const lightText = forest; // 9.7 on sage, 12.4 on white
  static const lightMuted = Color(0xFF4A5E51); // 5.5 on sage, 7.0 on white

  // ── Dark theme ────────────────────────────────────────────────
  static const darkBg = forest;
  static const darkSurface = Color(0xFF264A37); // cards
  static const darkSurfaceAlt = Color(0xFF2C523E); // chips inside cards
  static const darkBorder = Color(0xFF3B6450);
  static const darkText = sage; // 9.7 on forest, 7.8 on surface
  static const darkMuted = Color(0xFFB4C5B8); // >= 4.8 on every dark tone

  // ── Overlays ──────────────────────────────────────────────────
  /// Modal barrier behind dialogs: forest-tinted black at ~55%.
  static const scrim = Color(0x8C0C1A12);

  /// Pills laid over project images (badges, close/play buttons).
  static const overlay = Color(0xE01E3A2B); // forest at 88%
}
