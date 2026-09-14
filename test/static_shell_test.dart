// Guards the pre-hydration HTML shell in web/index.html against drifting
// away from the content the Flutter app actually renders.
//
// Flutter Web paints to a canvas, so the shell is the only thing crawlers,
// link-preview bots and AI readers can see. If it says something different
// from the rendered page, that is cloaking — which Google and the AI
// crawlers both penalise. These tests fail the build when that happens.
//
//   flutter test test/static_shell_test.dart

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:khaderhash_portfolio/models/data.dart';
import 'package:khaderhash_portfolio/shell_generator.dart' as gen;

void main() {
  final indexFile = File('web/index.html');
  late String html;
  late String shell;

  setUpAll(() {
    expect(indexFile.existsSync(), isTrue,
        reason: 'web/index.html not found — run flutter test from the project root.');
    html = indexFile.readAsStringSync();
    final start = html.indexOf(gen.beginMarker);
    final end = html.indexOf(gen.endMarker);
    expect(start, greaterThanOrEqualTo(0),
        reason: 'SHELL:BEGIN marker missing from web/index.html');
    expect(end, greaterThan(start),
        reason: 'SHELL:END marker missing from web/index.html');
    shell = html.substring(start, end + gen.endMarker.length);
  });

  test('shell in web/index.html is regenerated from lib/models/data.dart', () {
    expect(
      gen.applyTo(html),
      equals(gen.normalizeEol(html)),
      reason: 'The committed shell no longer matches lib/models/data.dart.\n'
          'Someone edited project/skill/education data without regenerating.\n'
          'Fix: dart run tool/generate_shell.dart',
    );
  });

  test('every project appears in the shell with its role', () {
    for (final p in projectsData) {
      final title = p['title'] as String;
      expect(shell, contains(gen.esc(title)),
          reason: 'Project "$title" is missing from the shell.');
      expect(shell, contains(gen.esc(p['role'] as String)),
          reason: 'Role for "$title" is missing from the shell.');
    }
  });

  test('every live URL in the data appears in the shell', () {
    for (final p in projectsData) {
      final site = p['website'] as String?;
      if (site == null) continue;
      expect(shell, contains(gen.esc(site)),
          reason: 'Live URL for "${p['title']}" is missing from the shell.');
    }
  });

  test('production and other tiers are not mixed up in the shell', () {
    final prodHeading = shell.indexOf('<h2>Production systems</h2>');
    final otherHeading = shell.indexOf('<h2>Other projects</h2>');
    expect(prodHeading, greaterThanOrEqualTo(0));
    expect(otherHeading, greaterThan(prodHeading));

    for (final p in productionProjects) {
      final at = shell.indexOf('<h3>${gen.esc(p['title'] as String)}</h3>');
      expect(at, inInclusiveRange(prodHeading, otherHeading),
          reason: '"${p['title']}" is a production system but is not listed '
              'under the Production systems heading in the shell.');
    }
    for (final p in otherProjects) {
      final at = shell.indexOf('<h3>${gen.esc(p['title'] as String)}</h3>');
      expect(at, greaterThan(otherHeading),
          reason: '"${p['title']}" is not a production system but appears '
              'above the Other projects heading in the shell.');
    }
  });

  test('shell lists no project that no longer exists in the data', () {
    final titles = projectsData.map((p) => gen.esc(p['title'] as String)).toSet();
    final found = RegExp(r'<h3>(.*?)</h3>')
        .allMatches(shell)
        .map((m) => m.group(1)!)
        .toSet();
    expect(found.difference(titles), isEmpty,
        reason: 'The shell lists projects that are no longer in data.dart — '
            'stale content. Fix: dart run tool/generate_shell.dart');
  });

  test('every skill group and education entry is in the shell', () {
    for (final g in skillGroups) {
      expect(shell, contains(gen.esc(g['title'] as String)),
          reason: 'Skill group "${g['title']}" missing from the shell.');
      for (final s in (g['skills'] as List).cast<String>()) {
        expect(shell, contains(gen.esc(s)),
            reason: 'Skill "$s" missing from the shell.');
      }
    }
    for (final e in educationData) {
      expect(shell, contains(gen.esc(e['title']!)),
          reason: 'Education entry "${e['title']}" missing from the shell.');
      expect(shell, contains(gen.esc(e['place']!)),
          reason: 'Institution for "${e['title']}" missing from the shell.');
    }
  });

  test('contact details in the shell match the data', () {
    expect(shell, contains(contactEmail));
    for (final l in profileLinks) {
      expect(shell, contains(gen.esc(l['url']!)),
          reason: 'Profile link ${l['url']} missing from the shell.');
    }
  });

  test('head metadata points at the canonical live URL', () {
    expect(html, contains('<link rel="canonical" href="$siteUrl">'));
    expect(html, contains('<meta property="og:url" content="$siteUrl">'));
    expect(html, isNot(contains('khaderhash.web.app')),
        reason: 'The dead .web.app URL is back in the head.');
    expect(html, isNot(contains('name="keywords"')),
        reason: 'The meta keywords tag is back.');
    expect(html, contains('property="og:image" content="https://'),
        reason: 'og:image must be an absolute URL.');
  });

  // llms.txt is prose, so it is not generated — but it is a second surface
  // that AI readers trust, and it must not contradict the app either.
  group('llms.txt', () {
    late String llms;
    setUpAll(() {
      final f = File('web/llms.txt');
      expect(f.existsSync(), isTrue, reason: 'web/llms.txt is missing.');
      llms = f.readAsStringSync();
    });

    test('lists every project with its role and live URL', () {
      for (final p in projectsData) {
        final title = p['title'] as String;
        // Citizens Abroad is listed under its full foundation name.
        final needle = title.split(' — ').first;
        expect(llms, contains(needle),
            reason: 'Project "$title" is missing from llms.txt.');
        final site = p['website'] as String?;
        if (site != null) {
          expect(llms, contains(site),
              reason: 'Live URL for "$title" is missing from llms.txt.');
        }
      }
    });

    test('lists every education entry', () {
      for (final e in educationData) {
        expect(llms, contains(e['title']!),
            reason: 'Education entry "${e['title']}" missing from llms.txt.');
      }
    });

    test('does not contradict the app on retired claims', () {
      // Claims and values that were deliberately retired. If any of these
      // reappears, something regressed or was re-pasted from an old draft.
      const retired = [
        '70%',
        'Django',
        'Vercel',
        'Neon',
        'khaderhash.web.app',
        'Google Play',
        // Dead LinkedIn slugs — both 404'd before the real URL was supplied.
        'linkedin.com/in/khaderhash',
        'linkedin.com/in/khader_h',
        // Old WhatsApp number, replaced with the CV number.
        '963981949180',
        // Unverifiable UniVerse testing/CI claims, removed on request.
        'verified with automated tests',
        'Unit, widget, and integration tests',
        'CI/CD pipeline for analysis',
      ];
      for (final r in retired) {
        expect(llms, isNot(contains(r)),
            reason: 'llms.txt still contains the retired claim "$r".');
        expect(shell, isNot(contains(r)),
            reason: 'The shell still contains the retired claim "$r".');
      }
      // Railway is correct for Citizens Abroad only.
      expect('Railway'.allMatches(llms).length, lessThanOrEqualTo(2),
          reason: 'Railway appears more often than the Citizens Abroad entry '
              'justifies — check the infrastructure claims.');
    });
  });

  test('corrected contact values are live in every generated surface', () {
    final llms = File('web/llms.txt').readAsStringSync();
    for (final surface in {'shell': shell, 'index.html': html, 'llms.txt': llms}.entries) {
      expect(surface.value, contains(linkedInUrl),
          reason: 'Real LinkedIn URL missing from \${surface.key}.');
    }
    // WhatsApp is an icon button only — it belongs in the app, not the shell.
    final hero = File('lib/sections/hero_section.dart').readAsStringSync();
    expect(hero, contains('url: whatsappUrl'));
    expect(hero, contains('url: linkedInUrl'));
  });

  test('social URLs are defined exactly once, in data.dart', () {
    for (final dir in ['lib/sections', 'lib/widgets']) {
      for (final f in Directory(dir).listSync().whereType<File>()) {
        final src = f.readAsStringSync();
        for (final literal in ['https://www.linkedin.com/in/', 'https://wa.me/']) {
          expect(src, isNot(contains(literal)),
              reason: '\${f.path} hardcodes a profile URL. '
                  'Reference the constant in data.dart instead.');
        }
      }
    }
  });

  test('shell is removed once the app paints, and only then', () {
    expect(html, contains("addEventListener('flutter-first-frame'"),
        reason: 'Nothing removes the shell — it would cover the app forever.');
    expect(html, contains("getElementById('shell')"));
  });
}
