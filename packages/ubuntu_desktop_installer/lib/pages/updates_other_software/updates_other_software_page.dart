import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'updates_other_software_model.dart';

export 'updates_other_software_model.dart'
    show kNormalSourceId, kMinimalSourceId;

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
      ),
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
      content: ListView(
        children: [
          Padding(
            padding: kHeaderPadding.copyWith(bottom: kContentSpacing),
            child: Text(lang.updatesOtherSoftwarePageDescription),
          ),
          ...model.sources
              .map((source) => Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: YaruRadioButton<String>(
                      title: Text(source.localizeTitle(context)),
                      subtitle: Text(source.localizeSubtitle(context)),
                      contentPadding: kContentPadding,
                      value: source.id,
                      groupValue: model.sourceId,
                      onChanged: model.setSourceId,
                    ),
                  ))
              .withSpacing(kContentSpacing)
              .toList(),
          Padding(
            padding: kHeaderPadding.copyWith(bottom: kContentSpacing),
            child: Text(lang.otherOptions),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: YaruCheckButton(
              title: Text(lang.installDriversTitle),
              subtitle: Text(lang.installDriversSubtitle),
              contentPadding: kContentPadding,
              value: model.installDrivers,
              onChanged: model.setInstallDrivers,
            ),
          ),
          const SizedBox(height: kContentSpacing),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Tooltip(
              message: !model.isOnline ? lang.offlineWarning : '',
              child: YaruCheckButton(
                title: Text(lang.installCodecsTitle),
                subtitle: Text(lang.installCodecsSubtitle),
                contentPadding: kContentPadding,
                value: model.installCodecs && model.isOnline,
                onChanged: model.isOnline ? model.setInstallCodecs : null,
              ),
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
      bottomBar: WizardBar(
        leading: WizardAction.back(context),
        trailing: [
          WizardAction.next(
            context,
            enabled: model.sourceId != null,
            onNext: () async {
              final telemetry = getService<TelemetryService>();
              await telemetry.addMetrics({
                'Minimal': model.sourceId?.contains('minimal') == true,
                'RestrictedAddons': model.installCodecs,
              });
              await model.save();
            },
          ),
        ],
      ),
    );
  }
}

extension on Iterable<Widget> {
  List<Widget> withSpacing(double spacing) {
    return expand((item) sync* {
      yield SizedBox(width: spacing, height: spacing);
      yield item;
    }).skip(1).toList();
  }
}

extension on SourceSelection {
  String localizeTitle(BuildContext context) {
    switch (id) {
      case kNormalSourceId:
        return AppLocalizations.of(context).normalInstallationTitle;
      case kMinimalSourceId:
        return AppLocalizations.of(context).minimalInstallationTitle;
      default:
        return name;
    }
  }

  String localizeSubtitle(BuildContext context) {
    switch (id) {
      case kNormalSourceId:
        return AppLocalizations.of(context).normalInstallationSubtitle;
      case kMinimalSourceId:
        return AppLocalizations.of(context).minimalInstallationSubtitle;
      default:
        return description;
    }
  }
}
