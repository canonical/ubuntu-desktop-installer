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
import 'installation_type_dialogs.dart';
import 'installation_type_model.dart';

export 'installation_type_model.dart' show InstallationType;

/// Select between guided and manual partitioning.
class InstallationTypePage extends StatefulWidget {
  /// Use [InstallationTypePage.create] instead.
  @visibleForTesting
  const InstallationTypePage({Key? key}) : super(key: key);

  /// Creates a [InstallationTypePage] with [InstallationTypeModel].
  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    final diskService = getService<DiskStorageService>();
    final telemetryService = getService<TelemetryService>();
    return ChangeNotifierProvider(
      create: (context) =>
          InstallationTypeModel(client, diskService, telemetryService),
      child: const InstallationTypePage(),
    );
  }

  @override
  State<InstallationTypePage> createState() => _InstallationTypePageState();
}

class _InstallationTypePageState extends State<InstallationTypePage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<InstallationTypeModel>(context, listen: false);
    model.init();
  }

  static String _formatHeader(BuildContext context, List<OsProber> os) {
    final lang = AppLocalizations.of(context);
    switch (os.length) {
      case 0:
        return lang.installationTypeNoOSDetected;
      case 1:
        return lang.installationTypeOSDetected(os.single.long);
      case 2:
        return lang.installationTypeDualOSDetected(os.first.long, os.last.long);
      default:
        return lang.installationTypeMultiOSDetected;
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InstallationTypeModel>(context);
    final lang = AppLocalizations.of(context);
    final flavor = Flavor.of(context);
    return WizardPage(
      title: Text(lang.installationTypeTitle),
      header: Text(_formatHeader(context, model.existingOS ?? [])),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: offer "reinstall" and "alongside" options
          // if (model.existingOS != null)
          //   RadioButton<InstallationType>(
          //     title: Text(lang.installationTypeReinstall(model.existingOS!)),
          //     subtitle: Html(
          //       data: lang.installationTypeReinstallWarning(
          //           Theme.of(context).errorColor.toHex(), model.existingOS!),
          //       style: {'body': Style(margin: EdgeInsets.zero)},
          //     ),
          //     value: InstallationType.reinstall,
          //     groupValue: model.installationType,
          //     onChanged: (v) => model.installationType = v!,
          //   ),
          // if (model.existingOS != null) const SizedBox(height: kContentSpacing),
          // if (model.existingOS != null)
          //   RadioButton<InstallationType>(
          //     title: Text(lang.installationTypeAlongside(
          //         model.productInfo, model.existingOS!)),
          //     subtitle: Text(lang.installationTypeAlongsideInfo),
          //     value: InstallationType.alongside,
          //     groupValue: model.installationType,
          //     onChanged: (v) => model.installationType = v!,
          //   ),
          // if (model.existingOS != null) const SizedBox(height: kContentSpacing),
          RadioButton<InstallationType>(
            title: Text(lang.installationTypeErase(flavor.name)),
            subtitle: Html(
              data: lang.installationTypeEraseWarning(
                  Theme.of(context).errorColor.toHex()),
              style: {'body': Style(margin: EdgeInsets.zero)},
            ),
            value: InstallationType.erase,
            groupValue: model.installationType,
            onChanged: (value) => model.installationType = value!,
          ),
          const SizedBox(height: kContentSpacing),
          RadioIconTile(
            contentPadding: EdgeInsets.zero,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () => showAdvancedFeaturesDialog(context, model),
                  child: Text(lang.installationTypeAdvancedLabel),
                ),
                const SizedBox(width: kContentSpacing),
                Text(model.advancedFeature == AdvancedFeature.lvm
                    ? lang.installationTypeLVMSelected
                    : model.advancedFeature == AdvancedFeature.zfs
                        ? lang.installationTypeZFSSelected
                        : lang.installationTypeNoneSelected),
              ],
            ),
          ),
          const SizedBox(height: kContentSpacing),
          RadioButton<InstallationType>(
            title: Text(lang.installationTypeManual),
            subtitle: Text(lang.installationTypeManualInfo(flavor.name)),
            value: InstallationType.manual,
            groupValue: model.installationType,
            onChanged: (v) => model.installationType = v!,
          ),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          onActivated: () async {
            await model.save();

            Wizard.of(context).next(arguments: model.installationType);
          },
        ),
      ],
    );
  }
}
