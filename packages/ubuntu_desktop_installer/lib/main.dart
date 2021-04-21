import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';

import 'app.dart';
import 'keyboard_model.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupAppLocalizations();
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => SubiquityClient()),
      ChangeNotifierProvider(create: (_) => KeyboardModel()),
    ],
    child: UbuntuDesktopInstallerApp(),
  ));
}
