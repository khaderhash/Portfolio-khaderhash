import 'package:flutter/material.dart';

import '../models/data.dart';
import '../widgets/shared_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          kicker: "Skills",
          title: "Stack I ship with.",
          subtitle:
              "Tools chosen for production work — infrastructure, backend, mobile, frontend, product architecture, and AI automation.",
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, c) {
            final twoCol = c.maxWidth > 760;
            final children = [
              for (final g in skillGroups)
                _SkillGroup(
                  title: g["title"] as String,
                  skills: (g["skills"] as List).cast<String>(),
                ),
            ];
            // Wrap (not GridView) so each panel takes its intrinsic height —
            // group sizes differ enough that a fixed aspect ratio overflows.
            if (twoCol) {
              final colWidth = (c.maxWidth - 16) / 2;
              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: children
                    .map((w) => SizedBox(width: colWidth, child: w))
                    .toList(),
              );
            }
            return Column(
              children: children
                  .map((w) => Padding(
                      padding: const EdgeInsets.only(bottom: 14), child: w))
                  .toList(),
            );
          },
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
    return GlassPanel(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: monoStyle(
              context,
              size: 11.5,
              color: premiumAccent(context),
              weight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((s) => SkillChip(label: s)).toList(),
          ),
        ],
      ),
    );
  }
}
