import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/shared_widgets.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final secondary = Theme.of(context).colorScheme.secondary;
    final textColor = premiumText(context);
    final mutedText = premiumMutedText(context);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 860;
    final minHeroHeight = isMobile ? 780.0 : 760.0;

    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.92 > minHeroHeight
            ? MediaQuery.of(context).size.height * 0.92
            : minHeroHeight,
      ),
      width: double.infinity,
      child: CustomPaint(
        painter: _HeroLinesPainter(
          accent: primaryColor,
          secondary: secondary,
          isDark: Theme.of(context).brightness == Brightness.dark,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 22 : 44),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1160),
              child: isMobile
                  ? _HeroContent(
                      primaryColor: primaryColor,
                      textColor: textColor,
                      mutedText: mutedText,
                      compact: true,
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: _HeroContent(
                            primaryColor: primaryColor,
                            textColor: textColor,
                            mutedText: mutedText,
                          ),
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          flex: 4,
                          child: _HeroPortrait(primaryColor: primaryColor),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  final Color primaryColor;
  final Color textColor;
  final Color mutedText;
  final bool compact;

  const _HeroContent({
    required this.primaryColor,
    required this.textColor,
    required this.mutedText,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollReveal(
      duration: premiumMedium,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: compact
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          if (compact) _HeroPortrait(primaryColor: primaryColor, compact: true),
          if (compact) const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: primaryColor.withValues(alpha: 0.24)),
            ),
            child: Text(
              "Flutter Developer / Automation Builder / Product Contributor",
              textAlign: compact ? TextAlign.center : TextAlign.start,
              style: TextStyle(
                color: primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w800,
                letterSpacing: 0,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            "KHADER HWAIJEH",
            textAlign: compact ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.bebasNeue(
              fontSize: compact ? 62 : 92,
              height: 0.92,
              letterSpacing: 0,
              color: textColor,
            ),
          ),
          const SizedBox(height: 18),
          DefaultTextStyle(
            style: GoogleFonts.firaCode(
              fontSize: compact ? 18 : 24,
              color: mutedText,
              fontWeight: FontWeight.w600,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(milliseconds: 1200),
              animatedTexts: [
                TypewriterAnimatedText(
                  'Flutter Developer & Product Contributor',
                ),
                TypewriterAnimatedText('Software Engineer'),
                TypewriterAnimatedText('Flutter Developer'),
                TypewriterAnimatedText('n8n Automation Expert'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 660),
            child: Text(
              "I design and ship scalable mobile products, AI-assisted workflows, and clean digital experiences with Flutter, automation, and pragmatic engineering.",
              textAlign: compact ? TextAlign.center : TextAlign.start,
              style: TextStyle(
                color: mutedText,
                fontSize: compact ? 16 : 18,
                height: 1.7,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 34),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            alignment: compact ? WrapAlignment.center : WrapAlignment.start,
            children: [
              PremiumButton(
                onPressed: () {
                  launchUrl(Uri.parse('cv.pdf'));
                },
                icon: Icons.visibility,
                label: "View CV",
              ),
              PremiumButton(
                onPressed: () {
                  launchUrl(Uri.parse('cv.pdf'));
                },
                icon: Icons.download,
                label: "Download CV",
                filled: false,
              ),
            ],
          ),
          const SizedBox(height: 32),
          const SocialIconsRow(),
        ],
      ),
    );
  }
}

class _HeroPortrait extends StatelessWidget {
  final Color primaryColor;
  final bool compact;
  const _HeroPortrait({required this.primaryColor, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final size = compact ? 154.0 : 310.0;
    return HoverLift(
      y: -8,
      scale: 1.02,
      child: NeonContainer(
        borderRadius: compact ? 999 : 34,
        child: Container(
          width: size,
          height: size,
          padding: EdgeInsets.all(compact ? 6 : 10),
          decoration: BoxDecoration(
            color: premiumSurface(context),
            borderRadius: BorderRadius.circular(compact ? 999 : 34),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(compact ? 999 : 26),
            child: Image.asset(
              'assets/me.png',
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: premiumMedium,
                  curve: premiumMotion,
                  child: child,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroLinesPainter extends CustomPainter {
  final Color accent;
  final Color secondary;
  final bool isDark;

  const _HeroLinesPainter({
    required this.accent,
    required this.secondary,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..color = accent.withValues(alpha: isDark ? 0.07 : 0.045);

    final path = Path()
      ..moveTo(size.width * 0.08, size.height * 0.295)
      ..cubicTo(
        size.width * 0.28,
        size.height * 0.10,
        size.width * 0.58,
        size.height * 0.55,
        size.width * 0.92,
        size.height * 0.24,
      );
    canvas.drawPath(path, linePaint);

    final secondPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = secondary.withValues(alpha: isDark ? 0.06 : 0.035);
    canvas.drawLine(
      Offset(size.width * 0.68, size.height * 0.2),
      Offset(size.width * 0.94, size.height * 0.74),
      secondPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _HeroLinesPainter oldDelegate) {
    return oldDelegate.accent != accent || oldDelegate.isDark != isDark;
  }
}

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white70 : Colors.black54;

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        SocialBtn(
          icon: FontAwesomeIcons.whatsapp,
          url: "https://wa.me/963981949180",
          baseColor: iconColor,
          hoverColor: Colors.green,
        ),
        SocialBtn(
          icon: FontAwesomeIcons.linkedin,
          url: "https://linkedin.com/in/khaderhash",
          baseColor: iconColor,
          hoverColor: Colors.blue,
        ),
        SocialBtn(
          icon: FontAwesomeIcons.telegram,
          url: "https://t.me/khaderhash",
          baseColor: iconColor,
          hoverColor: Colors.blue,
        ),
        SocialBtn(
          icon: FontAwesomeIcons.behance,
          url: "https://behance.net/khaderhash",
          baseColor: iconColor,
          hoverColor: isDark ? Colors.white : Colors.black,
        ),
        SocialBtn(
          icon: FontAwesomeIcons.github,
          url: "https://github.com/khaderhash",
          baseColor: iconColor,
          hoverColor: isDark ? Colors.white : Colors.black,
        ),
        SocialBtn(
          icon: FontAwesomeIcons.instagram,
          url: "https://www.instagram.com/khader._.tech/",
          baseColor: iconColor,
          hoverColor: Colors.purpleAccent,
        ),
        SocialBtn(
          icon: Icons.email,
          url: "mailto:khaderhuijih@gmail.com",
          baseColor: iconColor,
          hoverColor: isDark ? Colors.white : Colors.black,
        ),
      ],
    );
  }
}
