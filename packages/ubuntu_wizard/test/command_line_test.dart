import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:ubuntu_wizard/utils.dart';

import 'command_line_test.mocks.dart';

@GenerateMocks([IOSink])
void main() {
  testWidgets('parse command-line arguments', (tester) async {
    int? didExit;
    final out = MockIOSink();

    final dryRun = parseCommandLine(
      ['--dry-run'],
      onPopulateOptions: (parser) {
        parser.addFlag('dry-run');
      },
      exit: (exitCode) => didExit = exitCode,
    );
    expect(didExit, isNull);
    expect(dryRun, isNotNull);
    expect(dryRun!['dry-run'], isTrue);

    final machineConfig = parseCommandLine(
      ['--machine-config', 'foo.json'],
      onPopulateOptions: (parser) {
        parser.addOption('machine-config');
      },
      exit: (exitCode) => didExit = exitCode,
    );
    expect(didExit, isNull);
    expect(machineConfig, isNotNull);
    expect(machineConfig!['machine-config'], equals('foo.json'));

    parseCommandLine(
      ['--help'],
      out: out,
      exit: (exitCode) => didExit = exitCode,
    );
    expect(didExit, isZero);

    didExit = null;
    parseCommandLine(
      ['--machine-config', 'foo.json'],
      out: out,
      exit: (exitCode) => didExit = exitCode,
    );
    expect(didExit, equals(1));

    didExit = null;
    parseCommandLine(
      ['--unknown-option'],
      out: out,
      exit: (exitCode) => didExit = exitCode,
    );
    expect(didExit, equals(1));

    didExit = null;
    final rest = parseCommandLine(
      ['--', 'subiquity', 'arguments'],
      out: out,
      exit: (exitCode) => didExit = exitCode,
    )?.rest;
    expect(didExit, isNull);
    expect(rest, ['subiquity', 'arguments']);
  });
}
