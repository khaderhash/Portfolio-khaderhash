import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

class VolunteeringSection extends StatelessWidget {
  const VolunteeringSection({super.key});

  @override
  Widget build(BuildContext context) {
    final accent = premiumAccent(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          kicker: "Community",
          title: "Volunteering",
        ),
        const SizedBox(height: 28),
        GlassPanel(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: accent.withValues(alpha: 0.25)),
                ),
                child: Icon(Icons.volunteer_activism_outlined,
                    color: accent, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aga Khan Foundation",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.3,
                        color: premiumText(context),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Data Management Volunteer · Syria",
                      style: monoStyle(context, size: 12, color: accent),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Managed and organized administrative datasets, streamlined data entry while keeping accuracy high, and supported the operations team with logistical tasks.",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.65,
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
