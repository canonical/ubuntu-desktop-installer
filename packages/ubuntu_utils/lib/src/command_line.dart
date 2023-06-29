import 'dart:io' as io;

import 'package:args/args.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

/// Parses the given command line [args].
ArgResults? parseCommandLine(
  List<String> args, {
  void Function(ArgParser)? onPopulateOptions,
  @visibleForTesting io.IOSink? out,
  @visibleForTesting void Function(int exitCode) exit = io.exit,
}) {
  final parser = ArgParser();
  parser.addFlag('help', abbr: 'h', negatable: false);
  onPopulateOptions?.call(parser);

  ArgResults? options;
  try {
    options = parser.parse(args);
  } on FormatException catch (e) {
    _printUsage(parser.usage, error: e.message, out: out, exit: exit);
  }
  if (options?['help'] == true) {
    _printUsage(parser.usage, out: out, exit: exit);
  }
  return options;
}

void _printUsage(
  String options, {
  String? error,
  io.IOSink? out,
  required void Function(int exitCode) exit,
}) {
  final hasError = error?.isNotEmpty == true;
  out ??= hasError ? io.stderr : io.stdout;
  if (hasError) {
    out.write('Error: $error\n\n');
  }
  final executable = p.basename(io.Platform.resolvedExecutable);
  out.write('Usage: $executable [options]\n\n');
  out.write('Options:\n$options\n');
  exit(hasError ? 1 : 0);
}
