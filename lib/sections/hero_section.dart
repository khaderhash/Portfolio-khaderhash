import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/data.dart';
import '../widgets/shared_widgets.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onEmailBrief;

  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onEmailBrief,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 880;
    final hPad = width < 600 ? 22.0 : (width < 1000 ? 32.0 : 44.0);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: isMobile ? 660 : 740,
      ),
      padding: EdgeInsets.fromLTRB(hPad, isMobile ? 110 : 130, hPad, 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1160),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _HeroPortrait(compact: true),
                    const SizedBox(height: 32),
                    _HeroContent(
                      onViewWork: onViewWork,
                      onEmailBrief: onEmailBrief,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _HeroContent(
                        onViewWork: onViewWork,
                        onEmailBrief: onEmailBrief,
                      ),
                    ),
                    const SizedBox(width: 56),
                    const Expanded(flex: 4, child: _HeroPortrait()),
                  ],
                ),
        ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onEmailBrief;
  const _HeroContent({required this.onViewWork, required this.onEmailBrief});

  @override
  Widget build(BuildContext context) {
    final accent = premiumAccent(context);
    final text = premiumText(context);
    final muted = premiumMutedText(context);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 880;
    final headingSize = isMobile ? 34.0 : (width < 1100 ? 44.0 : 52.0);

    return ScrollReveal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Availability badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: premiumSurfaceAlt(context),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: premiumBorder(context)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: accent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: accent.withValues(alpha: 0.55),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "Available for new projects",
                  style: TextStyle(
                    color: muted,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          // Headline
          Text(
            "I build production-grade web and mobile platforms for teams that need to ship right.",
            style: TextStyle(
              fontSize: headingSize,
              height: 1.1,
              fontWeight: FontWeight.w700,
              letterSpacing: -1.2,
              color: text,
            ),
          ),
          const SizedBox(height: 18),
          // Subtitle
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: isMobile ? 15.5 : 17,
                  height: 1.6,
                  color: muted,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: "Full Stack Engineer ",
                    style: TextStyle(
                      color: text,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(text: "and "),
                  TextSpan(
                    text: "Founder",
                    style: TextStyle(
                      color: text,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text:
                        " specializing in Laravel, React, Flutter, AI automation, and scalable marketplace systems.",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          // CTAs
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              PremiumButton(
                onPressed: onViewWork,
                icon: Icons.arrow_downward_rounded,
                label: "View Selected Work",
              ),
              PremiumButton(
                onPressed: onEmailBrief,
                icon: Icons.alternate_email_rounded,
                label: "Email a Project Brief",
                filled: false,
              ),
            ],
          ),
          const SizedBox(height: 14),
          _ResumeLink(onTap: () => launchUrl(Uri.parse('cv.pdf'))),
          const SizedBox(height: 28),
          const SocialIconsRow(),
        ],
      ),
    );
  }
}

class _ResumeLink extends StatefulWidget {
  final VoidCallback onTap;
  const _ResumeLink({required this.onTap});
  @override
  State<_ResumeLink> createState() => _ResumeLinkState();
}

class _ResumeLinkState extends State<_ResumeLink> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final muted = premiumMutedText(context);
    final text = premiumText(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.file_download_outlined,
                size: 14, color: _h ? text : muted),
            const SizedBox(width: 6),
            AnimatedDefaultTextStyle(
              duration: premiumFast,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: _h ? text : muted,
                decoration:
                    _h ? TextDecoration.underline : TextDecoration.none,
                decorationColor: text,
              ),
              child: const Text("Download résumé (PDF)"),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroPortrait extends StatelessWidget {
  final bool compact;
  const _HeroPortrait({this.compact = false});

  @override
  Widget build(BuildContext context) {
    final accent = premiumAccent(context);
    final size = compact ? 120.0 : 320.0;
    final radius = compact ? 999.0 : 20.0;

    return ScrollReveal(
      delay: const Duration(milliseconds: 80),
      child: Align(
        alignment: compact ? Alignment.centerLeft : Alignment.centerRight,
        child: HoverLift(
          y: -2,
          child: Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: premiumBorder(context)),
              boxShadow: [
                BoxShadow(
                  color: accent.withValues(alpha: 0.10),
                  blurRadius: 30,
                  spreadRadius: -6,
                  offset: const Offset(0, 18),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius - 1),
              child: Image.asset(
                'assets/me.jpg',
                fit: BoxFit.cover,
                semanticLabel:
                    'Khader Hassan Hwaijeh, Software Engineer and Full-Stack Developer',
                cacheWidth: compact ? 280 : 720,
                filterQuality: FilterQuality.medium,
                gaplessPlayback: true,
                frameBuilder: (c, child, frame, sync) {
                  if (sync) return child;
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: premiumMedium,
                    child: child,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    // URLs come from lib/models/data.dart so there is exactly one
    // definition of each profile link across the whole project.
    return const Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        SocialBtn(
          icon: FontAwesomeIcons.github,
          url: githubUrl,
          tooltip: "GitHub",
        ),
        SocialBtn(
          icon: FontAwesomeIcons.linkedin,
          url: linkedInUrl,
          tooltip: "LinkedIn",
        ),
        SocialBtn(
          icon: FontAwesomeIcons.whatsapp,
          url: whatsappUrl,
          tooltip: "WhatsApp",
        ),
        SocialBtn(
          icon: FontAwesomeIcons.telegram,
          url: telegramUrl,
          tooltip: "Telegram",
        ),
        SocialBtn(
          icon: FontAwesomeIcons.envelope,
          url: emailUrl,
          tooltip: "Email",
        ),
      ],
    );
  }
}
