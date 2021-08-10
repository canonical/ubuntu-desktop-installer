import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizard_router/wizard_router.dart';

import '../../constants.dart';
import '../../widgets.dart';
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
        headerPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: kHeaderPadding.copyWith(bottom: kContentSpacing / 2),
              child: Text(lang.updatesOtherSoftwarePageDescription),
            ),
            RadioListTile<InstallationMode>(
              title: Text(lang.normalInstallationTitle),
              subtitle: Text(lang.normalInstallationSubtitle),
              contentPadding: kContentPadding,
              value: InstallationMode.normal,
              groupValue: model.installationMode,
              onChanged: model.setInstallationMode,
            ),
            RadioListTile<InstallationMode>(
              title: Text(lang.minimalInstallationTitle),
              subtitle: Text(lang.minimalInstallationSubtitle),
              value: InstallationMode.minimal,
              contentPadding: kContentPadding,
              groupValue: model.installationMode,
              onChanged: model.setInstallationMode,
            ),
            Padding(
              padding: kHeaderPadding.copyWith(bottom: kContentSpacing / 2),
              child: Text(lang.otherOptions),
            ),
            CheckboxListTile(
              title: Text(lang.installThirdPartyTitle),
              subtitle: Text(lang.installThirdPartySubtitle),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: kContentPadding,
              value: model.installThirdParty,
              onChanged: model.setInstallThirdParty,
            )
          ],
        ),
        actions: <WizardAction>[
          WizardAction(
            label: lang.backButtonText,
            onActivated: Wizard.of(context).back,
          ),
          WizardAction(
            label: lang.continueButtonText,
            onActivated: Wizard.of(context).next,
          ),
        ],
      ),
    );
  }
}
