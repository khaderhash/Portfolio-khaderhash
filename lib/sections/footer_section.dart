import 'package:flutter/material.dart';

import '../widgets/shared_widgets.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: premiumBorder(context), width: 0.6),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1060),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 10,
            children: [
              Text(
                "© 2026 Khader Hassan Hwaijeh",
                style: TextStyle(
                  fontSize: 13,
                  color: premiumMutedText(context),
                ),
              ),
              Text(
                "Designed & built with Flutter.",
                style: monoStyle(context, size: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
