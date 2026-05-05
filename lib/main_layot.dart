import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khaderhash_portfolio/sections/volunteering_section.dart';
import 'package:provider/provider.dart';
import 'utils/theme_provider.dart';
import 'widgets/shared_widgets.dart';

import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/education_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';

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

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: premiumMedium,
      curve: premiumMotion,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final primaryColor = Theme.of(context).primaryColor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isCompact = screenWidth < 800;

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        toolbarHeight: 76,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "< KhaderHash />",
            style: GoogleFonts.firaCode(
              fontSize: screenWidth < 430 ? 18 : 22,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
        actions: [
          if (!isCompact) ...[
            NavButton(
              title: "About",
              onPressed: () => scrollToSection(aboutKey),
            ),
            NavButton(
              title: "Projects",
              onPressed: () => scrollToSection(projectsKey),
            ),
            NavButton(
              title: "Education",
              onPressed: () => scrollToSection(educationKey),
            ),
            NavButton(
              title: "Contact",
              onPressed: () => scrollToSection(contactKey),
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: HoverLift(
              y: -2,
              child: IconButton(
                style: IconButton.styleFrom(
                  fixedSize: const Size(46, 46),
                  backgroundColor: primaryColor.withValues(alpha: 0.10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(
                      color: primaryColor.withValues(alpha: 0.18),
                    ),
                  ),
                ),
                icon: AnimatedSwitcher(
                  duration: premiumFast,
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    key: ValueKey(isDark),
                    color: primaryColor,
                  ),
                ),
                tooltip: isDark
                    ? "Switch to light mode"
                    : "Switch to dark mode",
                onPressed: () => Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).toggleTheme(),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          const _AmbientBackground(),
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(key: homeKey, child: const HeroSection()),
                SectionContainer(key: aboutKey, child: const AboutSection()),
                SectionContainer(
                  key: projectsKey,
                  wide: true,
                  child: const ProjectsSection(),
                ),
                SectionContainer(
                  key: educationKey,
                  child: const EducationSection(),
                ),
                const SectionContainer(child: VolunteeringSection()),
                SectionContainer(key: skillsKey, child: const SkillsSection()),
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

      bottomNavigationBar: isCompact
          ? Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withValues(alpha: 0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                selectedItemColor: primaryColor,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.folder),
                    label: "Projects",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    label: "Education",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.mail),
                    label: "Contact",
                  ),
                ],
                onTap: (index) {
                  if (index == 0) scrollToSection(homeKey);
                  if (index == 1) scrollToSection(projectsKey);
                  if (index == 2) scrollToSection(educationKey);
                  if (index == 3) scrollToSection(contactKey);
                },
              ),
            )
          : null,
    );
  }
}

class _AmbientBackground extends StatefulWidget {
  const _AmbientBackground();

  @override
  State<_AmbientBackground> createState() => _AmbientBackgroundState();
}

class _AmbientBackgroundState extends State<_AmbientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 22),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = Theme.of(context).primaryColor;
    final secondary = Theme.of(context).colorScheme.secondary;
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedContainer(
          duration: premiumMedium,
          curve: premiumMotion,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? const [
                      Color(0xFF070A12),
                      Color(0xFF101624),
                      Color(0xFF07120F),
                    ]
                  : const [
                      Color(0xFFF6F8FB),
                      Color(0xFFEEF7F5),
                      Color(0xFFF8FBFF),
                    ],
            ),
          ),
          child: RepaintBoundary(
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(painter: _LayeredBackgroundPainter(isDark: isDark)),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    final wave = math.sin(_controller.value * math.pi * 2);
                    final waveAlt = math.cos(_controller.value * math.pi * 2);
                    return Stack(
                      children: [
                        _BackgroundBlob(
                          color: accent,
                          size: 620,
                          opacity: isDark ? 0.14 : 0.09,
                          alignment: const Alignment(-1.06, -0.72),
                          offset: Offset(wave * 18, waveAlt * 12),
                        ),
                        _BackgroundBlob(
                          color: secondary,
                          size: 520,
                          opacity: isDark ? 0.10 : 0.07,
                          alignment: const Alignment(1.12, -0.18),
                          offset: Offset(waveAlt * 14, wave * 10),
                        ),
                      ],
                    );
                  },
                ),
                _BackgroundBlob(
                  color: const Color(0xFF8B5CF6),
                  size: 460,
                  opacity: isDark ? 0.045 : 0.028,
                  alignment: const Alignment(0.08, 1.14),
                  offset: Offset.zero,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackgroundBlob extends StatelessWidget {
  final Color color;
  final double size;
  final double opacity;
  final Alignment alignment;
  final Offset offset;

  const _BackgroundBlob({
    required this.color,
    required this.size,
    required this.opacity,
    required this.alignment,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: offset,
        child: RepaintBoundary(
          child: SizedBox(
            width: size,
            height: size,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    color.withValues(alpha: opacity),
                    color.withValues(alpha: opacity * 0.38),
                    Colors.transparent,
                  ],
                  stops: const [0, 0.46, 1],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LayeredBackgroundPainter extends CustomPainter {
  final bool isDark;

  const _LayeredBackgroundPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final baseWash = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: isDark
            ? const [Color(0xFF0F172A), Color(0xFF08111F), Color(0xFF020617)]
            : const [Color(0xFFF8FAFC), Color(0xFFF0FDF4), Color(0xFFEFF6FF)],
      ).createShader(rect);
    canvas.drawRect(rect, baseWash);

    final vignette = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.05,
        colors: [
          Colors.transparent,
          (isDark ? Colors.black : const Color(0xFF0F172A)).withValues(
            alpha: isDark ? 0.22 : 0.035,
          ),
        ],
        stops: const [0.55, 1],
      ).createShader(rect);
    canvas.drawRect(rect, vignette);
  }

  @override
  bool shouldRepaint(covariant _LayeredBackgroundPainter oldDelegate) {
    return oldDelegate.isDark != isDark;
  }
}
