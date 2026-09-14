import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/data.dart';
import 'utils/theme_provider.dart';
import 'widgets/shared_widgets.dart';

import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/education_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';
import 'sections/volunteering_section.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final ScrollController _scrollController = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _emailBrief() async {
    final uri = Uri(
      scheme: 'mailto',
      path: contactEmail,
      queryParameters: {
        'subject': 'Project brief — Khader Hwaijeh',
        'body':
            'Hi Khader,\n\nProject:\nTimeline:\nBudget range:\nStack / constraints:\n\nShort context:\n',
      },
    );
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  void scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 540),
      curve: premiumMotion,
      alignment: 0.02,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDarkMode;
    final screenWidth = MediaQuery.of(context).size.width;
    final isCompact = screenWidth < 820;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: _TopNav(
          isCompact: isCompact,
          isDark: isDark,
          onAbout: () => scrollToSection(aboutKey),
          onProjects: () => scrollToSection(projectsKey),
          onEducation: () => scrollToSection(educationKey),
          onSkills: () => scrollToSection(skillsKey),
          onContact: () => scrollToSection(contactKey),
          onToggleTheme: () => themeProvider.toggleTheme(),
        ),
      ),
      body: Stack(
        children: [
          const _BackgroundLayer(),
          Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    key: homeKey,
                    child: HeroSection(
                      onViewWork: () => scrollToSection(projectsKey),
                      onEmailBrief: () => _emailBrief(),
                    ),
                  ),
                  SectionContainer(key: aboutKey, child: const AboutSection()),
                  SectionContainer(
                    key: projectsKey,
                    wide: true,
                    child: const ProjectsSection(),
                  ),
                  SectionContainer(
                    key: skillsKey,
                    child: const SkillsSection(),
                  ),
                  SectionContainer(
                    key: educationKey,
                    child: const EducationSection(),
                  ),
                  const SectionContainer(child: VolunteeringSection()),
                  SectionContainer(
                    key: contactKey,
                    child: const ContactSection(),
                  ),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopNav extends StatelessWidget {
  final bool isCompact;
  final bool isDark;
  final VoidCallback onAbout;
  final VoidCallback onProjects;
  final VoidCallback onEducation;
  final VoidCallback onSkills;
  final VoidCallback onContact;
  final VoidCallback onToggleTheme;

  const _TopNav({
    required this.isCompact,
    required this.isDark,
    required this.onAbout,
    required this.onProjects,
    required this.onEducation,
    required this.onSkills,
    required this.onContact,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final accent = premiumAccent(context);
    final bg = (isDark ? AppPalette.darkBg : AppPalette.lightBg)
        .withValues(alpha: 0.78);
    return Container(
      decoration: BoxDecoration(
        color: bg,
        border: Border(
          bottom: BorderSide(color: premiumBorder(context), width: 0.6),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width < 600 ? 18 : 32,
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Wordmark
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: accent.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "K",
                        style: TextStyle(
                          color: accent,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Khader Hwaijeh",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.2,
                      color: premiumText(context),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (!isCompact) ...[
              NavButton(title: "About", onPressed: onAbout),
              NavButton(title: "Projects", onPressed: onProjects),
              NavButton(title: "Skills", onPressed: onSkills),
              NavButton(title: "Education", onPressed: onEducation),
              NavButton(title: "Contact", onPressed: onContact),
              const SizedBox(width: 8),
            ],
            _ThemeToggle(isDark: isDark, onTap: onToggleTheme),
            if (isCompact) ...[
              const SizedBox(width: 6),
              _MobileMenu(
                onAbout: onAbout,
                onProjects: onProjects,
                onSkills: onSkills,
                onEducation: onEducation,
                onContact: onContact,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  final bool isDark;
  final VoidCallback onTap;
  const _ThemeToggle({required this.isDark, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isDark ? "Switch to light mode" : "Switch to dark mode",
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: premiumSurfaceAlt(context),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: premiumBorder(context)),
            ),
            child: AnimatedSwitcher(
              duration: premiumFast,
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: Icon(
                isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                key: ValueKey(isDark),
                size: 18,
                color: premiumText(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final VoidCallback onAbout, onProjects, onSkills, onEducation, onContact;
  const _MobileMenu({
    required this.onAbout,
    required this.onProjects,
    required this.onSkills,
    required this.onEducation,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu_rounded, color: premiumText(context)),
      color: premiumSurface(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: premiumBorder(context)),
      ),
      onSelected: (v) {
        switch (v) {
          case 'about':
            onAbout();
            break;
          case 'projects':
            onProjects();
            break;
          case 'skills':
            onSkills();
            break;
          case 'education':
            onEducation();
            break;
          case 'contact':
            onContact();
            break;
        }
      },
      itemBuilder: (_) => const [
        PopupMenuItem(value: 'about', child: Text('About')),
        PopupMenuItem(value: 'projects', child: Text('Projects')),
        PopupMenuItem(value: 'skills', child: Text('Skills')),
        PopupMenuItem(value: 'education', child: Text('Education')),
        PopupMenuItem(value: 'contact', child: Text('Contact')),
      ],
    );
  }
}

class _BackgroundLayer extends StatelessWidget {
  const _BackgroundLayer();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Positioned.fill(
      child: IgnorePointer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark
                  ? const [Color(0xFF0B0D10), Color(0xFF0B0D10)]
                  : const [Color(0xFFFBFBFC), Color(0xFFFBFBFC)],
            ),
          ),
          child: CustomPaint(
            painter: _SubtleGridPainter(isDark: isDark),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}

// Extremely subtle dotted accent for the hero area only — single repaint.
class _SubtleGridPainter extends CustomPainter {
  final bool isDark;
  _SubtleGridPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    // Single soft radial highlight at top — no grid lines.
    final highlight = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0, -1.0),
        radius: 1.1,
        colors: [
          (isDark
                  ? const Color(0xFF4ADE80)
                  : const Color(0xFF059669))
              .withValues(alpha: isDark ? 0.06 : 0.05),
          Colors.transparent,
        ],
      ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, highlight);
  }

  @override
  bool shouldRepaint(covariant _SubtleGridPainter old) =>
      old.isDark != isDark;
}
