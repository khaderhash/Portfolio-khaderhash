import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  const SectionContainer({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: child,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black87;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 40, height: 2, color: primaryColor),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
        Container(width: 40, height: 2, color: primaryColor),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const NavButton({super.key, required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white70
        : Colors.black54;
    return TextButton(
      onPressed: onPressed,
      child: Text(title, style: TextStyle(color: textColor, fontSize: 16)),
    );
  }
}

class SocialBtn extends StatelessWidget {
  final IconData icon;
  final String url;
  final Color baseColor, hoverColor;
  const SocialBtn({
    super.key,
    required this.icon,
    required this.url,
    required this.baseColor,
    required this.hoverColor,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) await launchUrl(uri);
      },
      icon: FaIcon(icon, size: 30),
      color: baseColor,
      hoverColor: hoverColor,
      tooltip: url,
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;
  const SkillChip({super.key, required this.label});
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(context).cardColor,
      labelStyle: TextStyle(color: Theme.of(context).primaryColor),
      side: BorderSide.none,
      elevation: 2,
    );
  }
}
