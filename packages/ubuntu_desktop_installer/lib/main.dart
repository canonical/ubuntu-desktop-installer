import 'dart:io';

import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsettings/gsettings.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';

import 'app.dart';
import 'app_theme.dart';
import 'disk_storage_model.dart';
import 'keyboard_service.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  final themeSettings = GSettings(schemaId: 'org.gnome.desktop.interface');
  final subiquityClient = SubiquityClient();
  final subiquityServer = SubiquityServer();

  if (Platform.environment['LIVE_RUN'] == '1') {
    await subiquityServer.start(ServerMode.LIVE).then(subiquityClient.open);
  } else {
    await subiquityServer
        .start(ServerMode.DRY_RUN, 'examples/simple.json')
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

  // Define a default identity until a UI page is implemented
  // for it.
  final identity = IdentityData(
      realname: 'Ubuntu',
      username: 'ubuntu',
      cryptedPassword: Crypt.sha512('ubuntu').toString(),
      hostname: 'ubuntu-desktop');
  subiquityClient.setIdentity(identity);

  WidgetsFlutterBinding.ensureInitialized();
  await setupAppLocalizations();

  final eventChannel = EventChannel('ubuntu-desktop-installer');
  eventChannel.receiveBroadcastStream().listen((event) async {
    switch (event) {
      case 'deleteEvent':
        await subiquityClient.close();
        await subiquityServer.stop();
        break;
      default:
        print('Warning: event $event ignored');
    }
  });

  runApp(MultiProvider(
    providers: [
      Provider.value(value: subiquityClient),
      ChangeNotifierProvider(
        create: (_) => AppTheme(themeSettings),
      ),
      ChangeNotifierProvider(create: (_) => DiskStorageModel(subiquityClient)),
      Provider(create: (_) => KeyboardService()),
    ],
    child: UbuntuDesktopInstallerApp(),
  ));
}
