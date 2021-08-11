import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gsettings/gsettings.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';

import 'l10n/app_localizations.dart';
import 'services.dart';
import 'settings.dart';

/// Initializes and runs the given [app].
///
/// Optionally, the Subiquity client] and server may be overridden for building
/// wizard variants and for testing purposes.
Future<void> runWizardApp(
  Widget app, {
  SubiquityClient? subiquityClient,
  SubiquityServer? subiquityServer,
  String? machineConfig,
}) async {
  subiquityClient ??= SubiquityClient();
  subiquityServer ??= SubiquityServer();

  final interfaceSettings = GSettings(schemaId: 'org.gnome.desktop.interface');

  if (Platform.environment['LIVE_RUN'] == '1') {
    await subiquityServer.start(ServerMode.LIVE).then(subiquityClient.open);
  } else {
    await subiquityServer
        .start(ServerMode.DRY_RUN, machineConfig ?? 'examples/simple.json')
        .then(subiquityClient.open);
  }

  // Use the default values for a number of endpoints
  // for which a UI page isn't implemented yet.
  subiquityClient.markConfigured([
    'mirror',
    'proxy',
    'network',
    'ssh',
    'snaplist',
    'timezone',
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  await setupAppLocalizations();

  final eventChannel = EventChannel('ubuntu-desktop-installer');
  eventChannel.receiveBroadcastStream().listen((event) async {
    switch (event) {
      case 'deleteEvent':
        await subiquityClient!.close();
        await subiquityServer!.stop();
        break;
      default:
        print('Warning: event $event ignored');
    }
  });

  runApp(MultiProvider(
    providers: [
      Provider.value(value: subiquityClient),
      ChangeNotifierProvider(create: (_) => Settings(interfaceSettings)),
      Provider(create: (_) => DiskStorageService(subiquityClient!)),
      Provider(create: (_) => KeyboardService()),
    ],
    child: app,
  ));
}
