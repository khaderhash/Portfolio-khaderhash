import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/data.dart';
import 'theme/app_colors.dart';
import 'theme/app_theme.dart';
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
        'subject': 'Project brief for Khader Hwaijeh',
        'body':
            'Hi Khader,\n\nProject:\nTimeline:\nBudget range:\nStack / constraints:\n\nShort context:\n',
      },
    );
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  /// Height of the fixed top bar; the page scrolls underneath it.
  static const double _navHeight = 68;

  /// Scrolls so the section's heading lands just below the top bar.
  ///
  /// `ensureVisible` aligned the section's outer edge to the very top of the
  /// screen, under the bar, and the target section's own top padding pushed
  /// the heading further down; this computes the heading position instead.
  void scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    final box = ctx?.findRenderObject();
    if (box == null || !_scrollController.hasClients) return;
    final viewport = RenderAbstractViewport.maybeOf(box);
    if (viewport == null) return;
    final sectionTop = viewport.getOffsetToReveal(box, 0).offset;
    final position = _scrollController.position;
    final target = (sectionTop + sectionVerticalPadding - _navHeight - 20)
        .clamp(position.minScrollExtent, position.maxScrollExtent);
    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 540),
      curve: premiumMotion,
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
                  // Contact is the last section, so the page used to run out
                  // of scroll before its heading reached the top and the nav
                  // link stopped on Volunteering. Giving Contact + footer at
                  // least a screen of height lets the heading reach the bar.
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height -
                          _navHeight -
                          20 +
                          sectionVerticalPadding,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SectionContainer(
                          key: contactKey,
                          child: const ContactSection(),
                        ),
                        const FooterSection(),
                      ],
                    ),
                  ),
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
    // The navbar is a forest (30%) surface in both modes.
    return Theme(
      data: forestTheme,
      child: Builder(builder: _buildBar),
    );
  }

  Widget _buildBar(BuildContext context) {
    final fill = premiumAccentFill(context);
    final bg = premiumBg(context).withValues(alpha: 0.96);
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
                      color: fill,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "K",
                        style: TextStyle(
                          color: premiumOnAccentFill(context),
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
        child: FocusRing(
          onTap: onTap,
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
              colors: [premiumBg(context), premiumBg(context)],
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
          // Sage glow on the forest page; forest on the sage page.
          (isDark ? AppColors.sage : AppColors.forest)
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
