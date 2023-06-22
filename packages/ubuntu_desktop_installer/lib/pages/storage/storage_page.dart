import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'storage_dialogs.dart';
import 'storage_model.dart';

export 'storage_model.dart' show AdvancedFeature, StorageType;

/// Select between guided and manual partitioning.
class StoragePage extends ConsumerWidget {
  const StoragePage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return ref.read(storageModelProvider.notifier).init().then((_) => true);
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
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(storageModelProvider);
    final lang = AppLocalizations.of(context);
    final flavor = ref.watch(flavorProvider);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.installationTypeTitle),
      ),
      header: Text(_formatHeader(context, model.existingOS ?? [])),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (model.canInstallAlongside || model.hasBitLocker)
            Padding(
              padding: const EdgeInsets.only(bottom: kContentSpacing),
              child: YaruRadioButton<StorageType>(
                title: Text(_formatAlongside(
                    lang, model.productInfo, model.existingOS ?? [])),
                subtitle: Text(lang.installationTypeAlongsideInfo),
                value: StorageType.alongside,
                groupValue: model.type,
                onChanged: (v) => model.type = v!,
              ),
            ),
          YaruRadioButton<StorageType>(
            title: Text(lang.installationTypeErase(flavor.name)),
            subtitle: Html(
              data: lang.installationTypeEraseWarning(
                  Theme.of(context).colorScheme.error.toHex()),
              style: {'body': Style(margin: Margins.zero)},
            ),
            value: StorageType.erase,
            groupValue: model.type,
            onChanged: (value) => model.type = value!,
          ),
          const SizedBox(height: kContentSpacing),
          Padding(
            padding: kContentIndentation,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                OutlinedButton(
                  onPressed: model.type == StorageType.erase
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
          YaruRadioButton<StorageType>(
            title: Text(lang.installationTypeManual),
            subtitle: Text(lang.installationTypeManualInfo(flavor.name)),
            value: StorageType.manual,
            groupValue: model.type,
            onChanged: (v) => model.type = v!,
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            enabled: model.hasStorage,
            arguments: model.type,
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
