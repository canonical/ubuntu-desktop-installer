import 'dart:io' as io;

import 'package:args/args.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:ubuntu_logger/ubuntu_logger.dart';

String? get _defaultLogFile => io.Platform.environment['LOG_FILE'];
String? get _defaultLogLevel =>
    io.Platform.environment['LOG_LEVEL'] ?? (kDebugMode ? 'debug' : 'info');

/// Populates the given command line [parser] with logging-related options.
void addLoggingOptions(ArgParser parser) {
  parser.addOption(
    'log-file',
    valueHelp: 'path',
    defaultsTo: _defaultLogFile,
    help: '''
Path of the log file.
Can also be specified in a LOG_FILE environment variable.
''',
  );
  parser.addOption(
    'log-level',
    valueHelp: 'level',
    defaultsTo: _defaultLogLevel,
    help: '''
Available logging levels: "debug", "info", "warning", "error".
Can also be specified in a LOG_LEVEL environment variable.
''',
  );
}

/// Parses the given command line [options] and sets up the logger accordingly.
void setupLogger(ArgResults? options, {String? path}) {
  if (options != null) {
    Logger.setup(
      path: options['log-file'] ?? _resolveLogFile(path),
      level: LogLevel.fromString(options['log-level']),
    );
  }
}

String _resolveLogFile(String? path) {
  final exe = p.basename(io.Platform.resolvedExecutable);
  path ??= '${p.dirname(io.Platform.resolvedExecutable)}/.$exe';
  return '$path/$exe.log';
}
