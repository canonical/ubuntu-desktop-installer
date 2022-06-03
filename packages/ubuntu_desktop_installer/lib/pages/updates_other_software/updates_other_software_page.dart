import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'updates_other_software_model.dart';

class UpdatesOtherSoftwarePage extends StatefulWidget {
  @visibleForTesting
  const UpdatesOtherSoftwarePage({Key? key}) : super(key: key);

  @override
  State<UpdatesOtherSoftwarePage> createState() =>
      _UpdatesOtherSoftwarePageState();

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UpdateOtherSoftwareModel(
          client: getService<SubiquityClient>(),
          power: getService<PowerService>(),
          installationMode: InstallationMode.normal),
      child: const UpdatesOtherSoftwarePage(),
    );
  }
}

class _UpdatesOtherSoftwarePageState extends State<UpdatesOtherSoftwarePage> {
  @override
  void initState() {
    super.initState();
    final model = Provider.of<UpdateOtherSoftwareModel>(context, listen: false);
    model.init();
  }

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
      footer: model.onBattery
          ? Html(
              data: lang.onBatteryWarning(Theme.of(context).errorColor.toHex()),
            )
          : null,
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          onNext: () async {
            final telemetry = getService<TelemetryService>();
            telemetry.setMinimal(
                enabled: model.installationMode == InstallationMode.minimal);
            telemetry.setRestrictedAddons(enabled: model.installThirdParty);
            await model.selectInstallationSource();
          },
        ),
      ],
    );
  }
}
