import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';
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
          TooltipBuilder(
            visible: !model.isOnline,
            icon: Icon(YaruIcons.warning_filled,
                color: Theme.of(context).warningColor),
            label: Text(lang.offlineWarning,
                style: TextStyle(color: Theme.of(context).warningColor)),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
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
      footer: model.onBattery
          ? Html(
              data: lang.onBatteryWarning(
                  Theme.of(context).colorScheme.error.toHex()),
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

class TooltipBuilder extends StatelessWidget {
  const TooltipBuilder({
    super.key,
    required this.visible,
    required this.icon,
    required this.label,
    required this.child,
  });

  final bool visible;
  final Widget icon;
  final Widget label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return child;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return JustTheTooltip(
          offset: constraints.maxWidth * 0.5 * (1 - kContentWidthFraction),
          preferredDirection: Directionality.of(context) == TextDirection.rtl
              ? AxisDirection.left
              : AxisDirection.right,
          margin: const EdgeInsets.all(kContentSpacing),
          content: Padding(
            padding: const EdgeInsets.all(kContentSpacing / 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: Directionality.of(context),
              children: [
                icon,
                const SizedBox(width: kContentSpacing),
                Expanded(
                  child: label,
                ),
              ],
            ),
          ),
          child: child,
        );
      },
    );
  }
}
