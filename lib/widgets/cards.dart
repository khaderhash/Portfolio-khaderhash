import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'shared_widgets.dart';

class EducationCard extends StatelessWidget {
  final String title, place, date;
  final IconData icon;
  final bool isMain;

  const EducationCard({
    super.key,
    required this.title,
    required this.place,
    required this.date,
    required this.icon,
    this.isMain = false,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return GlassPanel(
      padding: const EdgeInsets.all(22),
      radius: 18,
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: primaryColor.withValues(alpha: 0.20)),
            ),
            child: Icon(icon, size: 28, color: primaryColor),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: premiumText(context),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  place,
                  style: TextStyle(
                    fontSize: 15,
                    color: premiumMutedText(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            date,
            style: GoogleFonts.firaCode(fontSize: 13, color: primaryColor),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final primaryColor = Theme.of(context).primaryColor;
    final muted = premiumMutedText(context);
    final role = project['role'] as String?;
    final hasVideo = project.containsKey('video') && project['video'] != "";
    final hasGithub = project.containsKey('github') && project['github'] != "";
    final hasBehance =
        project.containsKey('behance') && project['behance'] != "";
    final hasWebsite =
        project.containsKey('website') && project['website'] != "";
    final achievements =
        (project['achievements'] as List?)?.cast<String>() ?? const <String>[];
    final leadRole = project['leadRole'] as String? ?? project['desc'];
    final architecture = project['architecture'] as String? ?? "";
    final devOpsQa = project['devOpsQa'] as String?;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => _showProjectDetails(
          context: context,
          project: project,
          achievements: achievements,
          leadRole: leadRole,
          architecture: architecture,
          devOpsQa: devOpsQa,
          hasWebsite: hasWebsite,
          hasVideo: hasVideo,
          hasGithub: hasGithub,
          hasBehance: hasBehance,
        ),
        child: AnimatedScale(
          scale: _hovered ? 1.018 : 1,
          duration: premiumFast,
          curve: premiumMotion,
          child: AnimatedContainer(
            duration: premiumFast,
            curve: premiumMotion,
            decoration: BoxDecoration(
              color: premiumSurface(context),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withValues(alpha: _hovered ? 0.18 : 0.08),
                  blurRadius: _hovered ? 34 : 20,
                  offset: Offset(0, _hovered ? 20 : 12),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final imageHeight = constraints.maxHeight * 0.50;
                final bodyHeight = constraints.maxHeight - imageHeight;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: imageHeight,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          RepaintBoundary(
                            child: AnimatedScale(
                              scale: _hovered ? 1.04 : 1,
                              duration: const Duration(milliseconds: 360),
                              curve: premiumMotion,
                              child: ProjectImage(
                                path: project['image'],
                                fit: BoxFit.cover,
                                cacheWidth: 760,
                                errorColor: muted,
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withValues(alpha: 0.06),
                                  Colors.black.withValues(alpha: 0.62),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18,
                            right: 18,
                            bottom: 16,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project['title'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                if (role != null && role.isNotEmpty) ...[
                                  const SizedBox(height: 5),
                                  Text(
                                    role,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.firaCode(
                                      color: Colors.white.withValues(
                                        alpha: 0.84,
                                      ),
                                      fontSize: 11.3,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: bodyHeight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: premiumText(context),
                                fontSize: 17,
                                height: 1.15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            if (role != null && role.isNotEmpty) ...[
                              const SizedBox(height: 6),
                              Text(
                                role,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.firaCode(
                                  color: primaryColor,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                            const SizedBox(height: 10),
                            Text(
                              project['desc'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.5,
                                height: 1.42,
                                color: muted,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 7,
                              runSpacing: 7,
                              children: (project['tech'] as List)
                                  .take(4)
                                  .map<Widget>(
                                    (tech) => _CardTechChip(label: "$tech"),
                                  )
                                  .toList(),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  "View details",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: primaryColor,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showProjectDetails({
    required BuildContext context,
    required Map<String, dynamic> project,
    required List<String> achievements,
    required String leadRole,
    required String architecture,
    required String? devOpsQa,
    required bool hasWebsite,
    required bool hasVideo,
    required bool hasGithub,
    required bool hasBehance,
  }) {
    final primaryColor = Theme.of(context).primaryColor;
    final muted = premiumMutedText(context);
    final label = project['label'] as String?;

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final dialogMaxHeight =
            MediaQuery.sizeOf(dialogContext).height -
            const EdgeInsets.symmetric(vertical: 24).vertical;

        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 24,
          ),
          backgroundColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 760,
              maxHeight: dialogMaxHeight,
            ),
            child: GlassPanel(
              padding: EdgeInsets.zero,
              radius: 22,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 22),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                _ProjectShowcase(
                                  imagePath: project['image'],
                                  videoUrl: hasVideo
                                      ? project['video'] as String
                                      : null,
                                  errorColor: muted,
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: IconButton(
                                    onPressed: () =>
                                        Navigator.pop(dialogContext),
                                    tooltip: "Close",
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.black.withValues(
                                        alpha: 0.42,
                                      ),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    icon: const Icon(Icons.close_rounded),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 22),
                            if (label != null && label.isNotEmpty) ...[
                              _ProjectBadge(label: label),
                              const SizedBox(height: 12),
                            ],
                            Text(
                              project['title'],
                              style: TextStyle(
                                color: premiumText(context),
                                fontSize: 25,
                                height: 1.18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            if ((project['role'] as String?)?.isNotEmpty ??
                                false) ...[
                              const SizedBox(height: 8),
                              Text(
                                project['role'],
                                style: GoogleFonts.firaCode(
                                  color: primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                            const SizedBox(height: 12),
                            Text(
                              project['desc'],
                              style: TextStyle(
                                color: muted,
                                height: 1.48,
                                fontSize: 14.5,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: (project['tech'] as List)
                                  .map<Widget>(
                                    (tech) => _TechPill(label: "$tech"),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 20),
                            if (devOpsQa != null && devOpsQa.isNotEmpty) ...[
                              _DetailBlock(
                                title: "DevOps & QA",
                                child: devOpsQa,
                                strong: true,
                              ),
                              const SizedBox(height: 20),
                            ],
                            Text(
                              "Achievements",
                              style: GoogleFonts.firaCode(
                                fontSize: 12,
                                color: primaryColor,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ...achievements.map(
                              (achievement) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        achievement,
                                        style: TextStyle(
                                          color: muted,
                                          height: 1.45,
                                          fontSize: 14.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _DetailBlock(
                              title: "Tech Stack & Architecture",
                              child: architecture,
                              strong: true,
                            ),
                            const SizedBox(height: 22),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.end,
                              children: [
                                if (hasWebsite)
                                  _DialogAction(
                                    icon: Icons.public_rounded,
                                    label: "Website",
                                    onPressed: () => launchUrl(
                                      Uri.parse(project['website']),
                                    ),
                                  ),
                                if (hasVideo)
                                  _DialogAction(
                                    icon: Icons.play_arrow_rounded,
                                    label: "Demo",
                                    onPressed: () =>
                                        launchUrl(Uri.parse(project['video'])),
                                  ),
                                if (hasGithub)
                                  _DialogAction(
                                    icon: FontAwesomeIcons.github,
                                    label: "GitHub",
                                    onPressed: () =>
                                        launchUrl(Uri.parse(project['github'])),
                                  ),
                                if (hasBehance)
                                  _DialogAction(
                                    icon: FontAwesomeIcons.behance,
                                    label: "Behance",
                                    onPressed: () => launchUrl(
                                      Uri.parse(project['behance']),
                                    ),
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

class ProjectImage extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final int cacheWidth;
  final Color errorColor;

  const ProjectImage({
    super.key,
    required this.path,
    required this.fit,
    required this.cacheWidth,
    required this.errorColor,
  });

  @override
  Widget build(BuildContext context) {
    final image = path.startsWith('web/')
        ? Image.network(
            '/${path.substring(4)}',
            fit: fit,
            cacheWidth: cacheWidth,
            filterQuality: FilterQuality.low,
            gaplessPlayback: true,
            errorBuilder: _errorBuilder,
          )
        : Image.asset(
            path,
            fit: fit,
            cacheWidth: cacheWidth,
            filterQuality: FilterQuality.low,
            gaplessPlayback: true,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(milliseconds: 220),
                curve: premiumMotion,
                child: child,
              );
            },
            errorBuilder: _errorBuilder,
          );

    return RepaintBoundary(child: image);
  }

  Widget _errorBuilder(BuildContext context, Object error, StackTrace? stack) {
    return Container(
      color: Colors.grey[850],
      child: Icon(Icons.image, size: 52, color: errorColor),
    );
  }
}

class _ProjectShowcase extends StatelessWidget {
  final String imagePath;
  final String? videoUrl;
  final Color errorColor;

  const _ProjectShowcase({
    required this.imagePath,
    required this.videoUrl,
    required this.errorColor,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final hasVideo = videoUrl != null && videoUrl!.isNotEmpty;

    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ProjectImage(
                path: imagePath,
                fit: BoxFit.cover,
                cacheWidth: 1200,
                errorColor: errorColor,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: hasVideo ? 0.10 : 0.02),
                      Colors.black.withValues(alpha: hasVideo ? 0.56 : 0.14),
                    ],
                  ),
                ),
              ),
              if (hasVideo)
                Center(
                  child: InkWell(
                    onTap: () => launchUrl(Uri.parse(videoUrl!)),
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.46),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.28),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withValues(alpha: 0.22),
                            blurRadius: 28,
                            offset: const Offset(0, 14),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 46,
                      ),
                    ),
                  ),
                ),
              if (hasVideo)
                Positioned(
                  left: 16,
                  bottom: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.48),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.18),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.play_circle_outline_rounded,
                          color: primaryColor,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "Watch demo",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
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
}

class _DetailBlock extends StatelessWidget {
  final String title;
  final String child;
  final bool strong;

  const _DetailBlock({
    required this.title,
    required this.child,
    this.strong = false,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.firaCode(
            fontSize: 12,
            color: primaryColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          child,
          style: TextStyle(
            color: strong ? premiumText(context) : premiumMutedText(context),
            fontSize: 14.5,
            height: 1.48,
            fontWeight: strong ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _ProjectBadge extends StatelessWidget {
  final String label;

  const _ProjectBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: primaryColor.withValues(alpha: 0.42)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: primaryColor,
          fontSize: 11,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _CardTechChip extends StatelessWidget {
  final String label;

  const _CardTechChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: primaryColor.withValues(alpha: 0.14)),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 11.3,
          color: primaryColor,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _TechPill extends StatelessWidget {
  final String label;

  const _TechPill({required this.label});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: primaryColor.withValues(alpha: 0.16)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: primaryColor,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _DialogAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _DialogAction({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: FaIcon(icon, size: 15),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: Theme.of(context).primaryColor,
          side: BorderSide(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.35),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
