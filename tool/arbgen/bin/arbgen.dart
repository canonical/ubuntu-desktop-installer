import 'dart:io';

import 'package:arbgen/arbgen.dart';
import 'package:args/args.dart';
import 'package:path/path.dart' as p;

String get appName => p.basename(Platform.script.path);
String get appDescription =>
    'Generates Flutter ARB files from `languagelist` and PO files.';

void printUsage(String options, {String? error}) {
  final hasError = error?.isNotEmpty == true;
  final out = hasError ? stderr : stdout;
  if (hasError) {
    out.write('Error: $error\n\n');
  }
  out.write('Usage: $appName [options] <input>\n\n');
  out.write('Generate Flutter ARB files from `languagelist` and PO files.\n\n');
  out.write('Options:\n$options\n');
  exit(hasError ? -1 : 0);
}

void main(List<String> args) {
  final parser = ArgParser();
  parser.addFlag('help', abbr: 'h', negatable: false, help: 'Show usage.');
  parser.addFlag('verbose',
      abbr: 'v', negatable: false, help: 'Verbose output.');
  parser.addOption(
    'output',
    abbr: 'o',
    valueHelp: 'dir',
    help: 'The output directory.',
    defaultsTo: 'l10n',
  );
  parser.addOption(
    'prefix',
    abbr: 'p',
    valueHelp: 'name',
    help: 'The .arb file prefix.',
    defaultsTo: 'app',
  );

  try {
    final options = parser.parse(args);
    if (options['help'] == true) {
      printUsage(parser.usage);
    }
    if (options.rest.length != 1) {
      printUsage(
        parser.usage,
        error: 'Unknown positional arguments "${options.rest.join(' ')}"',
      );
    }

    final input = options.rest.single;
    final prefix = options['prefix'];
    final output = options['output'];
    final verbose = options['verbose'] == true;

    if (p.basename(input) == 'languagelist') {
      importLanguagelist(
        file: File(input),
        prefix: prefix,
        output: output,
        verbose: verbose,
      );
    } else {
      importPoFiles(
        dir: Directory(input),
        prefix: prefix,
        output: output,
        verbose: verbose,
      );
    }
  } on FormatException catch (e) {
    printUsage(parser.usage, error: e.message);
  } on FileSystemException catch (e) {
    printUsage(parser.usage, error: '${e.path}: ${e.message}');
  }
}
