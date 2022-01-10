import 'dart:convert';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/widgets.dart';
import 'package:system_clock/system_clock.dart';

class TelemetryService {
  TelemetryService() : _startTime = _uptime();

  static const reportLocation = '/target/var/log/installer/telemetry';

  final int _startTime;
  final Map<String, dynamic> _metrics = {};
  final Map<String, String> _stages = {};
  bool _done = false;

  static int _uptime() {
    try {
      return SystemClock.uptime().inSeconds;
      // ignore: avoid_catching_errors
    } on ArgumentError catch (__) {
      // See https://github.com/boyan01/system_clock/issues/5
      return DateTime.now().millisecondsSinceEpoch ~/ 1000;
    }
  }

  int _timestamp() {
    return _uptime() - _startTime;
  }

  void addStage(String name) {
    _stages[_timestamp().toString()] = name;
  }

  void setLanguage(String language) {
    _metrics['Language'] = language;
  }

  void setMinimal({required bool enabled}) {
    _metrics['Minimal'] = enabled;
  }

  void setRestrictedAddons({required bool enabled}) {
    _metrics['RestrictedAddons'] = enabled;
  }

  void setPartitionMethod(String method) {
    _metrics['PartitionMethod'] = method;
  }

  Future<void> done({
    @visibleForTesting FileSystem fs = const LocalFileSystem(),
  }) async {
    assert(!_done);
    _done = true;
    addStage('done');
    _metrics['Type'] = 'Flutter';
    _metrics['OEM'] = false;
    _metrics['Stages'] = _stages;
    final file = fs.file(reportLocation);
    await file.parent.create(recursive: true);
    await file.writeAsString(json.encode(_metrics), flush: true);
  }
}
