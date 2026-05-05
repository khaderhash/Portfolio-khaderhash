import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionTitle(title: "About Me"),
        const SizedBox(height: 40),
        Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HoverLift(
              y: -8,
              scale: 1.025,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: primaryColor.withValues(alpha: 0.55),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.20),
                      blurRadius: 28,
                      offset: const Offset(0, 18),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: isMobile ? 78 : 92,
                  backgroundColor: Theme.of(context).cardColor,
                  backgroundImage: const AssetImage('assets/2Y7A6772.jpeg'),
                ),
              ),
            ),
            SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 30 : 0),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isMobile
                    ? MediaQuery.of(context).size.width - 44
                    : 660,
              ),
              child: GlassPanel(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I build reliable products with a designer's eye and an engineer's discipline.",
                      style: TextStyle(
                        color: premiumText(context),
                        fontSize: 24,
                        height: 1.25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "I am a Software Engineer and a 2026 graduate of Yarmouk Private University.\n\n"
                      "My expertise lies in developing high-performance mobile apps with Flutter, guided by clean architecture and scalability. I also leverage n8n to build automation workflows that optimize efficiency and simplify complex systems.\n\n"
                      "I don't just write code. I design structured, reliable, and maintainable systems that solve real-world problems.",
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.7,
                        color: premiumMutedText(context),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        _AboutMetric(value: "4+", label: "Focus Areas"),
                        _AboutMetric(value: "2026", label: "SE Graduate"),
                        _AboutMetric(value: "Product", label: "Contributor"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AboutMetric extends StatelessWidget {
  final String value;
  final String label;

  const _AboutMetric({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).primaryColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: accent.withValues(alpha: 0.16)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              color: accent,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: premiumMutedText(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
