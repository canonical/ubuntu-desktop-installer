import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../widgets.dart';
import 'allocate_disk_space_model.dart';
import 'storage_types.dart';

/// Shows a confirmation dialog with the given title and message.
Future<bool> showConfirmationDialog(
  BuildContext context, {
  required String title,
  required String message,
}) async {
  final lang = UbuntuLocalizations.of(context);
  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: YaruDialogTitleBar(title: Text(title)),
        titlePadding: EdgeInsets.zero,
        content: Text(message),
        actions: <Widget>[
          FilledButton(
            child: Text(lang.backAction),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          FilledButton(
            child: Text(lang.continueAction),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    },
  );
  return result == true;
}

/// Shows a dialog for creating a new partition for the given [disk].
Future<void> showCreatePartitionDialog(
  BuildContext context,
  Disk disk,
  Gap gap,
) {
  final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);

  return showDialog(
    context: context,
    builder: (context) {
      final partitionUnit = ValueNotifier(DataUnit.megabytes);
      final partitionSize = ValueNotifier(gap.size);
      final partitionFormat =
          ValueNotifier<PartitionFormat?>(PartitionFormat.defaultValue);
      final partitionMount = ValueNotifier<String?>(null);

      final lang = AppLocalizations.of(context);
      return AlertDialog(
        title: YaruDialogTitleBar(
          title: Text(lang.partitionCreateTitle),
        ),
        titlePadding: EdgeInsets.zero,
        contentPadding: kContentPadding.copyWith(
            top: kContentSpacing, bottom: kContentSpacing),
        actionsPadding: kFooterPadding,
        buttonPadding: EdgeInsets.zero,
        scrollable: true,
        content: FormLayout(
          rowSpacing: kContentSpacing,
          columnSpacing: kContentSpacing,
          rows: [
            <Widget>[
              Text(lang.partitionSizeLabel, textAlign: TextAlign.end),
              AnimatedBuilder(
                animation: Listenable.merge([
                  partitionSize,
                  partitionUnit,
                ]),
                builder: (context, child) {
                  return StorageSizeBox(
                    size: partitionSize.value,
                    unit: partitionUnit.value,
                    maximum: gap.size,
                    onSizeChanged: (v) => partitionSize.value = v,
                    onUnitSelected: (v) => partitionUnit.value = v,
                  );
                },
              )
            ],
            <Widget>[
              Text(lang.partitionFormatLabel, textAlign: TextAlign.end),
              _PartitionFormatSelector(
                partitionFormat: partitionFormat,
                partitionFormats: [...PartitionFormat.supported, null],
              )
            ],
            <Widget>[
              Text(lang.partitionMountPointLabel, textAlign: TextAlign.end),
              _PartitionMountField(
                partitionFormat: partitionFormat,
                partitionMount: partitionMount,
              ),
            ],
          ],
        ),
        actions: [
          FilledButton(
            onPressed: Navigator.of(context).pop,
            child: Text(lang.cancelButtonText),
          ),
          const SizedBox(width: kButtonBarSpacing),
          FilledButton(
            onPressed: () {
              model.addPartition(
                disk,
                gap,
                size: partitionSize.value,
                format: partitionFormat.value,
                mount: partitionMount.value,
              );
              Navigator.of(context).pop();
            },
            child: Text(lang.okButtonText),
          ),
        ],
      );
    },
  );
}

extension _PartitionFormatLang on PartitionFormat {
  String localize(AppLocalizations lang) {
    switch (this) {
      case PartitionFormat.btrfs:
        return lang.partitionFormatBtrfs;
      case PartitionFormat.ext2:
        return lang.partitionFormatExt2;
      case PartitionFormat.ext3:
        return lang.partitionFormatExt3;
      case PartitionFormat.ext4:
        return lang.partitionFormatExt4;
      case PartitionFormat.fat:
        return lang.partitionFormatFat;
      case PartitionFormat.fat12:
        return lang.partitionFormatFat12;
      case PartitionFormat.fat16:
        return lang.partitionFormatFat16;
      case PartitionFormat.fat32:
        return lang.partitionFormatFat32;
      case PartitionFormat.iso9660:
        return lang.partitionFormatIso9660;
      case PartitionFormat.vfat:
        return lang.partitionFormatVfat;
      case PartitionFormat.jfs:
        return lang.partitionFormatJfs;
      case PartitionFormat.ntfs:
        return lang.partitionFormatNtfs;
      case PartitionFormat.reiserfs:
        return lang.partitionFormatReiserFS;
      case PartitionFormat.swap:
        return lang.partitionFormatSwap;
      case PartitionFormat.xfs:
        return lang.partitionFormatXfs;
      case PartitionFormat.zfsroot:
        return lang.partitionFormatZfsroot;
      default:
        throw UnimplementedError(toString());
    }
  }
}

