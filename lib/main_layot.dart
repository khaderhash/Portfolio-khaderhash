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
  final homeKey = GlobalKey();
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
    final screenWidth = MediaQuery.of(context).size.width;

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
          if (screenWidth > 800) ...[
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
            Container(key: homeKey, child: const HeroSection()),
            SectionContainer(key: aboutKey, child: const AboutSection()),
            SectionContainer(key: projectsKey, child: ProjectsSection()),
            SectionContainer(
              key: educationKey,
              child: const EducationSection(),
            ),
            SectionContainer(child: const VolunteeringSection()),
            SectionContainer(key: skillsKey, child: const SkillsSection()),
            SectionContainer(key: contactKey, child: const ContactSection()),
            const FooterSection(),
          ],
        ),
      ),

      bottomNavigationBar: screenWidth < 800
          ? Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
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
