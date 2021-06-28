import 'package:flutter/material.dart';
import 'package:ubuntu_desktop_installer/pages/wizard_page.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';

class InstallationCompletePage extends StatelessWidget {
  const InstallationCompletePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => InstallationCompletePage();

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) => WizardPage(
        title: Text(lang.installationCompleteTitle),
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 32),
              child: Image.asset(
                'assets/version.png',
                width: 160,
                height: 160,
              ),
            ),
            Text(
              lang.readyToUse("Ubuntu 20.04"),
              style: Theme.of(context).textTheme.bodyText1,
            ),

          ],
        ),
      ),
    );
  }
}
