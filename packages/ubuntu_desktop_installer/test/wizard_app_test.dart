import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_desktop_installer/app.dart';

import 'wizard_app_test.mocks.dart';

@GenerateMocks([SubiquityClient, SubiquityServer])
void main() {
  testWidgets('initializes subiquity', (tester) async {
    final client = MockSubiquityClient();
    final server = MockSubiquityServer();
    when(server.start(any, any)).thenAnswer((_) async => 'socket path');

    await runWizardApp(
      Container(),
      subiquityClient: client,
      subiquityServer: server,
      serverMode: ServerMode.DRY_RUN,
      serverArgs: ['--foo', 'bar'],
    );
    verify(server.start(ServerMode.DRY_RUN, ['--foo', 'bar'])).called(1);
    verify(client.open('socket path')).called(1);
  });

  testWidgets('provides the client', (tester) async {
    final server = MockSubiquityServer();
    when(server.start(any, any)).thenAnswer((_) async => '');

    await runWizardApp(
      Container(key: ValueKey('app')),
      subiquityClient: MockSubiquityClient(),
      subiquityServer: server,
      serverMode: ServerMode.DRY_RUN,
    );

    final app = find.byKey(ValueKey('app'));
    expect(app, findsOneWidget);

    final context = tester.element(app);
    expect(context.read<SubiquityClient>(), isNotNull);
  });
}
