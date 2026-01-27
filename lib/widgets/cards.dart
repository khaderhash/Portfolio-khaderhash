import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black87;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isMain ? cardColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isMain ? primaryColor : Colors.grey.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: primaryColor),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Text(
                  place,
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            date,
            style: GoogleFonts.firaCode(fontSize: 14, color: primaryColor),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black87;

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  project['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (c, o, s) => Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.image, size: 50),
                  ),
                ),
                Container(color: Colors.black.withOpacity(0.2)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          project['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          if (project.containsKey('github'))
                            IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.github,
                                size: 20,
                              ),
                              color: textColor,
                              onPressed: () =>
                                  launchUrl(Uri.parse(project['github'])),
                            ),
                          IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.behance,
                              size: 20,
                            ),
                            color: primaryColor,
                            onPressed: () =>
                                launchUrl(Uri.parse(project['behance'])),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    project['desc'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Wrap(
                    spacing: 5,
                    children: (project['tech'] as List)
                        .map<Widget>(
                          (t) => Text(
                            "#$t",
                            style: TextStyle(
                              fontSize: 12,
                              color: primaryColor,
                              fontFamily: 'FiraCode',
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
