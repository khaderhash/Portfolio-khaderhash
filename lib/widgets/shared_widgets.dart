import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';

// Motion tokens
const premiumMotion = Cubic(0.22, 1, 0.36, 1);
const premiumFast = Duration(milliseconds: 180);
const premiumMedium = Duration(milliseconds: 420);

// Color helpers. All resolve to lib/theme/app_colors.dart via the theme.

/// Text-safe accent for text, icons and thin lines: forest on the light
/// theme, yellow on the dark theme. Never yellow on a light background.
Color premiumAccent(BuildContext context) =>
    Theme.of(context).colorScheme.primary;

/// Accent FILL (always yellow) for CTAs, active states and small highlights.
/// Put [premiumOnAccentFill] on top of it, never other text colours.
Color premiumAccentFill(BuildContext context) =>
    Theme.of(context).colorScheme.secondary;
Color premiumAccentFillHover(BuildContext context) => AppColors.yellowHover;
Color premiumOnAccentFill(BuildContext context) =>
    Theme.of(context).colorScheme.onSecondary;

bool _isDark(BuildContext c) => Theme.of(c).brightness == Brightness.dark;

Color premiumBg(BuildContext c) =>
    _isDark(c) ? AppColors.darkBg : AppColors.lightBg;

Color premiumText(BuildContext c) =>
    _isDark(c) ? AppColors.darkText : AppColors.lightText;

Color premiumMutedText(BuildContext c) =>
    _isDark(c) ? AppColors.darkMuted : AppColors.lightMuted;

Color premiumSurface(BuildContext c) =>
    _isDark(c) ? AppColors.darkSurface : AppColors.lightSurface;

Color premiumSurfaceAlt(BuildContext c) =>
    _isDark(c) ? AppColors.darkSurfaceAlt : AppColors.lightSurfaceAlt;

Color premiumBorder(BuildContext c) =>
    _isDark(c) ? AppColors.darkBorder : AppColors.lightBorder;

TextStyle monoStyle(BuildContext c, {double size = 12, FontWeight? weight, Color? color}) =>
    GoogleFonts.jetBrainsMono(
      fontSize: size,
      fontWeight: weight ?? FontWeight.w500,
      color: color ?? premiumMutedText(c),
      letterSpacing: 0,
    );

// ────────────── Focus ring ──────────────

/// Makes a custom tappable reachable by keyboard (Tab, then Enter/Space)
/// and draws a 2px ring outside it while it has keyboard focus. The ring is
/// the text-safe accent, so it is forest on light backgrounds and yellow on
/// dark ones (the navbar and footer included): visible on both.
class FocusRing extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double radius;
  final ValueChanged<bool>? onHighlight;

  const FocusRing({
    super.key,
    required this.child,
    required this.onTap,
    this.radius = 10,
    this.onHighlight,
  });

  @override
  State<FocusRing> createState() => _FocusRingState();
}

class _FocusRingState extends State<FocusRing> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      enabled: widget.onTap != null,
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onTap?.call();
            return null;
          },
        ),
      },
      onShowFocusHighlight: (v) {
        setState(() => _focused = v);
        widget.onHighlight?.call(v);
      },
      child: Container(
        foregroundDecoration: _focused
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius),
                border: Border.all(
                  color: premiumAccent(context),
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              )
            : null,
        child: widget.child,
      ),
    );
  }
}

// ────────────── Section scaffolding ──────────────

/// Space above and below each section's content. Nav scrolling uses it to
/// land a section's heading just below the top bar.
const double sectionVerticalPadding = 48;

class SectionContainer extends StatelessWidget {
  final Widget child;
  final bool wide;
  const SectionContainer({super.key, required this.child, this.wide = false});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hPad = width < 600 ? 20.0 : (width < 1000 ? 32.0 : 44.0);
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: wide ? 1200 : 1060),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: sectionVerticalPadding,
            horizontal: hPad,
          ),
          child: ScrollReveal(child: child),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String kicker;
  final String title;
  final String? subtitle;
  final CrossAxisAlignment align;

  const SectionTitle({
    super.key,
    required this.kicker,
    required this.title,
    this.subtitle,
    this.align = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final accent = premiumAccent(context);
    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          kicker.toUpperCase(),
          style: monoStyle(
            context,
            size: 11.5,
            weight: FontWeight.w600,
            color: accent,
          ).copyWith(letterSpacing: 1.4),
        ),
        const SizedBox(height: 14),
        Text(
          title,
          textAlign: align == CrossAxisAlignment.center
              ? TextAlign.center
              : TextAlign.start,
          style: TextStyle(
            fontSize: 32,
            height: 1.15,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w700,
            color: premiumText(context),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              subtitle!,
              textAlign: align == CrossAxisAlignment.center
                  ? TextAlign.center
                  : TextAlign.start,
              style: TextStyle(
                fontSize: 15.5,
                height: 1.6,
                color: premiumMutedText(context),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// ────────────── Nav button ──────────────

class NavButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  const NavButton({super.key, required this.title, required this.onPressed});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    final color = _hovered ? premiumAccent(context) : premiumText(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: FocusRing(
        onTap: widget.onPressed,
        radius: 8,
        onHighlight: (v) => setState(() => _hovered = v),
        child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: premiumFast,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color,
              letterSpacing: -0.1,
            ),
          ),
        ),
        ),
      ),
    );
  }
}

