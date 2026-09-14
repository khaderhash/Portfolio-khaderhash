import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 880;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          kicker: "About",
          title: "Senior-level execution with founder-level ownership.",
          subtitle:
              "Full-Stack Engineer, founder, and technical lead. I design systems end-to-end and ship the parts most teams underestimate: auth, billing edges, RBAC, deployment, and the workflows users actually depend on.",
        ),
        const SizedBox(height: 36),
        Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: isMobile ? 0 : 3,
              child: GlassPanel(
                padding: const EdgeInsets.all(26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I build production platforms — not demos.",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.45,
                        fontWeight: FontWeight.w600,
                        color: premiumText(context),
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "Day-to-day I architect and ship Laravel + React or Flutter products: schema design, REST APIs, authentication, role-based access, scoped admin dashboards — and I run the infrastructure they sit on. WeinKorsi, OboSyria, and EduPal all run on a self-managed Linux VPS behind Nginx: provisioning, HTTPS/TLS, migrations, scheduled jobs, automated backups, and uptime monitoring. Media storage is on Cloudflare R2; the Citizens Abroad platform runs on Railway.",
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.7,
                        color: premiumMutedText(context),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      "I also build AI-assisted automations with n8n and Gemini — RAG workflows, support bots, and finance/ops automations that remove repetitive work without rewriting the stack.",
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.7,
                        color: premiumMutedText(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: isMobile ? 0 : 20, height: isMobile ? 20 : 0),
            Expanded(
              flex: isMobile ? 0 : 2,
              child: Column(
                children: const [
                  _Stat(
                    value: "Founder",
                    label: "WeinKorsi — production marketplace",
                  ),
                  SizedBox(height: 12),
                  _Stat(
                    value: "Sole Engineer",
                    label:
                        "EduPal — adopted by Al Sham Private University",
                  ),
                  SizedBox(height: 12),
                  _Stat(
                    value: "Laravel · React · Flutter · n8n",
                    label: "Core stack",
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GlassPanel(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.4,
                color: premiumText(context),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: premiumMutedText(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
