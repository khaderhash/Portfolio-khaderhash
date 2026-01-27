import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});
  @override
  Widget build(BuildContext context) {
    final envTools = [
      "Flutter SDK",
      "Dart",
      "GetX",
      "Flutter Clean Architecture",
      "RESTful APIs Integration",
      "Firebase",
      "Laravel",
      "MySQL (Basic)",
      "n8n Automation Workflows",
      "Google Gemini API Integration",
      "WebSocket-based Features",
    ];
    final devTools = [
      "VS Code",
      "Android Studio",
      "Git & GitHub",
      "GitLab",
      "Postman",
      "Firebase Console",
      "Swagger",
      "Figma",
    ];
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white70
        : Colors.black87;

    return Column(
      children: [
        const SectionTitle(title: "Technical Skills"),
        const SizedBox(height: 40),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Environment & Tools",
            style: TextStyle(fontSize: 20, color: textColor),
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: envTools.map((s) => SkillChip(label: s)).toList(),
        ),
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Development Tools",
            style: TextStyle(fontSize: 20, color: textColor),
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: devTools.map((s) => SkillChip(label: s)).toList(),
        ),
      ],
    );
  }
}
