import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'installation_type_model.dart';

export 'installation_type_model.dart' show InstallationType;

/// Select between guided and manual partitioning.
class InstallationTypePage extends StatefulWidget {
  /// Use [InstallationTypePage.create] instead.
  @visibleForTesting
  const InstallationTypePage({Key? key}) : super(key: key);

  /// Creates a [InstallationTypePage] with [InstallationTypeModel].
  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    final service = Provider.of<DiskStorageService>(context, listen: false);
    return ChangeNotifierProvider(
      create: (context) => InstallationTypeModel(client, service),
      child: const InstallationTypePage(),
    );
  }

  @override
  _InstallationTypePageState createState() => _InstallationTypePageState();
}

class _InstallationTypePageState extends State<InstallationTypePage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<InstallationTypeModel>(context, listen: false);
    model.init();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InstallationTypeModel>(context);
    final lang = AppLocalizations.of(context);
    final flavor = Flavor.of(context);
    return WizardPage(
      title: Text(lang.installationTypeTitle),
      header: Text(
        model.existingOS == null
            ? lang.installationTypeNoOSDetected
            : lang.installationTypeOSDetected(model.existingOS!),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (model.existingOS != null)
            RadioButton<InstallationType>(
              title: Text(lang.installationTypeReinstall(model.existingOS!)),
              subtitle: Html(
                data: lang.installationTypeReinstallWarning(
                    Theme.of(context).errorColor.toHex(), model.existingOS!),
                style: {'body': Style(margin: EdgeInsets.zero)},
              ),
              value: InstallationType.reinstall,
              groupValue: model.installationType,
              onChanged: (v) => model.installationType = v!,
            ),
          if (model.existingOS != null) const SizedBox(height: kContentSpacing),
          if (model.existingOS != null)
            RadioButton<InstallationType>(
              title: Text(lang.installationTypeAlongside(
                  model.productInfo, model.existingOS!)),
              subtitle: Text(lang.installationTypeAlongsideInfo),
              value: InstallationType.alongside,
              groupValue: model.installationType,
              onChanged: (v) => model.installationType = v!,
            ),
          if (model.existingOS != null) const SizedBox(height: kContentSpacing),
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
          // https://github.com/canonical/ubuntu-desktop-installer/issues/373
          // RadioIconTile(
          //   contentPadding: EdgeInsets.zero,
          //   title: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: <Widget>[
          //       OutlinedButton(
          //         onPressed: () => showAdvancedFeaturesDialog(context, model),
          //         child: Text(lang.installationTypeAdvancedLabel),
          //       ),
          //       const SizedBox(width: kContentSpacing),
          //       Text(model.advancedFeature == AdvancedFeature.lvm
          //           ? lang.installationTypeLVMSelected
          //           : model.advancedFeature == AdvancedFeature.zfs
          //               ? lang.installationTypeZFSSelected
          //               : lang.installationTypeNoneSelected),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: kContentSpacing),
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

            final telemetry = Provider.of<TelemetryService>(context);
            // All possible values for the partition method
            // were extracted from Ubiquity's ubi-partman.py
            // (see PageGtk.get_autopartition_choice()).
            if (model.installationType == InstallationType.erase) {
              telemetry.setPartitionMethod('use_device');
            } else if (model.installationType == InstallationType.reinstall) {
              telemetry.setPartitionMethod('reinstall_partition');
            } else if (model.installationType == InstallationType.alongside) {
              telemetry.setPartitionMethod('resize_use_free');
            } else if (model.installationType == InstallationType.manual) {
              telemetry.setPartitionMethod('manual');
            }
            if (model.advancedFeature == AdvancedFeature.lvm) {
              telemetry.setPartitionMethod('use_lvm');
            } else if (model.advancedFeature == AdvancedFeature.zfs) {
              telemetry.setPartitionMethod('use_zfs');
            }
            final hasEncryption =
                false; // TODO: get this value from _UbuntuDesktopInstallerModel
            if (hasEncryption && model.advancedFeature != AdvancedFeature.zfs) {
              telemetry.setPartitionMethod('use_crypto');
            }
            // TODO: map upgrading the current Ubuntu installation without
            // wiping the user's home directory (not implemented yet)
            // to the 'reuse_partition' method.

            Wizard.of(context).next(arguments: model.installationType);
          },
        ),
      ],
    );
  }
}