/// Shows a dialog for editing an existing partition on the given [disk].
Future<void> showEditPartitionDialog(
    BuildContext context, Disk disk, Partition partition, Gap? gap) {
  final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);

  return showDialog(
    context: context,
    builder: (context) {
      final partitionSize = ValueNotifier(partition.size ?? 0);
      final partitionUnit = ValueNotifier(DataUnit.megabytes);
      final partitionFormat =
          ValueNotifier(PartitionFormat.fromPartition(partition));
      final partitionWipe = ValueNotifier(partition.isWiped);
      final partitionMount = ValueNotifier(partition.mount);

      final lang = AppLocalizations.of(context);
      return AlertDialog(
        title: YaruDialogTitleBar(
          title: Text(lang.partitionEditTitle),
        ),
        titlePadding: EdgeInsets.zero,
        contentPadding: kContentPadding.copyWith(
            top: kContentSpacing, bottom: kContentSpacing),
        actionsPadding: kFooterPadding,
        buttonPadding: EdgeInsets.zero,
        scrollable: true,
        content: FormLayout(
          rowSpacing: kContentSpacing,
          columnSpacing: kContentSpacing,
          rows: [
            <Widget>[
              Text(lang.partitionSizeLabel, textAlign: TextAlign.end),
              AnimatedBuilder(
                animation: Listenable.merge([
                  partitionSize,
                  partitionUnit,
                ]),
                builder: (context, child) {
                  return StorageSizeBox(
                    size: partitionSize.value,
                    unit: partitionUnit.value,
                    minimum: partition.estimatedMinSize ?? 0,
                    maximum: (partition.size ?? 0) + (gap?.size ?? 0),
                    onSizeChanged: (v) => partitionSize.value = v,
                    onUnitSelected: (v) => partitionUnit.value = v,
                  );
                },
              )
            ],
            <Widget>[
              Text(lang.partitionFormatLabel, textAlign: TextAlign.end),
              _PartitionFormatSelector(
                partitionFormat: partitionFormat,
                partitionFormats: PartitionFormat.values,
              ),
            ],
            <Widget>[
              const SizedBox.shrink(),
              ValueListenableBuilder(
                valueListenable: partitionFormat,
                builder: (context, value, child) {
                  return _PartitionWipeCheckbox(
                    canWipe: partitionFormat.value?.canWipe == true,
                    wipe: partitionWipe,
                  );
                },
              ),
            ],
            <Widget>[
              Text(lang.partitionMountPointLabel, textAlign: TextAlign.end),
              _PartitionMountField(
                initialMount: partition.mount,
                partitionFormat: partitionFormat,
                partitionMount: partitionMount,
              ),
            ],
          ],
        ),
        actions: [
          FilledButton(
            onPressed: Navigator.of(context).pop,
            child: Text(lang.cancelButtonText),
          ),
          const SizedBox(width: kButtonBarSpacing),
          FilledButton(
            onPressed: () {
              model.editPartition(
                disk,
                partition,
                size: partitionSize.value,
                format: partitionFormat.value,
                mount: partitionMount.value,
                wipe: partitionWipe.value,
              );
              Navigator.of(context).pop();
            },
            child: Text(lang.okButtonText),
          ),
        ],
      );
    },
  );
}

class _PartitionMountField extends StatelessWidget {
  const _PartitionMountField({
    this.initialMount,
    required this.partitionFormat,
    required this.partitionMount,
  });

  final String? initialMount;
  final ValueNotifier<PartitionFormat?> partitionFormat;
  final ValueNotifier<String?> partitionMount;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PartitionFormat?>(
      valueListenable: partitionFormat,
      builder: (context, format, child) {
        return Autocomplete<String>(
          initialValue: initialMount != null
              ? TextEditingValue(text: initialMount!)
              : null,
          optionsBuilder: (value) => kDefaultMountPoints
              .where((option) => option.startsWith(value.text)),
          onSelected: (option) => partitionMount.value = option,
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextFormField(
              enabled: format != PartitionFormat.swap,
              controller: textEditingController,
              focusNode: focusNode,
              onChanged: (value) => partitionMount.value = value,
              onFieldSubmitted: (_) => onFieldSubmitted(),
            );
          },
        );
      },
    );
  }
}

class _PartitionWipeCheckbox extends StatelessWidget {
  const _PartitionWipeCheckbox({
    required this.canWipe,
    required this.wipe,
  });

  final bool canWipe;
  final ValueNotifier<bool?> wipe;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ValueListenableBuilder<bool?>(
      valueListenable: wipe,
      builder: (context, value, child) {
        return YaruCheckButton(
          title: Text(lang.partitionErase),
          value: value ?? false,
          onChanged: canWipe ? (v) => wipe.value = v! : null,
        );
      },
    );
  }
}

class _PartitionFormatSelector extends StatelessWidget {
  const _PartitionFormatSelector({
    required this.partitionFormat,
    required this.partitionFormats,
  });

  final ValueNotifier<PartitionFormat?> partitionFormat;
  final List<PartitionFormat?> partitionFormats;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ValueListenableBuilder<PartitionFormat?>(
      valueListenable: partitionFormat,
      builder: (context, type, child) {
        return DropdownBuilder<PartitionFormat?>(
          selected: type,
          values: partitionFormats,
          itemBuilder: (context, format, _) {
            return Text(
              format?.localize(lang) ?? lang.partitionFormatNone,
              key: ValueKey(format?.type),
            );
          },
          onSelected: (value) => partitionFormat.value = value,
        );
      },
    );
  }
}