// ────────────── Social icon button ──────────────

class SocialBtn extends StatefulWidget {
  final IconData icon;
  final String url;
  final String tooltip;
  const SocialBtn({
    super.key,
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  @override
  State<SocialBtn> createState() => _SocialBtnState();
}

class _SocialBtnState extends State<SocialBtn> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    final fill = premiumAccentFill(context);
    final onFill = premiumOnAccentFill(context);
    final base = premiumMutedText(context);
    Future<void> open() async {
      final uri = Uri.parse(widget.url);
      if (await canLaunchUrl(uri)) await launchUrl(uri);
    }

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: FocusRing(
          onTap: open,
          onHighlight: (v) => setState(() => _hovered = v),
          child: GestureDetector(
          onTap: open,
          child: AnimatedContainer(
            duration: premiumFast,
            curve: premiumMotion,
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _hovered ? fill : premiumSurfaceAlt(context),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _hovered ? fill : premiumBorder(context),
              ),
            ),
            child: Center(
              child: FaIcon(
                widget.icon,
                size: 16,
                color: _hovered ? onFill : base,
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }
}

// ────────────── Skill chip ──────────────

class SkillChip extends StatelessWidget {
  final String label;
  const SkillChip({super.key, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: premiumSurfaceAlt(context),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: premiumBorder(context)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: premiumText(context),
        ),
      ),
    );
  }
}

// ────────────── Surface panel (replaces GlassPanel) ──────────────

class GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  const GlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: premiumSurface(context),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: premiumBorder(context)),
      ),
      child: child,
    );
  }
}

// ────────────── Hover lift (cheaper, single AnimatedContainer) ──────────────

class HoverLift extends StatefulWidget {
  final Widget child;
  final double y;
  final double scale;
  const HoverLift({
    super.key,
    required this.child,
    this.y = -3,
    this.scale = 1.0,
  });

  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedSlide(
        offset: _hovered ? Offset(0, widget.y / 100) : Offset.zero,
        duration: premiumFast,
        curve: premiumMotion,
        child: widget.child,
      ),
    );
  }
}

// ────────────── Scroll reveal (one-shot, no listener churn) ──────────────

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  const ScrollReveal({super.key, required this.child, this.delay = Duration.zero});

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Future.delayed(widget.delay, () {
        if (mounted) setState(() => _visible = true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: premiumMedium,
      curve: premiumMotion,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : const Offset(0, 0.03),
        duration: premiumMedium,
        curve: premiumMotion,
        child: widget.child,
      ),
    );
  }
}

// ────────────── Premium button ──────────────

class PremiumButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final String label;
  final bool filled;

  const PremiumButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.filled = true,
  });

  @override
  State<PremiumButton> createState() => _PremiumButtonState();
}

class _PremiumButtonState extends State<PremiumButton> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    // Filled = the yellow CTA with forest text. Outline = text-safe accent
    // (forest on light, yellow on dark) with a faint tint on hover.
    final accent = premiumAccent(context);
    final fillBg = _hovered
        ? premiumAccentFillHover(context)
        : premiumAccentFill(context);
    final onFill = premiumOnAccentFill(context);
    final outlineBg = _hovered
        ? accent.withValues(alpha: 0.08)
        : Colors.transparent;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: FocusRing(
        onTap: widget.onPressed,
        onHighlight: (v) => setState(() => _hovered = v),
        child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: premiumFast,
          curve: premiumMotion,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            color: widget.filled ? fillBg : outlineBg,
            borderRadius: BorderRadius.circular(10),
            border: widget.filled
                ? null
                : Border.all(color: accent.withValues(alpha: 0.5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: 16,
                  color: widget.filled ? onFill : accent,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.1,
                  color: widget.filled ? onFill : accent,
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
