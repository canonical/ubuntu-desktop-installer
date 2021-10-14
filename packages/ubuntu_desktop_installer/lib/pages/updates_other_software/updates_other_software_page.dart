import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'updates_other_software_model.dart';

class UpdatesOtherSoftwarePage extends StatefulWidget {
  @override
  _UpdatesOtherSoftwarePageState createState() =>
      _UpdatesOtherSoftwarePageState();

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UpdateOtherSoftwareModel(
          client: Provider.of<SubiquityClient>(context, listen: false),
          installationMode: InstallationMode.normal),
      child: UpdatesOtherSoftwarePage(),
    );
  }
}

class _UpdatesOtherSoftwarePageState extends State<UpdatesOtherSoftwarePage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<UpdateOtherSoftwareModel>();
    final lang = AppLocalizations.of(context);
    return WizardPage(
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
          // https://github.com/canonical/ubuntu-desktop-installer/issues/373
          // Padding(
          //   padding: kHeaderPadding.copyWith(bottom: kContentSpacing),
          //   child: Text(lang.otherOptions),
          // ),
          // CheckButton(
          //   title: Text(lang.installThirdPartyTitle),
          //   subtitle: Text(lang.installThirdPartySubtitle),
          //   contentPadding: kContentPadding,
          //   value: model.installThirdParty,
          //   onChanged: model.setInstallThirdParty,
          // )
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          onActivated: () async {
            await model.selectInstallationSource();
            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
