import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';

import 'app.dart';
import 'keyboard_model.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  final subiquityClient = SubiquityClient();
  subiquityClient.open('/run/subiquity/socket');

  WidgetsFlutterBinding.ensureInitialized();
  await setupAppLocalizations();
  runApp(MultiProvider(
    providers: [
      Provider(
          create: (_) => subiquityClient,
          lazy: false,
          dispose: (_, __) {
            subiquityClient.close();
          }),
      ChangeNotifierProvider(create: (_) => KeyboardModel()),
    ],
    child: UbuntuDesktopInstallerApp(),
  ));
}
