import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../widgets.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: kHeaderPadding.copyWith(bottom: kContentSpacing),
              child: Text(lang.updatesOtherSoftwarePageDescription),
            ),
            RadioButton<InstallationMode>(
              title: Text(lang.normalInstallationTitle),
              subtitle: Text(lang.normalInstallationSubtitle),
              contentPadding: kContentPadding,
              value: InstallationMode.normal,
              groupValue: model.installationMode,
              onChanged: model.setInstallationMode,
            ),
            const SizedBox(height: kContentSpacing),
            RadioButton<InstallationMode>(
              title: Text(lang.minimalInstallationTitle),
              subtitle: Text(lang.minimalInstallationSubtitle),
              value: InstallationMode.minimal,
              contentPadding: kContentPadding,
              groupValue: model.installationMode,
              onChanged: model.setInstallationMode,
            ),
            Padding(
              padding: kHeaderPadding.copyWith(bottom: kContentSpacing),
              child: Text(lang.otherOptions),
            ),
            CheckButton(
              title: Text(lang.installThirdPartyTitle),
              subtitle: Text(lang.installThirdPartySubtitle),
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
