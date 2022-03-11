import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/services.dart';

import 'wizard_app_test.mocks.dart';

@GenerateMocks([IOSink, SubiquityStatusMonitor])
void main() {
  tearDown(() => unregisterMockService<SubiquityClient>());

  testWidgets('initializes subiquity', (tester) async {
    final client = MockSubiquityClient();
    final server = MockSubiquityServer();
    when(server.start(any,
            args: anyNamed('args'), environment: anyNamed('environment')))
        .thenAnswer((_) async => 'socket path');

    await runWizardApp(
      Container(),
      subiquityClient: client,
      subiquityServer: server,
      serverArgs: ['--foo', 'bar'],
      serverEnvironment: {'baz': 'qux'},
      onInitSubiquity: (client) => client.setVariant(Variant.DESKTOP),
    );
    verify(server.start(ServerMode.DRY_RUN,
        args: ['--foo', 'bar'], environment: {'baz': 'qux'})).called(1);
    verify(client.open('socket path')).called(1);
    verify(client.setVariant(Variant.DESKTOP)).called(1);
  });

  testWidgets('registers the client', (tester) async {
    final client = MockSubiquityClient();
    final server = MockSubiquityServer();
    when(server.start(any,
            args: anyNamed('args'), environment: anyNamed('environment')))
        .thenAnswer((_) async => '');

    await runWizardApp(
      SizedBox(),
      subiquityClient: client,
      subiquityServer: server,
    );

    expect(getService<SubiquityClient>(), equals(client));
  });

  testWidgets('parse command-line arguments', (tester) async {
    int? didExit;
    final out = MockIOSink();

    final dryRun = parseCommandLine(
      ['--dry-run'],
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
    parseCommandLine(
      ['unknown rest arguments'],
      out: out,
      exit: (exitCode) => didExit = exitCode,
    );
    expect(didExit, equals(1));
  });

  testWidgets('starts and registers the monitor', (tester) async {
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.start('/tmp/subiquity.sock')).thenAnswer((_) async => true);

    final server = MockSubiquityServer();
    when(server.start(any,
            args: anyNamed('args'), environment: anyNamed('environment')))
        .thenAnswer((_) async => '/tmp/subiquity.sock');

    await runWizardApp(
      SizedBox(),
      subiquityServer: server,
      subiquityMonitor: monitor,
      subiquityClient: MockSubiquityClient(),
    );

    expect(getService<SubiquityStatusMonitor>(), equals(monitor));
    verify(monitor.start('/tmp/subiquity.sock')).called(1);
  });
}
