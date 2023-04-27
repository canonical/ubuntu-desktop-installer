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

import 'installation_type_dialogs.dart';
import 'installation_type_model.dart';

export 'installation_type_model.dart' show AdvancedFeature, InstallationType;

/// Select between guided and manual partitioning.
class InstallationTypePage extends StatefulWidget {
  /// Use [InstallationTypePage.create] instead.
  @visibleForTesting
  const InstallationTypePage({super.key});

  /// Creates a [InstallationTypePage] with [InstallationTypeModel].
  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InstallationTypeModel(
        getService<DiskStorageService>(),
        getService<TelemetryService>(),
        getService<ProductService>(),
      ),
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
        return os.hasDuplicates
            ? lang.installationTypeMultiOSDetected
            : lang.installationTypeDualOSDetected(os.first.long, os.last.long);
      default:
        return lang.installationTypeMultiOSDetected;
    }
  }

  static String _formatAlongside(
      AppLocalizations lang, ProductInfo info, List<OsProber> os) {
    final product = [info.name, info.version].whereType<String>().join(' ');
    switch (os.length) {
      case 0:
        return lang.installationTypeAlongsideUnknown(product);
      case 1:
        return lang.installationTypeAlongside(product, os.single.long);
      case 2:
        return os.hasDuplicates
            ? lang.installationTypeAlongsideMulti(product)
            : lang.installationTypeAlongsideDual(
                product, os.first.long, os.last.long);
      default:
        return lang.installationTypeAlongsideMulti(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InstallationTypeModel>(context);
    final lang = AppLocalizations.of(context);
    final flavor = Flavor.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.installationTypeTitle),
      ),
      header: Text(_formatHeader(context, model.existingOS ?? [])),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: offer "reinstall" when subiquity has support for it
          // if (model.existingOS != null)
          //   YaruRadioButton<InstallationType>(
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
          if (model.canInstallAlongside || model.hasBitLocker)
            Padding(
              padding: const EdgeInsets.only(bottom: kContentSpacing),
              child: YaruRadioButton<InstallationType>(
                title: Text(_formatAlongside(
                    lang, model.productInfo, model.existingOS ?? [])),
                subtitle: Text(lang.installationTypeAlongsideInfo),
                value: model.canInstallAlongside
                    ? InstallationType.alongside
                    : InstallationType.bitlocker, // for instructions
                groupValue: model.installationType,
                onChanged: (v) => model.installationType = v!,
              ),
            ),
          YaruRadioButton<InstallationType>(
            title: Text(lang.installationTypeErase(flavor.name)),
            subtitle: Html(
              data: lang.installationTypeEraseWarning(
                  Theme.of(context).colorScheme.error.toHex()),
              style: {'body': Style(margin: Margins.zero)},
            ),
            value: InstallationType.erase,
            groupValue: model.installationType,
            onChanged: (value) => model.installationType = value!,
          ),
          const SizedBox(height: kContentSpacing),
          Padding(
            padding: kContentIndentation,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                OutlinedButton(
                  onPressed: model.installationType == InstallationType.erase
                      ? () => showAdvancedFeaturesDialog(context, model)
                      : null,
                  child: Text(lang.installationTypeAdvancedLabel),
                ),
                const SizedBox(width: kContentSpacing),
                Text(model.advancedFeature.localize(lang, model.encryption)),
              ],
            ),
          ),
          const SizedBox(height: kContentSpacing),
          YaruRadioButton<InstallationType>(
            title: Text(lang.installationTypeManual),
            subtitle: Text(lang.installationTypeManualInfo(flavor.name)),
            value: InstallationType.manual,
            groupValue: model.installationType,
            onChanged: (v) => model.installationType = v!,
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardAction.back(context, root: true),
        trailing: [
          WizardAction.next(
            context,
            root: model.isDone,
            enabled: model.hasStorage,
            arguments: model.installationType,
            onNext: model.save,
            // If the user returns back to select another installation type, the
            // previously configured storage must be reset to make all guided
            // partitioning targets available.
            onBack: model.resetStorage,
          ),
        ],
      ),
    );
  }
}

extension _AdvancedFeatureL10n on AdvancedFeature {
  String localize(AppLocalizations lang, bool encryption) {
    switch (this) {
      case AdvancedFeature.none:
        return lang.installationTypeNoneSelected;
      case AdvancedFeature.lvm:
        return encryption
            ? lang.installationTypeLVMEncryptionSelected
            : lang.installationTypeLVMSelected;
      case AdvancedFeature.zfs:
        return lang.installationTypeZFSSelected;
    }
  }
}

extension _OsProberList on List<OsProber> {
  /// Whether the system has any OS installed multiple times.
  bool get hasDuplicates =>
      length > 1 && length != map((os) => os.long).toSet().length;
}
