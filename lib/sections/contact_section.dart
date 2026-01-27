import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/shared_widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white70 : Colors.black54;

    return Column(
      children: [
        const SectionTitle(title: "Get In Touch"),
        const SizedBox(height: 30),
        const Text(
          "Let's build something amazing together.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: () async {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'khaderhuijih@gmail.com',
            );
            if (await canLaunchUrl(emailLaunchUri)) {
              await launchUrl(emailLaunchUri);
            }
          },
          icon: const Icon(Icons.email),
          label: const Text("Send an Email"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
        const SizedBox(height: 30),

        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          runSpacing: 20,
          children: [
            SocialBtn(
              icon: FontAwesomeIcons.whatsapp,
              url: "https://wa.me/963981949180",
              baseColor: iconColor,
              hoverColor: Colors.green,
            ),
            SocialBtn(
              icon: FontAwesomeIcons.linkedin,
              url: "https://linkedin.com/in/khaderhash",
              baseColor: iconColor,
              hoverColor: Colors.blue,
            ),
            SocialBtn(
              icon: FontAwesomeIcons.telegram,
              url: "https://t.me/khaderhash",
              baseColor: iconColor,
              hoverColor: Colors.blue,
            ),
            SocialBtn(
              icon: FontAwesomeIcons.behance,
              url: "https://behance.net/khaderhash",
              baseColor: iconColor,
              hoverColor: isDark ? Colors.black : Colors.white,
            ),
            SocialBtn(
              icon: FontAwesomeIcons.github,
              url: "https://github.com/khaderhash",
              baseColor: iconColor,
              hoverColor: isDark ? Colors.black : Colors.white,
            ),
            SocialBtn(
              icon: FontAwesomeIcons.instagram,
              url: "https://www.instagram.com/khader._.h?igsh=MTQ2bmw1a21kZ2dscw==",
              baseColor: iconColor,
              hoverColor: Colors.purpleAccent,
            ),
            SocialBtn(
              icon: Icons.email,
              url: "mailto:khaderhuijih@gmail.com",
              baseColor: iconColor,
              hoverColor: isDark ? Colors.black : Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
