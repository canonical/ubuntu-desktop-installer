import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'source_model.dart';

export 'source_model.dart' show kNormalSourceId, kMinimalSourceId;

class SourcePage extends ConsumerWidget {
  const SourcePage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return ref.read(sourceModelProvider).init().then((_) => true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(sourceModelProvider);
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
            padding: const EdgeInsets.all(kYaruPagePadding),
            child: Text(lang.updatesOtherSoftwarePageDescription),
          ),
          ...model.sources
              .map((source) => Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: YaruRadioButton<String>(
                      title: Text(source.localizeTitle(context)),
                      subtitle: Text(source.localizeSubtitle(context)),
                      contentPadding: kWizardPadding,
                      value: source.id,
                      groupValue: model.sourceId,
                      onChanged: model.setSourceId,
                    ),
                  ))
              .withSpacing(kWizardSpacing)
              .toList(),
          Padding(
            padding: const EdgeInsets.all(kYaruPagePadding),
            child: Text(lang.otherOptions),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: YaruCheckButton(
              title: Text(lang.installDriversTitle),
              subtitle: Text(lang.installDriversSubtitle),
              contentPadding: kWizardPadding,
              value: model.installDrivers,
              onChanged: model.setInstallDrivers,
            ),
          ),
          const SizedBox(height: kWizardSpacing),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Tooltip(
              message: !model.isOnline ? lang.offlineWarning : '',
              child: YaruCheckButton(
                title: Text(lang.installCodecsTitle),
                subtitle: Text(lang.installCodecsSubtitle),
                contentPadding: kWizardPadding,
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
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            enabled: model.sourceId != null,
            onNext: () async {
              final telemetry = tryGetService<TelemetryService>();
              await telemetry?.addMetrics({
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
