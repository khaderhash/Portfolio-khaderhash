import 'package:flutter/material.dart';
import '../models/data.dart';
import '../widgets/shared_widgets.dart';
import '../widgets/cards.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionTitle(title: "Featured Projects"),
        const SizedBox(height: 18),
        Text(
          "Selected products and systems spanning Flutter, AI workflows, automation, and business platforms.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white70
                : const Color(0xFF4B5563),
            fontSize: 17,
            height: 1.55,
          ),
        ),
        const SizedBox(height: 44),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final crossAxisCount = width < 720
                ? 1
                : width < 1080
                ? 2
                : 3;
            final cardHeight = width < 720 ? 444.0 : 452.0;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projectsData.length,
              cacheExtent: 900,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                mainAxisExtent: cardHeight,
              ),
              itemBuilder: (context, index) {
                return RepaintBoundary(
                  child: NeonContainer(
                    child: ProjectCard(project: projectsData[index]),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
