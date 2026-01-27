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
                "I am a Software Engineer graduating from Yarmouk Private University (2026).\n\n"
                "I specialize in building high-performance mobile applications using Flutter, with a strong focus on clean architecture, scalability, and real-world usability. I also integrate automation workflows using n8n to simplify processes and improve system efficiency.\n\n"
                "I don’t just write code — I design structured solutions that turn real problems into reliable, maintainable systems.",
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
