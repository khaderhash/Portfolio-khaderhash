import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';
import '../widgets/shared_widgets.dart';

class CyberPage extends StatelessWidget {
  const CyberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final muted = premiumMutedText(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "< KhaderHash />",
          style: GoogleFonts.firaCode(
            fontWeight: FontWeight.bold,
            color: AppColors.yellow,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            child: Text(
              "Go to Portfolio",
              style: const TextStyle(color: AppColors.sage),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.security, size: 100, color: primaryColor),
              const SizedBox(height: 30),

              Text(
                "Cybersecurity & Networking",
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(fontSize: 50),
              ),
              const SizedBox(height: 15),

              Text(
                "Secure your future! 🔒\nHere is the roadmap for Cybersecurity and Networks you asked for.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: muted, height: 1.5),
              ),
              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse('cyber.pdf'));
                },
                icon: const Icon(Icons.download),
                label: const Text("Download Cyber Map"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 60),
              const Divider(),
              const SizedBox(height: 20),

              Text(
                "Check out my secure apps:",
                style: TextStyle(color: muted),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                child: Text(
                  "View Projects →",
                  style: TextStyle(fontSize: 18, color: primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
