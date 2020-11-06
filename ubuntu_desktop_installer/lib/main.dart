import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

import 'welcomepage.dart';

void main() {
  runApp(UbuntuDesktopInstallerApp());
}

class UbuntuDesktopInstallerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ubuntu Desktop Installer',
      theme: yaruLightTheme,
      home: WelcomePage(title: 'Welcome'),
      debugShowCheckedModeBanner: false,
    );
  }
}
