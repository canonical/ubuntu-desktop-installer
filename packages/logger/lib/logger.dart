import 'dart:io';

import 'package:collection/collection.dart';
import 'package:logging/logging.dart' as log;
import 'package:logging_appenders/logging_appenders.dart';
import 'package:path/path.dart' as p;

// ignore: avoid_classes_with_only_static_members
/// Defines available logging levels.
abstract class LogLevel {
  /// All messages, including debug output.
  static const debug = log.Level('DEBUG', 0);

  /// Info, warning, and error messages.
  static const info = log.Level('INFO', 1);

  /// Warning and error messages only.
  static const warning = log.Level('WARNING', 2);

  /// Error messages only.
  static const error = log.Level('ERROR', 3);

  /// No logging output.
  static const none = log.Level('NONE', 99);

  /// Resolves logging level from a string.
  static log.Level? fromString(String? level) {
    const levels = <log.Level>[debug, info, warning, error];
    return levels.firstWhereOrNull((l) {
      return l.name.toLowerCase() == level?.toLowerCase();
    });
  }
}

PrintAppender? _consoleLog;
RotatingFileAppender? _fileLog;

/// A logger that prints to the console and writes to a log file.
class Logger {
  /// Creates a named logger.
  Logger(String name) : _logger = log.Logger(name);

  final log.Logger _logger;

  /// Setup logging with the given level and log file path.
  static void setup({
    String? path,
    log.Level? level,
  }) {
    if (level != null) {
      log.Logger.root.level = level;
    }

    // console output
    if (_consoleLog == null) {
      _consoleLog =
          PrintAppender(formatter: const _LogFormatter(verbose: false));
      _consoleLog!.attachToLogger(log.Logger.root);
    }

    // log file
    if (path != null) {
      final appName = p.basenameWithoutExtension(path);
      try {
        _createDirectory(p.dirname(path));

        if (_fileLog == null) {
          _fileLog = RotatingFileAppender(
            baseFilePath: '$path.$pid',
            formatter: const _LogFormatter(verbose: true),
          );
          _fileLog!.attachToLogger(log.Logger.root);

          _createSymlink(path, _fileLog!.baseFilePath);
        }

        _consoleLog!
            .handle(log.LogRecord(LogLevel.info, 'Logging to $path', appName));
      } on FileSystemException catch (e) {
        _consoleLog!.handle(log.LogRecord(
            LogLevel.error, 'Logging to $path failed (${e.message})', appName));
      }
    }
  }

  /// Outputs a debug [message].
  void debug(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.debug, message, error, stackTrace);
  }

  /// Outputs an info [message].
  void info(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.info, message, error, stackTrace);
  }

  /// Outputs a warning [message].
  void warning(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.warning, message, error, stackTrace);
  }

  /// Outputs an error [message].
  void error(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.error, message, error, stackTrace);
  }

  void _log(log.Level level, Object? message,
      [Object? error, StackTrace? stackTrace]) {
    _logger.log(level, message, error, stackTrace);
  }
}

class _LogFormatter extends LogRecordFormatter {
  const _LogFormatter({this.verbose = true});

  final bool verbose;

  @override
  StringBuffer formatToStringBuffer(log.LogRecord record, StringBuffer buffer) {
    buffer.write(_formatMessage(record));

    if (record.error != null) {
      buffer.writeln();
      buffer.write('\t${record.error?.runtimeType}: ');
      buffer.write(record.error);
    }

    // ignore: avoid_as
    final stackTrace = record.stackTrace ??
        (record.error is Error ? (record.error as Error).stackTrace : null);
    if (stackTrace != null) {
      buffer.writeln();
      buffer.write(stackTrace);
    }
    return buffer;
  }

  String _formatMessage(log.LogRecord record) {
    final message =
        '${record.level.name} ${record.loggerName}: ${record.message}';
    if (verbose) {
      return '${record.time} $message';
    }
    return message;
  }
}

void _createDirectory(String path) {
  final dir = Directory(path);
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }
}

void _createSymlink(String source, String target) {
  final symlink = Link(source);
  if (symlink.existsSync()) {
    symlink.deleteSync();
  }
  symlink.createSync(target);
}
