import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Text(
        "Built with Flutter Web • Khader Hwaijeh © 2026",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
