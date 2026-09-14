import 'package:flutter/material.dart';

import '../models/data.dart';
import '../widgets/cards.dart';
import '../widgets/shared_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          kicker: "Production systems",
          title: "Systems I built, deployed, and still operate.",
          subtitle:
              "Live platforms with real users, running on infrastructure I provision and maintain myself. Each card links to the live build.",
        ),
        const SizedBox(height: 36),
        _ProjectGrid(
          projects: productionProjects,
          compact: false,
        ),
        const SizedBox(height: 72),
        const _SubHeading(
          kicker: "Other projects",
          title: "Product, academic, and personal work.",
          subtitle:
              "Client product delivery, my graduation project, and things I built to learn something specific. Not production systems I operate.",
        ),
        const SizedBox(height: 28),
        _ProjectGrid(
          projects: otherProjects,
          compact: true,
        ),
      ],
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  final List<Map<String, dynamic>> projects;
  final bool compact;
  const _ProjectGrid({required this.projects, required this.compact});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final int crossAxisCount;
        if (compact) {
          crossAxisCount = width < 560
              ? 1
              : width < 900
                  ? 2
                  : width < 1160
                      ? 3
                      : 4;
        } else {
          crossAxisCount = width < 720
              ? 1
              : width < 1080
                  ? 2
                  : 3;
        }

        final spacing = compact ? 16.0 : 20.0;

        // Derive the card height from the real card width: the visual is an
        // AspectRatio, so a fixed height clips the body whenever the column
        // is wide (release builds don't surface the overflow).
        final cardWidth =
            (width - spacing * (crossAxisCount - 1)) / crossAxisCount;
        final imageHeight = cardWidth * (compact ? 9 / 16 : 10 / 16);
        // Headroom for the body. Scales with the user's text size so the
        // card grows instead of clipping when accessibility scaling is on.
        final textScale = MediaQuery.textScalerOf(context).scale(1.0);
        final bodyHeight = (compact ? 196.0 : 226.0) * textScale;
        final cardHeight = imageHeight + bodyHeight;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          cacheExtent: 600,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            mainAxisExtent: cardHeight,
          ),
          itemBuilder: (context, index) {
            return RepaintBoundary(
              child: ProjectCard(
                project: projects[index],
                compact: compact,
                featured: !compact,
              ),
            );
          },
        );
      },
    );
  }
}

// Smaller, quieter heading for the secondary project tier — deliberately
// lower-contrast than SectionTitle so the two groups read as different
// weights rather than two equal sections.
class _SubHeading extends StatelessWidget {
  final String kicker;
  final String title;
  final String subtitle;
  const _SubHeading({
    required this.kicker,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final muted = premiumMutedText(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1,
          width: double.infinity,
          color: premiumBorder(context),
        ),
        const SizedBox(height: 28),
        Text(
          kicker.toUpperCase(),
          style: monoStyle(
            context,
            size: 11,
            weight: FontWeight.w600,
            color: muted,
          ).copyWith(letterSpacing: 1.4),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            height: 1.2,
            letterSpacing: -0.3,
            fontWeight: FontWeight.w600,
            color: premiumText(context),
          ),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 14, height: 1.6, color: muted),
          ),
        ),
      ],
    );
  }
}
