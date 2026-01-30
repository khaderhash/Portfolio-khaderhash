import 'package:flutter/material.dart';
import '../widgets/shared_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white70
        : Colors.black87;

    return Column(
      children: [
        const SectionTitle(title: "About Me"),
        const SizedBox(height: 40),
        Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: primaryColor, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Theme.of(context).cardColor,
                backgroundImage: const AssetImage('assets/2Y7A6772.jpeg'),
              ),
            ),
            SizedBox(width: isMobile ? 0 : 50, height: isMobile ? 30 : 0),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                "I am a Software Engineer and a 2026 graduate of Yarmouk Private University.\n\n"
                "My expertise lies in developing high-performance mobile apps with Flutter, guided by the principles of clean architecture and scalability. I also leverage n8n to build automation workflows that optimize efficiency and simplify complex systems.\n\n"
                "I don’t just write code—I design structured, reliable, and maintainable systems that solve real-world problems.",
                style: TextStyle(fontSize: 18, height: 1.6, color: textColor),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
