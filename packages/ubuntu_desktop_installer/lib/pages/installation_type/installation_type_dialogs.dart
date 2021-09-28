import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'installation_type_model.dart';

/// Shows a dialog to select advanced installation features.
Future<void> showAdvancedFeaturesDialog(
    BuildContext context, InstallationTypeModel model) async {
  final advancedFeature = ValueNotifier(model.advancedFeature);
  final encryption = ValueNotifier(model.encryption);

  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      final lang = AppLocalizations.of(context);

      return AlertDialog(
        title: Text(lang.installationTypeAdvancedTitle),
        titlePadding: kHeaderPadding,
        contentPadding: kContentPadding.copyWith(
            top: kContentSpacing, bottom: kContentSpacing),
        actionsPadding: kFooterPadding,
        buttonPadding: EdgeInsets.zero,
        scrollable: true,
        content: AnimatedBuilder(
          animation: Listenable.merge([advancedFeature, encryption]),
          builder: (context, child) {
            return Column(
              children: <Widget>[
                RadioButton<AdvancedFeature>(
                  title: Text(lang.installationTypeNone),
                  value: AdvancedFeature.none,
                  groupValue: advancedFeature.value,
                  onChanged: (v) => advancedFeature.value = v!,
                ),
                const SizedBox(height: kContentSpacing),
                RadioButton<AdvancedFeature>(
                  title: Text(lang.installationTypeLVM),
                  value: AdvancedFeature.lvm,
                  groupValue: advancedFeature.value,
                  onChanged: (v) => advancedFeature.value = v!,
                ),
                RadioIconTile(
                  contentPadding: EdgeInsets.zero,
                  title: CheckButton(
                    title: Text(lang.installationTypeEncrypt),
                    subtitle: Text(lang.installationTypeEncryptInfo),
                    value: encryption.value,
                    onChanged: model.advancedFeature == AdvancedFeature.lvm
                        ? (v) => encryption.value = v!
                        : null,
                  ),
                ),
                const SizedBox(height: kContentSpacing),
                RadioButton<AdvancedFeature>(
                  title: Text(lang.installationTypeZFS),
                  value: AdvancedFeature.zfs,
                  groupValue: advancedFeature.value,
                  onChanged: (v) => advancedFeature.value = v!,
                ),
              ],
            );
          },
        ),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(lang.cancelButtonText),
          ),
          const SizedBox(width: kButtonBarSpacing),
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(lang.okButtonText),
          ),
        ],
      );
    },
  );

  if (result == true) {
    model.advancedFeature = advancedFeature.value;
    model.encryption = encryption.value;
  }
}
