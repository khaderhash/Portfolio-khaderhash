import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileAppPage extends StatelessWidget {
  const MobileAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "< KhaderHash />",
          style: GoogleFonts.firaCode(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            child: Text(
              "Go to Portfolio",
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
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
              // 1. أيقونة الموبايل
              Icon(Icons.smartphone, size: 100, color: primaryColor),
              const SizedBox(height: 30),

              // 2. العنوان
              Text(
                "Mobile App Development Map",
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(fontSize: 50),
              ),
              const SizedBox(height: 15),

              // 3. الوصف
              const Text(
                "Want to build apps? 📱\nHere is the ultimate guide to starting your journey in Mobile Development (Flutter, Native, & more).",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 40),

              // 4. زر التحميل
              ElevatedButton.icon(
                onPressed: () {
                  // رابط الملف
                  launchUrl(Uri.parse('mobileapp.pdf'));
                },
                icon: const Icon(Icons.download),
                label: const Text("Download Mobile Guide"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.black,
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
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),

              // 5. دعوة لتصفح أعمالك
              const Text(
                "See what I built with Flutter:",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                child: Text(
                  "View My Apps →",
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
