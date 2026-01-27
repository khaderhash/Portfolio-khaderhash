import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'utils/theme_provider.dart';
import 'widgets/shared_widgets.dart';

// استيراد الأقسام (تأكد من إنشائك للملفات)
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
  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "< KhaderHash />",
            style: GoogleFonts.firaCode(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
        actions: [
          if (MediaQuery.of(context).size.width > 800) ...[
            NavButton(
              title: "About",
              onPressed: () => scrollToSection(aboutKey),
            ),
            NavButton(
              title: "Education",
              onPressed: () => scrollToSection(educationKey),
            ),
            NavButton(
              title: "Projects",
              onPressed: () => scrollToSection(projectsKey),
            ),
            NavButton(
              title: "Contact",
              onPressed: () => scrollToSection(contactKey),
            ),
          ],
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: primaryColor,
            ),
            onPressed: () => Provider.of<ThemeProvider>(
              context,
              listen: false,
            ).toggleTheme(),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            SectionContainer(key: aboutKey, child: const AboutSection()),
            SectionContainer(
              key: educationKey,
              child: const EducationSection(),
            ),
            SectionContainer(key: skillsKey, child: const SkillsSection()),
            SectionContainer(key: projectsKey, child: ProjectsSection()),
            SectionContainer(key: contactKey, child: const ContactSection()),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
