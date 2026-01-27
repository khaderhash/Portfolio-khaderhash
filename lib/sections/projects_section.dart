import 'package:flutter/material.dart';

import '../widgets/cards.dart';
import '../widgets/shared_widgets.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = [
    {
      "title": "UniVerse",
      "desc":
          "Smart university assistant built with Flutter. Includes automated scheduling, notifications, and real-time university bus tracking.",
      "tech": ["Flutter", "n8n", "Gemini", "Real-time Tracking"],
      "behance": "https://www.behance.net/gallery/241792513/UniVerse",
      "image": "assets/universelogo.png",
    },
    {
      "title": "Lumi Rewards",
      "desc":
          "B2B loyalty application introducing a QR-based rewards system for point management.",
      "tech": ["Flutter", "GetX", "QR Code"],
      "behance": "https://www.behance.net/gallery/238527685/LUMI-REWARDS",
      "image": "assets/lumilogo.jpeg",
    },
    {
      "title": "Student Learning Platform",
      "desc": "Cross-platform E-learning app. Scalable MVVM architecture.",
      "tech": ["Flutter", "MVVM", "Education"],
      "behance":
          "https://www.behance.net/gallery/234016951/learning-app-for-student",
      "github": "https://github.com/khaderhash/learning-app2",
      "image": "assets/learning.png",
    },
    {
      "title": "Expen Scope (EXS)",
      "desc":
          "Financial assistant for individuals and businesses with guided financial workflows powered by n8n automation.",
      "tech": ["Flutter", "n8n", "Laravel"],
      "behance":
          "https://www.behance.net/gallery/231325481/Exs-A-smart-financial",
      "image": "assets/exslogo.png",
    },
    {
      "title": "Abo Najib",
      "desc":
          "Financial management app (Offline & Online). Built with Flutter & Laravel (MVC).",
      "tech": ["Flutter", "Laravel", "MVC"],
      "behance":
          "https://www.behance.net/gallery/223675637/Abo-Najib-Personal-Finance-Expense-Management-App",
      "github": "https://github.com/khaderhash/Abo_Najib_front",
      "image": "assets/abonajib.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SectionTitle(title: "Featured Projects"),
        const SizedBox(height: 40),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: width < 900 ? 1 : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.2,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ProjectCard(project: projects[index]);
          },
        ),
      ],
    );
  }
}
