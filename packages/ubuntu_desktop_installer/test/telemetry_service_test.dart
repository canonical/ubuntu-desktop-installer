import 'dart:convert';

import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/services/telemetry_service.dart';

void main() {
  test('done cannot be called twice', () async {
    final telemetry = TelemetryService();
    await telemetry.done(fs: MemoryFileSystem.test());
    expect(telemetry.done(), throwsAssertionError);
  });

  test('report written to disk', () async {
    final telemetry = TelemetryService();
    final fs = MemoryFileSystem.test();
    final report = fs.file(TelemetryService.reportLocation);
    expect(report.existsSync(), isFalse);
    await telemetry.done(fs: fs);
    expect(report.existsSync(), isTrue);
    final data = json.decode(report.readAsStringSync());
    expect(data.containsKey('Type'), isTrue);
    expect(data['Type'], 'Flutter');
    expect(data.containsKey('Stages'), isTrue);
    expect(data['Stages'].containsValue('done'), isTrue);
  });

  test('specific metrics', () async {
    final telemetry = TelemetryService();
    telemetry.setLanguage('fr');
    telemetry.setMinimal(enabled: true);
    telemetry.setRestrictedAddons(enabled: false);
    telemetry.setPartitionMethod('reinstall_partition');
    final fs = MemoryFileSystem.test();
    await telemetry.done(fs: fs);

    final report = fs.file(TelemetryService.reportLocation);
    final data = json.decode(report.readAsStringSync());
    expect(data.containsKey('Language'), isTrue);
    expect(data['Language'], 'fr');
    expect(data.containsKey('Minimal'), isTrue);
    expect(data['Minimal'], isTrue);
    expect(data.containsKey('RestrictedAddons'), isTrue);
    expect(data['RestrictedAddons'], isFalse);
    expect(data.containsKey('PartitionMethod'), isTrue);
    expect(data['PartitionMethod'], 'reinstall_partition');
  });
}
