import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';
import '../../widgets.dart';
import '../../widgets/localized_view.dart';
import '../wizard_page.dart';
import 'updates_other_software_model.dart';

class UpdatesOtherSoftwarePage extends StatefulWidget {
  @override
  _UpdatesOtherSoftwarePageState createState() =>
      _UpdatesOtherSoftwarePageState();

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          UpdateOtherSoftwareModel(installationMode: InstallationMode.normal),
      child: UpdatesOtherSoftwarePage(),
    );
  }
}

class _UpdatesOtherSoftwarePageState extends State<UpdatesOtherSoftwarePage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<UpdateOtherSoftwareModel>();
    return LocalizedView(
      builder: (context, lang) => WizardPage(
        title: Text(lang.updatesOtherSoftwarePageTitle),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(lang.updatesOtherSoftwarePageDescription),
            ),
            RadioListTile<InstallationMode>(
              title: Text(lang.normalInstallationTitle),
              subtitle: Text(lang.normalInstallationSubtitle),
              contentPadding: const EdgeInsets.only(left: 10),
              value: InstallationMode.normal,
              groupValue: model.installationMode,
              onChanged: model.setInstallationMode,
            ),
            RadioListTile<InstallationMode>(
              title: Text(lang.minimalInstallationTitle),
              subtitle: Text(lang.minimalInstallationSubtitle),
              value: InstallationMode.minimal,
              contentPadding: const EdgeInsets.only(left: 10),
              groupValue: model.installationMode,
              onChanged: model.setInstallationMode,
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(lang.otherOptions),
            ),
            CheckboxListTile(
              title: Text(lang.installThirdPartyTitle),
              subtitle: Text(lang.installThirdPartySubtitle),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: const EdgeInsets.only(left: 10),
              value: model.installThirdParty,
              onChanged: model.setInstallThirdParty,
            )
          ],
        ),
        actions: <WizardAction>[
          WizardAction(
            label: lang.backButtonText,
            onActivated: Navigator.of(context).pop,
          ),
          WizardAction(
            label: lang.continueButtonText,
            onActivated: () {
              Navigator.pushNamed(context, Routes.allocateDiskSpace);
            },
          ),
        ],
      ),
    );
  }
}
