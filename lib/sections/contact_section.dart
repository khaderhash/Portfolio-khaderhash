import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/data.dart';
import '../widgets/shared_widgets.dart';
import 'hero_section.dart' show SocialIconsRow;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _emailBrief() async {
    final uri = Uri(
      scheme: 'mailto',
      path: contactEmail,
      queryParameters: {
        'subject': 'Project brief — Khader Hwaijeh',
        'body':
            'Hi Khader,\n\nProject:\nTimeline:\nBudget range:\nStack / constraints:\n\nShort context:\n',
      },
    );
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final accent = premiumAccent(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SectionTitle(
          kicker: "Get in touch",
          title: "Got a platform to build? Let's scope it.",
          subtitle:
              "I reply within 24 hours. Send a short brief and I'll help you clarify scope, timeline, and technical direction — no pitch deck required.",
          align: CrossAxisAlignment.center,
        ),
        const SizedBox(height: 32),
        GlassPanel(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
          child: Column(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: _emailBrief,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.alternate_email_rounded,
                          color: accent, size: 20),
                      const SizedBox(width: 10),
                      Text(
                        contactEmail,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.2,
                          color: premiumText(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  PremiumButton(
                    onPressed: _emailBrief,
                    icon: Icons.mail_outline_rounded,
                    label: "Email a Project Brief",
                  ),
                  PremiumButton(
                    onPressed: () => launchUrl(
                        Uri.parse(whatsappUrl)),
                    icon: Icons.chat_bubble_outline_rounded,
                    label: "Message on WhatsApp",
                    filled: false,
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const SocialIconsRow(),
            ],
          ),
        ),
      ],
    );
  }
}
