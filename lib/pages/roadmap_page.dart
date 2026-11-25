import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';
import '../widgets/shared_widgets.dart';

class RoadmapPage extends StatelessWidget {
  const RoadmapPage({super.key});

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
              Icon(Icons.description, size: 100, color: primaryColor),
              const SizedBox(height: 30),

              Text(
                "Software Engineering Roadmap",
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(fontSize: 50),
              ),
              const SizedBox(height: 15),

              Text(
                "Thanks for visiting from Instagram! 🚀\nHere is the roadmap file you requested. It contains a complete path to mastering Software Engineering.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: muted, height: 1.5),
              ),
              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse('roadmap.pdf'));
                },
                icon: const Icon(Icons.download),
                label: const Text("Download PDF Now"),
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
                "While you are here...",
                style: TextStyle(color: muted),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                child: Text(
                  "Check out my AI & Flutter Projects →",
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
