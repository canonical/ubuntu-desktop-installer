import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/app.dart';

import 'wizard_app_test.mocks.dart';

@GenerateMocks([IOSink])
void main() {
  testWidgets('initializes subiquity', (tester) async {
    final client = MockSubiquityClient();
    final server = MockSubiquityServer();
    when(server.start(any, any)).thenAnswer((_) async => 'socket path');

    await runWizardApp(
      Container(),
      subiquityClient: client,
      subiquityServer: server,
      serverArgs: ['--foo', 'bar'],
      variant: Variant.DESKTOP,
    );
    verify(server.start(ServerMode.DRY_RUN, ['--foo', 'bar'])).called(1);
    verify(client.open('socket path')).called(1);
    verify(client.setVariant(Variant.DESKTOP)).called(1);
  });

  testWidgets('provides the client', (tester) async {
    final server = MockSubiquityServer();
    when(server.start(any, any)).thenAnswer((_) async => '');

    await runWizardApp(
      Container(key: ValueKey('app')),
      subiquityClient: MockSubiquityClient(),
      subiquityServer: server,
      variant: Variant.DESKTOP,
    );

    final app = find.byKey(ValueKey('app'));
    expect(app, findsOneWidget);

    final context = tester.element(app);
    expect(context.read<SubiquityClient>(), isNotNull);
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
}
