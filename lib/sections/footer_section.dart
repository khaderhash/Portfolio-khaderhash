import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      alignment: Alignment.center,
      child: Text(
        "Built with Flutter Web - Khader Hwaijeh (c) 2026",
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white54
              : Colors.black45,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
