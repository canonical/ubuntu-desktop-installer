import 'dart:convert';

import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_provision/src/services/telemetry_service.dart';

void main() {
  test('report is created on disk when initialized', () async {
    final fs = MemoryFileSystem.test();
    final telemetry = TelemetryService('foo.json', fs: fs);
    final report = fs.file('foo.json');
    expect(report.existsSync(), isFalse);
    await telemetry.init({'foo': 'bar'});
    expect(report.existsSync(), isTrue);
    final data = json.decode(report.readAsStringSync());
    expect(data['foo'], 'bar');
  });

  test('add stages', () async {
    final fs = MemoryFileSystem.test();
    final telemetry = TelemetryService('/tmp/telemetry.json', fs: fs);

    await telemetry.init({'foo': 'bar'});
    await telemetry.addStage('qux');

    final report = fs.file('/tmp/telemetry.json');
    expect(report.existsSync(), isTrue);

    final data = json.decode(report.readAsStringSync());
    expect(data['foo'], 'bar');

    final stages = data['Stages'] as Map<String, dynamic>;
    expect(stages.length, 1);
    expect(int.tryParse(stages.keys.single), isNonNegative);
    expect(stages.values.single, 'qux');
  });

  test('add metrics', () async {
    final fs = MemoryFileSystem.test();
    final report = fs.file('foo.json');

    final telemetry = TelemetryService('foo.json', fs: fs);
    await telemetry.init({'baz': 'qux'});

    await telemetry.addMetric('Language', 'fr');
    expect(json.decode(report.readAsStringSync()), {
      'baz': 'qux',
      'Language': 'fr',
    });

    await telemetry.addMetric('Minimal', true);
    expect(json.decode(report.readAsStringSync()), {
      'baz': 'qux',
      'Language': 'fr',
      'Minimal': true,
    });

    await telemetry.addMetrics({
      'RestrictedAddons': false,
      'PartitionMethod': 'reinstall_partition',
    });
    expect(json.decode(report.readAsStringSync()), {
      'baz': 'qux',
      'Language': 'fr',
      'Minimal': true,
      'RestrictedAddons': false,
      'PartitionMethod': 'reinstall_partition'
    });
  });
}
