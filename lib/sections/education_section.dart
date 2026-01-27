import 'package:flutter/material.dart';
import '../widgets/cards.dart';
import '../widgets/shared_widgets.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: "Education & Courses"),
        const SizedBox(height: 40),
        const EducationCard(
          title: "BS Software Engineering",
          place: "Yarmouk Private University",
          date: "2020 - 2026",
          icon: Icons.school,
          isMain: true,
        ),
        const SizedBox(height: 20),
        const EducationCard(
          title: "App Development",
          place: "Focal X Agency",
          date: "2022 - 2023",
          icon: Icons.code,
        ),
        const SizedBox(height: 15),
        const EducationCard(
          title: "Training of Trainers (ToT)",
          place: "Smart Vision International Academy (UK)",
          date: "Completed",
          icon: Icons.workspace_premium,
        ),
      ],
    );
  }
}
