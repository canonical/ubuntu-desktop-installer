import 'dart:io';
import 'dart:convert';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:stdlibc/stdlibc.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final log = Logger('telemetry');

class TelemetryService {
  TelemetryService({@visibleForTesting FileSystem? fs})
      : _fs = fs ?? const LocalFileSystem(),
        _startTime = _uptime();

  static String get reportLocation {
    if (kDebugMode) {
      final exe = Platform.resolvedExecutable;
      return '${p.dirname(exe)}/.${p.basename(exe)}/telemetry';
    }
    return '/var/log/installer/telemetry';
  }

  final int _startTime;
  final FileSystem _fs;

  static int _uptime() {
    return sysinfo()?.uptime.inSeconds ?? 0;
  }

  int _timestamp() {
    return _uptime() - _startTime;
  }

  Future<void> init([Map<String, dynamic> metrics = const {}]) async {
    final file = _fs.file(reportLocation);
    if (await file.exists()) {
      await file.delete();
    } else {
      await file.parent.create(recursive: true);
    }
    log.debug('Writing report to $reportLocation');
    return _writeMetrics(metrics);
  }

  Future<void> addStage(String name) async {
    final metrics = await _readMetrics();
    final stages = metrics['Stages'] ?? {};
    stages[_timestamp().toString()] = name;
    metrics['Stages'] = stages;
    return _writeMetrics(metrics);
  }

  Future<void> addMetric(String key, dynamic value) {
    return addMetrics({key: value});
  }

  Future<void> addMetrics(Map<String, dynamic> entries) async {
    final metrics = await _readMetrics();
    metrics.addAll(entries);
    return _writeMetrics(metrics);
  }

  Future<Map<String, dynamic>> _readMetrics() async {
    try {
      final file = _fs.file(reportLocation);
      final metrics = await file.readAsString();
      return json.decode(metrics) as Map<String, dynamic>;
    } on FileSystemException {
      return {};
    } on FormatException {
      return {};
    }
  }

  Future<void> _writeMetrics(Map<String, dynamic> metrics) async {
    try {
      final file = _fs.file(reportLocation);
      await file.writeAsString(json.encode(metrics), flush: true);
    } on FileSystemException catch (e) {
      log.error('Failed to write report to $reportLocation (${e.message})');
    }
  }
}
