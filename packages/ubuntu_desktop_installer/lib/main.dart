import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gsettings/gsettings.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';

import 'app.dart';
import 'app_theme.dart';
import 'disk_storage_model.dart';
import 'keyboard_model.dart';
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

  WidgetsFlutterBinding.ensureInitialized();
  await setupAppLocalizations();
  runApp(MultiProvider(
    providers: [
      Provider(
          create: (_) => subiquityClient,
          lazy: false,
          dispose: (_, __) {
            subiquityClient.close();
            subiquityServer.stop();
          }),
      ChangeNotifierProvider(
        create: (_) => AppTheme(themeSettings),
      ),
      ChangeNotifierProvider(create: (_) => DiskStorageModel(subiquityClient)),
      ChangeNotifierProvider(create: (_) => KeyboardModel()),
    ],
    child: UbuntuDesktopInstallerApp(),
  ));
}
