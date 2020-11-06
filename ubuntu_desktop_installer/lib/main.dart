import 'package:flutter/material.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:yaru/yaru.dart';

import 'welcomepage.dart';
import 'tryorinstallpage.dart';

void main() {
  runApp(UbuntuDesktopInstallerApp());
}

class UbuntuDesktopInstallerApp extends StatelessWidget {
  final SubiquityClient _client = SubiquityClient();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ubuntu Desktop Installer',
      theme: yaruLightTheme,
      debugShowCheckedModeBanner: false,
      home: WelcomePage(client: _client),
      routes: <String, WidgetBuilder>{
        '/tryorinstall': (BuildContext context) =>
            TryOrInstallPage(client: _client),
      },
    );
  }
}
