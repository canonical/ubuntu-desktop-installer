import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/app.dart';

import 'wizard_app_test.mocks.dart';

@GenerateMocks([IOSink])
void main() {
  final endpoint = Endpoint.unix('socket path');

  setUpAll(() {
    const methodChannel = MethodChannel('yaru_window');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(methodChannel, (call) => null);
  });

  testWidgets('initializes subiquity', (tester) async {
    final client = MockSubiquityClient();
    final server = MockSubiquityServer();
    when(server.start(
            args: anyNamed('args'), environment: anyNamed('environment')))
        .thenAnswer((_) async => endpoint);

    await runWizardApp(
      Container(),
      subiquityClient: client,
      subiquityServer: server,
      serverArgs: ['--foo', 'bar'],
      serverEnvironment: {'baz': 'qux'},
    );
    verify(server.start(args: ['--foo', 'bar'], environment: {'baz': 'qux'}))
        .called(1);
    verify(client.open(endpoint)).called(1);
  });

  testWidgets('does not register services', (tester) async {
    final client = MockSubiquityClient();
    final server = MockSubiquityServer();
    when(server.start(
            args: anyNamed('args'), environment: anyNamed('environment')))
        .thenAnswer(
      (_) async => Endpoint.unix(''),
    );
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.start(any)).thenAnswer((_) async => true);

    await runWizardApp(
      const SizedBox(),
      subiquityClient: client,
      subiquityServer: server,
      subiquityMonitor: monitor,
    );

    expect(tryGetService<SubiquityClient>(), isNull);
    expect(tryGetService<SubiquityServer>(), isNull);
    expect(tryGetService<SubiquityStatusMonitor>(), isNull);
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
    final rest = parseCommandLine(
      ['--', 'subiquity', 'arguments'],
      out: out,
      exit: (exitCode) => didExit = exitCode,
    )?.rest;
    expect(didExit, isNull);
    expect(rest, ['subiquity', 'arguments']);
  });

  testWidgets('starts the monitor', (tester) async {
    final endpoint = Endpoint.unix('/tmp/subiquity.sock');
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.start(endpoint)).thenAnswer((_) async => true);

    final server = MockSubiquityServer();
    when(server.start(
            args: anyNamed('args'), environment: anyNamed('environment')))
        .thenAnswer((_) async => endpoint);

    await runWizardApp(
      const SizedBox(),
      subiquityServer: server,
      subiquityMonitor: monitor,
      subiquityClient: MockSubiquityClient(),
    );

    verify(monitor.start(endpoint)).called(1);
  });

  testWidgets('does not mark UI-specific pages configured', (tester) async {
    final client = MockSubiquityClient();
    final server = MockSubiquityServer();
    when(server.start(
            args: anyNamed('args'), environment: anyNamed('environment')))
        .thenAnswer(
      (_) async => Endpoint.unix(''),
    );

    await runWizardApp(
      const SizedBox(),
      subiquityClient: client,
      subiquityServer: server,
    );

    verifyNever(client.markConfigured(any));
  });

  testWidgets('ensure initialized', (tester) async {
    var windowInit = false;
    const methodChannel = MethodChannel('yaru_window');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(methodChannel, (call) {
      if (call.method == 'init') {
        windowInit = true;
      }
      if (call.method == 'close') {}
      return null;
    });
    final client = MockSubiquityClient();
    final server = MockSubiquityServer();
    when(server.start(
            args: anyNamed('args'), environment: anyNamed('environment')))
        .thenAnswer(
      (_) async => Endpoint.unix(''),
    );

    await runWizardApp(
      const SizedBox(),
      subiquityClient: client,
      subiquityServer: server,
    );

    expect(windowInit, isTrue);
  });
}
