import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'shared_widgets.dart';

// ────────────── Education card ──────────────

class EducationCard extends StatelessWidget {
  final String title, place, date;
  final IconData icon;

  const EducationCard({
    super.key,
    required this.title,
    required this.place,
    required this.date,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final accent = premiumAccent(context);
    return GlassPanel(
      padding: const EdgeInsets.all(20),
      radius: 14,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: accent.withValues(alpha: 0.25)),
            ),
            child: Icon(icon, size: 20, color: accent),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    color: premiumText(context),
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  place,
                  style: TextStyle(
                    fontSize: 13.5,
                    color: premiumMutedText(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            date,
            style: monoStyle(context, size: 12, color: accent),
          ),
        ],
      ),
    );
  }
}

// ────────────── Project card ──────────────

class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  /// Smaller type, tighter padding, shorter visual — used for the
  /// secondary "Other projects" tier.
  final bool compact;

  /// Accent-tinted border so production systems read as heavier than
  /// the secondary tier even before the reader parses the text.
  final bool featured;

  const ProjectCard({
    super.key,
    required this.project,
    this.compact = false,
    this.featured = false,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final accent = premiumAccent(context);
    final muted = premiumMutedText(context);
    final role = p['role'] as String?;
    final badges = (p['cardBadges'] as List?)?.cast<String>() ??
        (p['badges'] as List?)?.cast<String>() ??
        const <String>[];
    final isBrandMark = (p['logo'] as bool?) ?? false;
    final brandColor =
        p['brandColor'] is int ? Color(p['brandColor'] as int) : null;
    final compact = widget.compact;
    final featured = widget.featured;

    final idleBorder = featured
        ? accent.withValues(alpha: 0.22)
        : premiumBorder(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => _openDetails(context, p),
        child: AnimatedContainer(
          duration: premiumFast,
          curve: premiumMotion,
          transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
          decoration: BoxDecoration(
            color: premiumSurface(context),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _hovered ? accent.withValues(alpha: 0.45) : idleBorder,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image / brand-mark panel
              AspectRatio(
                aspectRatio: compact ? 16 / 9 : 16 / 10,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _CardVisual(
                      path: p['image'],
                      isBrandMark: isBrandMark,
                      brandColor: brandColor,
                      cacheWidth: compact ? 360 : 540,
                      errorColor: muted,
                      semanticLabel: '${p['title']} — ${p['role']}',
                    ),
                    if (badges.isNotEmpty)
                      Positioned(
                        top: 10,
                        left: 10,
                        right: 10,
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: badges
                              .take(2)
                              .map((b) => _CardBadge(label: b))
                              .toList(),
                        ),
                      ),
                  ],
                ),
              ),
              // Body
              Expanded(
                child: Padding(
                  padding: compact
                      ? const EdgeInsets.fromLTRB(14, 14, 14, 12)
                      : const EdgeInsets.fromLTRB(18, 18, 18, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p['title'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: compact ? 15 : 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                          color: premiumText(context),
                        ),
                      ),
                      if (role != null && role.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          role,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: monoStyle(context,
                              size: compact ? 10.5 : 11.5, color: accent),
                        ),
                      ],
                      SizedBox(height: compact ? 8 : 10),
                      // Flexible, not a bare Text: at tight widths or with a
                      // larger text scale the description would otherwise
                      // overflow the card instead of dropping a line.
                      Flexible(
                        child: Text(
                          (p['outcome'] as String?) ?? p['desc'],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: compact ? 12.5 : 13.5,
                            height: 1.5,
                            color: muted,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: (p['tech'] as List)
                            .take(compact ? 2 : 3)
                            .map<Widget>(
                              (t) => _TechChipSm(label: "$t"),
                            )
                            .toList(),
                      ),
                      SizedBox(height: compact ? 10 : 14),
                      Row(
                        children: [
                          Text(
                            "See the build",
                            style: TextStyle(
                              fontSize: compact ? 12 : 13,
                              fontWeight: FontWeight.w600,
                              color: accent,
                            ),
                          ),
                          const SizedBox(width: 6),
                          AnimatedSlide(
                            offset: Offset(_hovered ? 0.25 : 0, 0),
                            duration: premiumFast,
                            curve: premiumMotion,
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              size: 16,
                              color: accent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openDetails(BuildContext context, Map<String, dynamic> p) {
    final achievements =
        (p['achievements'] as List?)?.cast<String>() ?? const <String>[];
    final leadRole = p['leadRole'] as String? ?? p['desc'];
    final architecture = p['architecture'] as String? ?? "";
    final devOpsQa = p['devOpsQa'] as String?;
    final label = p['label'] as String?;
    final hasVideo = (p['video'] as String?)?.isNotEmpty ?? false;
    final hasGithub = (p['github'] as String?)?.isNotEmpty ?? false;
    final hasBehance = (p['behance'] as String?)?.isNotEmpty ?? false;
    final hasWebsite = (p['website'] as String?)?.isNotEmpty ?? false;

    final accent = premiumAccent(context);
    final muted = premiumMutedText(context);

    showDialog<void>(
      context: context,
      barrierColor: Colors.black54,
      builder: (dialogCtx) {
        final maxH = MediaQuery.of(dialogCtx).size.height - 48;
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          backgroundColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 760, maxHeight: maxH),
            child: GlassPanel(
              padding: EdgeInsets.zero,
              radius: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: _CardVisual(
                              path: p['image'],
                              isBrandMark: (p['logo'] as bool?) ?? false,
                              brandColor: p['brandColor'] is int
                                  ? Color(p['brandColor'] as int)
                                  : null,
                              cacheWidth: 1200,
                              errorColor: muted,
                              semanticLabel:
                                  '${p['title']} — ${p['role']}',
                            ),
                          ),
                          if (hasVideo)
                            Positioned.fill(
                              child: Center(
                                child: GestureDetector(
                                  onTap: () =>
                                      launchUrl(Uri.parse(p['video'])),
                                  child: Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.black.withValues(alpha: 0.5),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white
                                            .withValues(alpha: 0.4),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Material(
                              color: Colors.black.withValues(alpha: 0.5),
                              shape: const CircleBorder(),
                              child: IconButton(
                                tooltip: "Close",
                                icon: const Icon(Icons.close_rounded,
                                    color: Colors.white, size: 20),
                                onPressed: () => Navigator.pop(dialogCtx),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if ((p['badges'] as List?)?.isNotEmpty ?? false) ...[
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: ((p['badges'] as List).cast<String>())
                                    .map((b) => _CardBadge(label: b))
                                    .toList(),
                              ),
                              const SizedBox(height: 14),
                            ],
                            if (label != null && label.isNotEmpty) ...[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: accent.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(999),
                                  border: Border.all(
                                    color: accent.withValues(alpha: 0.4),
                                  ),
                                ),
                                child: Text(
                                  label,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: accent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                            Text(
                              p['title'],
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.6,
                                color: premiumText(context),
                              ),
                            ),
                            if ((p['role'] as String?)?.isNotEmpty ??
                                false) ...[
                              const SizedBox(height: 6),
                              Text(
                                p['role'],
                                style: monoStyle(context,
                                    size: 12, color: accent),
                              ),
                            ],
                            const SizedBox(height: 14),
                            Text(
                              leadRole,
                              style: TextStyle(
                                fontSize: 14.5,
                                height: 1.6,
                                color: muted,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: (p['tech'] as List)
                                  .map<Widget>(
                                    (t) => _TechChipSm(label: "$t"),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 22),
                            if (devOpsQa != null && devOpsQa.isNotEmpty) ...[
                              _DetailBlock(
                                  title: "DevOps & QA",
                                  body: devOpsQa,
                                  strong: true),
                              const SizedBox(height: 20),
                            ],
                            if (achievements.isNotEmpty) ...[
                              Text(
                                "Highlights",
                                style: monoStyle(context,
                                    size: 11.5,
                                    color: accent,
                                    weight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10),
                              ...achievements.map(
                                (a) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          width: 4,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: accent,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          a,
                                          style: TextStyle(
                                            color: muted,
                                            fontSize: 13.5,
                                            height: 1.55,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                            if (architecture.isNotEmpty)
                              _DetailBlock(
                                  title: "Stack & Architecture",
                                  body: architecture,
                                  strong: false),
                            const SizedBox(height: 22),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                if (hasWebsite)
                                  _ActionBtn(
                                    icon: Icons.public_rounded,
                                    label: "Visit Live Platform",
                                    onTap: () =>
                                        launchUrl(Uri.parse(p['website'])),
                                  ),
                                if (hasVideo)
                                  _ActionBtn(
                                    icon: Icons.play_arrow_rounded,
                                    label: "Demo",
                                    onTap: () =>
                                        launchUrl(Uri.parse(p['video'])),
                                  ),
                                if (hasGithub)
                                  _ActionBtn(
                                    icon: FontAwesomeIcons.github,
                                    label: "GitHub",
                                    onTap: () =>
                                        launchUrl(Uri.parse(p['github'])),
                                  ),
                                if (hasBehance)
                                  _ActionBtn(
                                    icon: FontAwesomeIcons.behance,
                                    label: "Behance",
                                    onTap: () =>
                                        launchUrl(Uri.parse(p['behance'])),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ────────────── Image ──────────────

class ProjectImage extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final int cacheWidth;
  final Color errorColor;

  /// Alt text. Flutter paints to a canvas, so this is the only thing a
  /// screen reader can announce for the image.
  final String? semanticLabel;

  const ProjectImage({
    super.key,
    required this.path,
    required this.fit,
    required this.cacheWidth,
    required this.errorColor,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final image = path.startsWith('web/')
        ? Image.network(
            '/${path.substring(4)}',
            fit: fit,
            semanticLabel: semanticLabel,
            cacheWidth: cacheWidth,
            filterQuality: FilterQuality.low,
            gaplessPlayback: true,
            errorBuilder: _err,
          )
        : Image.asset(
            path,
            fit: fit,
            semanticLabel: semanticLabel,
            cacheWidth: cacheWidth,
            filterQuality: FilterQuality.low,
            gaplessPlayback: true,
            frameBuilder: (c, child, frame, sync) {
              if (sync) return child;
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(milliseconds: 220),
                child: child,
              );
            },
            errorBuilder: _err,
          );
    return image;
  }

  Widget _err(BuildContext c, Object e, StackTrace? s) =>
      Container(color: Colors.transparent, child: Icon(Icons.image_outlined, size: 40, color: errorColor));
}

// ────────────── Helpers ──────────────

class _DetailBlock extends StatelessWidget {
  final String title;
  final String body;
  final bool strong;
  const _DetailBlock(
      {required this.title, required this.body, this.strong = false});

  @override
  Widget build(BuildContext context) {
    final accent = premiumAccent(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: monoStyle(context,
              size: 11.5, color: accent, weight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: TextStyle(
            color: strong ? premiumText(context) : premiumMutedText(context),
            fontSize: 13.5,
            height: 1.6,
            fontWeight: strong ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _TechChipSm extends StatelessWidget {
  final String label;
  const _TechChipSm({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: premiumSurfaceAlt(context),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: premiumBorder(context)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.w500,
          color: premiumMutedText(context),
        ),
      ),
    );
  }
}

class _ActionBtn extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ActionBtn({required this.icon, required this.label, required this.onTap});

  @override
  State<_ActionBtn> createState() => _ActionBtnState();
}

class _ActionBtnState extends State<_ActionBtn> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final accent = premiumAccent(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: premiumFast,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: _h ? accent.withValues(alpha: 0.10) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: accent.withValues(alpha: 0.4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(widget.icon, size: 13, color: accent),
              const SizedBox(width: 7),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: accent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ────────────── Visual: screenshot OR brand-mark panel ──────────────
//
// Brand-mark mode renders the logo as a contained mark on a soft
// tinted backdrop derived from the project's brand color. Same frame
// as screenshot mode, so visual rhythm across cards is preserved.

class _CardVisual extends StatelessWidget {
  final String path;
  final bool isBrandMark;
  final Color? brandColor;
  final int cacheWidth;
  final Color errorColor;
  final String? semanticLabel;

  const _CardVisual({
    required this.path,
    required this.isBrandMark,
    required this.brandColor,
    required this.cacheWidth,
    required this.errorColor,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    if (!isBrandMark) {
      return Container(
        color: premiumSurfaceAlt(context),
        child: ProjectImage(
          path: path,
          fit: BoxFit.cover,
          cacheWidth: cacheWidth,
          errorColor: errorColor,
          semanticLabel: semanticLabel,
        ),
      );
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = brandColor ?? premiumAccent(context);
    // Soft tinted backdrop — mark sits on a calm brand-coloured panel.
    final bg = isDark
        ? Color.lerp(base, Colors.black, 0.70)!
        : Color.lerp(base, Colors.white, 0.92)!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            bg,
            Color.lerp(bg, isDark ? Colors.black : Colors.white, 0.35)!,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: ProjectImage(
            path: path,
            fit: BoxFit.contain,
            cacheWidth: cacheWidth,
            errorColor: errorColor,
            semanticLabel: semanticLabel,
          ),
        ),
      ),
    );
  }
}

// ────────────── Badge pill (Live Production / Founder / …) ──────────────

class _CardBadge extends StatelessWidget {
  final String label;
  const _CardBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    final isLive = label.toLowerCase().contains("live");
    final isFounder = label.toLowerCase().contains("founder");
    final accent = premiumAccent(context);
    final dot = isLive
        ? const Color(0xFF22C55E)
        : (isFounder ? accent : accent);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
