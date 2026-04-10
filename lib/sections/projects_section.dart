import 'package:flutter/material.dart';
import '../models/data.dart';
import '../widgets/shared_widgets.dart';
import '../widgets/cards.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double cardWidth = screenWidth < 800 ? screenWidth * 0.9 : 450;

    return Column(
      children: [
        const SectionTitle(title: "Featured Projects"),
        const SizedBox(height: 40),

        Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: projectsData.map((project) {
            return SizedBox(
              width: cardWidth,
              height: 380,
              child: NeonContainer(child: ProjectCard(project: project)),
            );
          }).toList(),
        ),
      ],
    );
  }
}
