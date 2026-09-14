// CLI for regenerating the pre-hydration HTML shell in web/index.html.
//
//   dart run tool/generate_shell.dart          # rewrite web/index.html
//   dart run tool/generate_shell.dart --check  # exit 1 if out of date
//
// Why this exists: Flutter Web paints to a canvas, so crawlers and AI
// readers see an empty page. The shell puts the real content in the DOM
// before the engine loads. If the shell and the app ever disagree, that is
// cloaking — so the shell is GENERATED, never hand-edited, and
// test/static_shell_test.dart fails the build when it drifts.

import 'dart:io';

import 'package:khaderhash_portfolio/shell_generator.dart';

void main(List<String> args) {
  final file = File('web/index.html');
  if (!file.existsSync()) {
    stderr.writeln('web/index.html not found — run from the project root.');
    exit(2);
  }
  final llmsFile = File('web/llms.txt');
  if (!llmsFile.existsSync()) {
    stderr.writeln('web/llms.txt not found — run from the project root.');
    exit(2);
  }

  final current = file.readAsStringSync();
  final currentLlms = llmsFile.readAsStringSync();

  if (args.contains('--check')) {
    var stale = false;
    if (!isUpToDate(current)) {
      stderr.writeln('web/index.html (shell + JSON-LD) is OUT OF DATE.');
      stale = true;
    }
    if (!llmsIsUpToDate(currentLlms)) {
      stderr.writeln('web/llms.txt links block is OUT OF DATE.');
      stale = true;
    }
    if (stale) {
      stderr.writeln('Run: dart run tool/generate_shell.dart');
      exit(1);
    }
    stdout.writeln('shell, JSON-LD and llms.txt links are up to date');
    return;
  }

  file.writeAsStringSync(applyTo(current));
  llmsFile.writeAsStringSync(applyToLlms(currentLlms));
  stdout.writeln(
      'web/index.html (shell + JSON-LD) and web/llms.txt regenerated');
}
