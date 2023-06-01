import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';

void main() {
  final endpoint = Endpoint.unix('socket path');

  setUpAll(() {
    const methodChannel = MethodChannel('yaru_window');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(methodChannel, (call) => null);
  });

  testWidgets('app structure', (tester) async {
    await tester.pumpWidget(WizardApp(
      appName: 'wizard_app_test',
      localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
      supportedLocales: UbuntuLocalizations.supportedLocales,
      home: const Text('home'),
    ));

    expect(find.byType(InheritedLocale), findsOneWidget);
    expect(find.byType(Flavor), findsOneWidget);
    expect(find.byType(YaruTheme), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);

    final widget = tester.widget<WizardApp>(find.byType(WizardApp));
    expect(widget.appName, equals('wizard_app_test'));
    expect(widget.flavor.name, equals('Ubuntu'));
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
