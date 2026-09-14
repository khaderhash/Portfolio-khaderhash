import 'package:flutter/material.dart';

import '../models/data.dart';
import '../widgets/cards.dart';
import '../widgets/shared_widgets.dart';

// Icon keys live in data.dart as strings so the file stays import-free and
// tool/generate_shell.dart can read the same entries.
const Map<String, IconData> _educationIcons = {
  "school": Icons.school_outlined,
  "code": Icons.code_rounded,
  "insights": Icons.insights_outlined,
  "award": Icons.workspace_premium_outlined,
};

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          kicker: "Background",
          title: "Education & training",
        ),
        const SizedBox(height: 28),
        for (final e in educationData) ...[
          EducationCard(
            title: e["title"]!,
            place: e["place"]!,
            date: e["date"]!,
            icon: _educationIcons[e["icon"]] ?? Icons.school_outlined,
          ),
          if (e != educationData.last) const SizedBox(height: 12),
        ],
      ],
    );
  }
}
