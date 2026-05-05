import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

class VolunteeringSection extends StatelessWidget {
  const VolunteeringSection({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: [
        const SectionTitle(title: "Volunteering"),
        const SizedBox(height: 40),
        GlassPanel(
          padding: const EdgeInsets.all(28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: primaryColor.withValues(alpha: 0.18),
                  ),
                ),
                child: Icon(Icons.volunteer_activism, color: primaryColor),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aga Khan Foundation",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: premiumText(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Data Management Volunteer | Syria",
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Managed and organized critical administrative datasets using Excel and Word.\n"
                      "Streamlined data entry processes while keeping accuracy high.\n"
                      "Supported the operations team with logistical and data tasks.",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.7,
                        color: premiumMutedText(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
