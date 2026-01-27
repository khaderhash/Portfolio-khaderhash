import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/shared_widgets.dart';

// ------------------ 1. Hero Section (Updated with CV) ------------------
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black87;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final iconColor = isDark ? Colors.white70 : Colors.black54;

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello, I am",
            style: TextStyle(color: primaryColor, fontSize: 20),
          ),
          const SizedBox(height: 15),
          Text(
            "KHADER HWAIJEH",
            textAlign: TextAlign.center,
            style: GoogleFonts.bebasNeue(
              fontSize: 80,
              letterSpacing: 2,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),
          DefaultTextStyle(
            style: GoogleFonts.firaCode(fontSize: 24, color: Colors.grey),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText('Software Engineer'),
                TypewriterAnimatedText('Flutter Developer'),
                TypewriterAnimatedText('n8n Automation Expert'),
              ],
            ),
          ),
          const SizedBox(height: 30),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse('cv.pdf'));
                },
                icon: Icon(Icons.visibility,color: Colors.black,),
                label: const Text("View CV"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              OutlinedButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse('cv.pdf'));
                },
                icon:  Icon(Icons.download,color: primaryColor,),
                label: const Text("Download CV"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: primaryColor,
                  side: BorderSide(color: primaryColor, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),
          const SocialIconsRow(),
        ],
      ),
    );
  }
}
class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white70 : Colors.black54;

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
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
    );
  }
}
