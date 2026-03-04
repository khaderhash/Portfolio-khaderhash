import 'package:flutter/material.dart';
import '../widgets/shared_widgets.dart';

class VolunteeringSection extends StatelessWidget {
  const VolunteeringSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black87;
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: [
        const SectionTitle(title: "Volunteering"),
        const SizedBox(height: 40),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
            border: Border(left: BorderSide(color: primaryColor, width: 4)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aga Khan Foundation",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Data Management Volunteer | Syria",
                style: TextStyle(fontSize: 16, color: primaryColor),
              ),
              const SizedBox(height: 15),
              Text(
                "• Managed and organized critical administrative datasets using Excel & Word.\n"
                "• Streamlined data entry processes ensuring high accuracy.\n"
                "• Supported the operations team in logistical tasks.",
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
