import 'package:flutter/material.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../widgets.dart';
import 'installation_type_model.dart';

enum AdvancedFeature { none, lvm, coreBoot }

/// Shows a dialog to select advanced installation features.
Future<void> showAdvancedFeaturesDialog(
    BuildContext context, InstallationTypeModel model) async {
  final defaultCapability = model.guidedCapability;
  final availableCapabilities =
      Set.of(model.guidedTarget?.capabilities ?? <GuidedCapability>[]);

  final hasDirect = availableCapabilities.contains(GuidedCapability.DIRECT);
  final hasLvm = availableCapabilities.any((cap) => cap.isLvm);
  final hasCoreBoot = availableCapabilities.any((cap) => cap.isCoreBoot);
  final hasTpm =
      availableCapabilities.any((cap) => cap.isCoreBoot && cap.canEnrypt);

  final advancedFeature = ValueNotifier(defaultCapability?.toAdvancedFeature());
  final encryption = ValueNotifier(defaultCapability?.isEncrypted);

  bool? isEncrypted() {
    switch (advancedFeature.value) {
      case AdvancedFeature.none:
        return false;
      case AdvancedFeature.lvm:
        return encryption.value;
      case AdvancedFeature.coreBoot:
        if (availableCapabilities
            .contains(GuidedCapability.CORE_BOOT_ENCRYPTED)) return true;
        if (availableCapabilities
            .contains(GuidedCapability.CORE_BOOT_UNENCRYPTED)) return false;
        return encryption.value;
      default:
        return false;
    }
  }

  bool canEncrypt() {
    switch (advancedFeature.value) {
      case AdvancedFeature.none:
        return false;
      case AdvancedFeature.lvm:
        return availableCapabilities.contains(GuidedCapability.LVM_LUKS);
      case AdvancedFeature.coreBoot:
        return availableCapabilities
                .contains(GuidedCapability.CORE_BOOT_PREFER_ENCRYPTED) ||
            availableCapabilities
                .contains(GuidedCapability.CORE_BOOT_PREFER_UNENCRYPTED);
      default:
        return false;
    }
  }

  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      final lang = AppLocalizations.of(context);
      final flavor = Flavor.of(context);

      return AlertDialog(
        title: YaruDialogTitleBar(
          title: Text(lang.installationTypeAdvancedTitle),
        ),
        titlePadding: EdgeInsets.zero,
        contentPadding: kContentPadding.copyWith(
            top: kContentSpacing, bottom: kContentSpacing),
        actionsPadding: kFooterPadding,
        buttonPadding: EdgeInsets.zero,
        scrollable: true,
        content: SizedBox(
          width: 500,
          child: AnimatedBuilder(
            animation: Listenable.merge([advancedFeature, encryption]),
            builder: (context, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  YaruRadioButton<AdvancedFeature>(
                    title: const Text('Default'),
                    subtitle: const Text('Ext4, no encryption available'),
                    value: AdvancedFeature.none,
                    groupValue: advancedFeature.value,
                    onChanged:
                        hasDirect ? (v) => advancedFeature.value = v : null,
                  ),
                  const SizedBox(height: kContentSpacing),
                  YaruRadioButton<AdvancedFeature>(
                    title: Text(lang.installationTypeLVM(flavor.name)),
                    subtitle: const Text('Encryption available'),
                    value: AdvancedFeature.lvm,
                    groupValue: advancedFeature.value,
                    onChanged: hasLvm ? (v) => advancedFeature.value = v : null,
                  ),
                  const SizedBox(height: kContentSpacing),
                  if (hasCoreBoot) ...[
                    YaruRadioButton<AdvancedFeature>(
                      title: const Text('Enhanced secure-boot (Experimental)'),
                      subtitle:
                          const Text('Hardware-backed encryption available'),
                      value: AdvancedFeature.coreBoot,
                      groupValue: advancedFeature.value,
                      onChanged:
                          hasCoreBoot ? (v) => advancedFeature.value = v : null,
                    ),
                    const SizedBox(height: kContentSpacing),
                  ],
                  const Text('Encryption'),
                  const SizedBox(height: kContentSpacing / 2),
                  YaruCheckButton(
                    title: Text(
                      advancedFeature.value != AdvancedFeature.coreBoot
                          ? lang.installationTypeEncrypt(flavor.name)
                          : hasTpm
                              ? 'Hardware-backed full disk encryption'
                              : 'No TPM available',
                    ),
                    subtitle: Text(
                      advancedFeature.value != AdvancedFeature.coreBoot
                          ? lang.installationTypeEncryptInfo
                          : hasTpm
                              ? 'Encrypt the entire disk, protected by the TPM'
                              : 'TPM-backed full disk encryption unavailable',
                    ),
                    value: isEncrypted(),
                    onChanged:
                        canEncrypt() ? (v) => encryption.value = v : null,
                  ),
                ],
              );
            },
          ),
        ),
        actions: [
          PushButton.outlined(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(lang.cancelButtonText),
          ),
          const SizedBox(width: kButtonBarSpacing),
          PushButton.filled(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(lang.okButtonText),
          ),
        ],
      );
    },
  );

  if (result == true) {
    model.guidedCapability =
        advancedFeature.value?.toGuidedCapability(encryption: encryption.value);
  }
}

extension on GuidedCapability {
  bool get canEnrypt =>
      this == GuidedCapability.LVM_LUKS ||
      this == GuidedCapability.CORE_BOOT_ENCRYPTED ||
      this == GuidedCapability.CORE_BOOT_PREFER_ENCRYPTED ||
      this == GuidedCapability.CORE_BOOT_PREFER_UNENCRYPTED;

  bool get isEncrypted =>
      this == GuidedCapability.LVM_LUKS ||
      this == GuidedCapability.CORE_BOOT_ENCRYPTED ||
      this == GuidedCapability.CORE_BOOT_PREFER_ENCRYPTED;

  bool get isLvm =>
      this == GuidedCapability.LVM || this == GuidedCapability.LVM_LUKS;

  bool get isCoreBoot =>
      this == GuidedCapability.CORE_BOOT_ENCRYPTED ||
      this == GuidedCapability.CORE_BOOT_UNENCRYPTED ||
      this == GuidedCapability.CORE_BOOT_PREFER_ENCRYPTED ||
      this == GuidedCapability.CORE_BOOT_PREFER_UNENCRYPTED;

  AdvancedFeature? toAdvancedFeature() {
    switch (this) {
      case GuidedCapability.DIRECT:
        return AdvancedFeature.none;
      case GuidedCapability.LVM:
      case GuidedCapability.LVM_LUKS:
        return AdvancedFeature.lvm;
      case GuidedCapability.CORE_BOOT_ENCRYPTED:
      case GuidedCapability.CORE_BOOT_UNENCRYPTED:
      case GuidedCapability.CORE_BOOT_PREFER_ENCRYPTED:
      case GuidedCapability.CORE_BOOT_PREFER_UNENCRYPTED:
        return AdvancedFeature.coreBoot;
    }
  }
}

extension on AdvancedFeature {
  GuidedCapability toGuidedCapability({bool? encryption}) {
    switch (this) {
      case AdvancedFeature.none:
        return GuidedCapability.DIRECT;
      case AdvancedFeature.lvm:
        return encryption == true
            ? GuidedCapability.LVM_LUKS
            : GuidedCapability.LVM;
      case AdvancedFeature.coreBoot:
        return encryption == true
            ? GuidedCapability.CORE_BOOT_ENCRYPTED
            : GuidedCapability.CORE_BOOT_UNENCRYPTED;
    }
  }
}
