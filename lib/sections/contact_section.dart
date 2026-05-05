import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/shared_widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _sendEmail() async {
    final emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'khaderhuijih@gmail.com',
      queryParameters: {'subject': 'Portfolio inquiry'},
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white70 : Colors.black54;

    return Column(
      children: [
        const SectionTitle(title: "Get In Touch"),
        const SizedBox(height: 18),
        Text(
          "For project inquiries or collaboration, contact me directly through email or social channels.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            height: 1.55,
            color: premiumMutedText(context),
          ),
        ),
        const SizedBox(height: 42),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: GlassPanel(
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                Text(
                  "Direct contact",
                  style: TextStyle(
                    color: premiumText(context),
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 14),
                InkWell(
                  onTap: _sendEmail,
                  borderRadius: BorderRadius.circular(14),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "khaderhuijih@gmail.com",
                          style: TextStyle(
                            color: premiumText(context),
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 14,
                  runSpacing: 14,
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
                      hoverColor: isDark ? Colors.white : Colors.black,
                    ),
                    SocialBtn(
                      icon: FontAwesomeIcons.github,
                      url: "https://github.com/khaderhash",
                      baseColor: iconColor,
                      hoverColor: isDark ? Colors.white : Colors.black,
                    ),
                    SocialBtn(
                      icon: FontAwesomeIcons.instagram,
                      url: "https://www.instagram.com/khader._.tech/",
                      baseColor: iconColor,
                      hoverColor: Colors.purpleAccent,
                    ),
                    SocialBtn(
                      icon: Icons.email,
                      url: "mailto:khaderhuijih@gmail.com",
                      baseColor: iconColor,
                      hoverColor: isDark ? Colors.white : Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
