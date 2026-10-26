import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/data.dart';
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
          child: Column(
            children: [
              // Same links, same order as the shell footer in web/index.html.
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 18,
                runSpacing: 8,
                children: [
                  for (final l in footerLinks)
                    _FooterLink(label: l['label']!, url: l['url']!),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 10,
                children: [
                  Text(
                    footerCopyright,
                    style: TextStyle(
                      fontSize: 13,
                      color: premiumMutedText(context),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Text(
                    "Designed & built with Flutter.",
                    style: monoStyle(context, size: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final String url;
  const _FooterLink({required this.label, required this.url});
  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final muted = premiumMutedText(context);
    final text = premiumText(context);
    return Semantics(
      link: true,
      linkUrl: Uri.parse(widget.url),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _h = true),
        onExit: (_) => setState(() => _h = false),
        child: GestureDetector(
          onTap: () => launchUrl(Uri.parse(widget.url)),
          child: AnimatedDefaultTextStyle(
            duration: premiumFast,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: _h ? text : muted,
              decoration: _h ? TextDecoration.underline : TextDecoration.none,
              decorationColor: text,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
