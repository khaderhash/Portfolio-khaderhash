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
      "Node.js",
      "MySQL (Basic)",
      "n8n Automation Workflows",
      "WhatsApp Automation",
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
    return Column(
      children: [
        const SectionTitle(title: "Technical Skills"),
        const SizedBox(height: 40),
        GlassPanel(
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SkillGroup(title: "Environment & Tools", skills: envTools),
              const SizedBox(height: 28),
              _SkillGroup(title: "Development Tools", skills: devTools),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkillGroup extends StatelessWidget {
  final String title;
  final List<String> skills;

  const _SkillGroup({required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: premiumText(context),
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills.map((s) => SkillChip(label: s)).toList(),
        ),
      ],
    );
  }
}
