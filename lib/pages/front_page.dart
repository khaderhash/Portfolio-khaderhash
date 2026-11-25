import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';
import '../widgets/shared_widgets.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

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
              Icon(Icons.web, size: 100, color: primaryColor),
              const SizedBox(height: 30),

              Text(
                "Full Stack Developer",
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(fontSize: 50),
              ),
              const SizedBox(height: 15),

              Text(
                "Master the Web! 🌐\nHere is the complete guide for HTML, CSS, JS, and Frameworks.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: muted, height: 1.5),
              ),
              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse('front.pdf'));
                },
                icon: const Icon(Icons.download),
                label: const Text("Download Frontend Map"),
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
                "Check out my Flutter Web projects:",
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
