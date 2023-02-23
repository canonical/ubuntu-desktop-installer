import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'updates_other_software_model.dart';

export 'updates_other_software_model.dart'
    show InstallationMode, InstallationSource;

class UpdatesOtherSoftwarePage extends StatefulWidget {
  @visibleForTesting
  const UpdatesOtherSoftwarePage({super.key});

  @override
  State<UpdatesOtherSoftwarePage> createState() =>
      _UpdatesOtherSoftwarePageState();

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UpdateOtherSoftwareModel(
          client: getService<SubiquityClient>(),
          power: getService<PowerService>(),
          network: getService<NetworkService>(),
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
      title: YaruWindowTitleBar(
        title: Text(lang.updatesOtherSoftwarePageTitle),
      ),
      headerPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kHeaderPadding.copyWith(bottom: kContentSpacing),
            child: Text(lang.updatesOtherSoftwarePageDescription),
          ),
          YaruRadioButton<InstallationMode>(
            title: Text(lang.normalInstallationTitle),
            subtitle: Text(lang.normalInstallationSubtitle),
            contentPadding: kContentPadding,
            value: InstallationMode.normal,
            groupValue: model.installationMode,
            onChanged: model.setInstallationMode,
          ),
          const SizedBox(height: kContentSpacing),
          YaruRadioButton<InstallationMode>(
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
          YaruCheckButton(
            title: Text(lang.installDriversTitle),
            subtitle: Text(lang.installDriversSubtitle),
            contentPadding: kContentPadding,
            value: model.installDrivers,
            onChanged: model.setInstallDrivers,
          ),
          const SizedBox(height: kContentSpacing),
          Tooltip(
            message: !model.isOnline ? lang.offlineWarning : '',
            child: YaruCheckButton(
              title: Text(lang.installCodecsTitle),
              subtitle: Text(lang.installCodecsSubtitle),
              contentPadding: kContentPadding,
              value: model.installCodecs && model.isOnline,
              onChanged: model.isOnline ? model.setInstallCodecs : null,
            ),
          ),
        ],
      ),
      snackBar: model.onBattery
          ? SnackBar(
              width: 500,
              dismissDirection: DismissDirection.none,
              behavior: SnackBarBehavior.floating,
              content: Html(
                style: {
                  'body': Style(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    margin: Margins.zero,
                  ),
                },
                data: lang.onBatteryWarning(
                    Theme.of(context).colorScheme.error.toHex()),
              ),
              duration: const Duration(days: 1),
              showCloseIcon: true,
            )
          : null,
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          onNext: () async {
            final telemetry = getService<TelemetryService>();
            await telemetry.addMetrics({
              'Minimal': model.installationMode == InstallationMode.minimal,
              'RestrictedAddons': model.installCodecs,
            });
            await model.save();
          },
        ),
      ],
    );
  }
}
