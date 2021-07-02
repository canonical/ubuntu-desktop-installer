import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gsettings/gsettings.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';

import 'app.dart';
import 'keyboard_model.dart';
import 'l10n/app_localizations.dart';

class AppTheme extends ValueNotifier<ThemeMode> {
  AppTheme(this._settings) : super(ThemeMode.system);
  final GSettings _settings;

  void apply(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        value = ThemeMode.dark;
        _settings.setValue('gtk-theme', 'Yaru-dark');
        break;
      case Brightness.light:
        value = ThemeMode.light;
        _settings.setValue('gtk-theme', 'Yaru');
        break;
    }
    _settings.sync();
  }

  @override
  void dispose() {
    super.dispose();
    _settings.dispose();
  }
}

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
      ChangeNotifierProvider(create: (_) => KeyboardModel()),
    ],
    child: UbuntuDesktopInstallerApp(),
  ));
}
