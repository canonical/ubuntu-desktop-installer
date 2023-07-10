import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';

enum JournalOutput {
  /// The default and generates an output that is mostly identical to the
  /// formatting of classic syslog files, showing one line per journal entry.
  short,

  /// A very terse output, only showing the actual message of each journal entry
  /// with no metadata, not even a timestamp
  cat,
}

/// Provides `journalctl` output.
class JournalService {
  /// Starts a `journalctl` process.
  Stream<String> start(
    List<String> ids, {
    JournalOutput output = JournalOutput.short,
  }) async* {
    final process = await Process.start(
      'journalctl',
      [
        '--follow',
        '--no-pager',
        '--no-tail',
        for (final id in ids) '--identifier=$id',
        '--output=${output.name}'
      ],
      environment: {'SYSTEMD_COLORS': '0'},
    );
    try {
      yield* StreamGroup.mergeBroadcast([
        process.stdout
            .transform<String>(utf8.decoder)
            .transform<String>(const LineSplitter()),
        process.stderr
            .transform<String>(utf8.decoder)
            .transform<String>(const LineSplitter()),
      ]);
    } finally {
      process.kill();
    }
  }
}
