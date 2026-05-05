import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

const premiumMotion = Cubic(0.22, 1, 0.36, 1);
const premiumFast = Duration(milliseconds: 220);
const premiumMedium = Duration(milliseconds: 520);

Color premiumAccent(BuildContext context) => Theme.of(context).primaryColor;

Color premiumText(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
    ? Colors.white
    : const Color(0xFF111827);

Color premiumMutedText(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
    ? Colors.white70
    : const Color(0xFF4B5563);

Color premiumSurface(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
    ? const Color(0xCC0B1220)
    : Colors.white.withValues(alpha: 0.78);

class SectionContainer extends StatelessWidget {
  final Widget child;
  final bool wide;
  const SectionContainer({super.key, required this.child, this.wide = false});
  @override
  Widget build(BuildContext context) {
    return ScrollReveal(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: wide ? 1180 : 1040),
        padding: const EdgeInsets.symmetric(vertical: 76, horizontal: 22),
        child: child,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = premiumText(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: primaryColor.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: primaryColor.withValues(alpha: 0.22)),
          ),
          child: Text(
            "Portfolio / $title",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 12,
              letterSpacing: 0,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w900,
            color: textColor,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 74,
          height: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [primaryColor.withValues(alpha: 0.1), primaryColor],
            ),
          ),
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const NavButton({super.key, required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return HoverLift(
      y: -1,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: premiumMutedText(context),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class SocialBtn extends StatelessWidget {
  final IconData icon;
  final String url;
  final Color baseColor, hoverColor;
  const SocialBtn({
    super.key,
    required this.icon,
    required this.url,
    required this.baseColor,
    required this.hoverColor,
  });
  @override
  Widget build(BuildContext context) {
    return HoverLift(
      y: -4,
      child: IconButton(
        onPressed: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) await launchUrl(uri);
        },
        style: IconButton.styleFrom(
          fixedSize: const Size(48, 48),
          backgroundColor: premiumSurface(context),
          hoverColor: hoverColor.withValues(alpha: 0.12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: baseColor.withValues(alpha: 0.12)),
          ),
        ),
        icon: FaIcon(icon, size: 22),
        color: baseColor,
        hoverColor: hoverColor,
        tooltip: url,
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;
  const SkillChip({super.key, required this.label});
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return HoverLift(
      y: -2,
      child: Chip(
        label: Text(label),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        backgroundColor: premiumSurface(context),
        labelStyle: TextStyle(
          color: premiumText(context),
          fontWeight: FontWeight.w700,
        ),
        side: BorderSide(color: primaryColor.withValues(alpha: 0.18)),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    );
  }
}

class NeonContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const NeonContainer({super.key, required this.child, this.borderRadius = 15});

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).primaryColor;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: [
            accent.withValues(alpha: 0.55),
            Colors.white.withValues(alpha: 0.06),
            accent.withValues(alpha: 0.18),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.18),
            blurRadius: 26,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: child,
        ),
      ),
    );
  }
}

class GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  const GlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.radius = 22,
  });

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).primaryColor;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: premiumSurface(context),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: accent.withValues(alpha: 0.16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: Theme.of(context).brightness == Brightness.dark
                  ? 0.28
                  : 0.08,
            ),
            blurRadius: 36,
            offset: const Offset(0, 22),
          ),
        ],
      ),
      child: child,
    );
  }
}

class HoverLift extends StatefulWidget {
  final Widget child;
  final double y;
  final double scale;
  const HoverLift({
    super.key,
    required this.child,
    this.y = -6,
    this.scale = 1.015,
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
      child: AnimatedScale(
        scale: _hovered ? widget.scale : 1,
        duration: premiumFast,
        curve: premiumMotion,
        child: AnimatedSlide(
          offset: _hovered ? Offset(0, widget.y / 100) : Offset.zero,
          duration: premiumFast,
          curve: premiumMotion,
          child: widget.child,
        ),
      ),
    );
  }
}

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Offset beginOffset;
  const ScrollReveal({
    super.key,
    required this.child,
    this.duration = premiumMedium,
    this.beginOffset = const Offset(0, 0.055),
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal> {
  bool _visible = false;
  ScrollPosition? _position;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _position?.removeListener(_checkVisibility);
    _position = Scrollable.maybeOf(context)?.position;
    _position?.addListener(_checkVisibility);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  @override
  void dispose() {
    _position?.removeListener(_checkVisibility);
    super.dispose();
  }

  void _checkVisibility() {
    if (!mounted || _visible) return;
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return;
    final viewportHeight = MediaQuery.of(context).size.height;
    final top = renderObject.localToGlobal(Offset.zero).dy;
    if (top < viewportHeight * 0.86) {
      setState(() => _visible = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: widget.duration,
      curve: premiumMotion,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : widget.beginOffset,
        duration: widget.duration,
        curve: premiumMotion,
        child: AnimatedScale(
          scale: _visible ? 1 : 0.98,
          duration: widget.duration,
          curve: premiumMotion,
          child: widget.child,
        ),
      ),
    );
  }
}

class PremiumButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final bool filled;

  const PremiumButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).primaryColor;
    return HoverLift(
      child: filled
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(label),
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.w900),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            )
          : OutlinedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(label),
              style: OutlinedButton.styleFrom(
                foregroundColor: accent,
                side: BorderSide(
                  color: accent.withValues(alpha: 0.7),
                  width: 1.4,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.w900),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
    );
  }
}
