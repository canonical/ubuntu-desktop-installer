import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'allocate_disk_space_model.dart';

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
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          OutlinedButton(
            child: Text(lang.backAction),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          OutlinedButton(
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
Future<void> showCreatePartitionDialog(BuildContext context, Disk disk) {
  final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);

  return showDialog(
    context: context,
    builder: (context) {
      final partitionUnit = ValueNotifier(DataUnit.megabytes);
      final partitionSize = ValueNotifier(disk.freeForPartitions ?? 0);
      final partitionFormat = ValueNotifier(PartitionFormat.defaultValue);
      final partitionMount = ValueNotifier<String?>(null);
      final tileHeight = defaultTileHeight(context);

      final lang = AppLocalizations.of(context);
      return AlertDialog(
        title: Text(lang.partitionCreateTitle),
        titlePadding: kHeaderPadding,
        contentPadding: kContentPadding.copyWith(
            top: kContentSpacing, bottom: kContentSpacing),
        actionsPadding: kFooterPadding,
        buttonPadding: EdgeInsets.zero,
        scrollable: true,
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  _PartitionDialogLabel(
                    lang.partitionSizeLabel,
                    height: tileHeight,
                  ),
                  const SizedBox(height: kContentSpacing),
                  _PartitionDialogLabel(
                    lang.partitionFormatLabel,
                    height: tileHeight,
                  ),
                  const SizedBox(height: kContentSpacing),
                  _PartitionDialogLabel(
                    lang.partitionMountPointLabel,
                    height: tileHeight,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: tileHeight),
                    child: _PartitionSizeBox(
                      bytes: partitionSize,
                      unit: partitionUnit,
                      freeSpace: disk.freeForPartitions ?? 0,
                    ),
                  ),
                  const SizedBox(height: kContentSpacing),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: tileHeight),
                    child: _PartitionFormatSelector(
                      partitionFormat: partitionFormat,
                    ),
                  ),
                  const SizedBox(height: kContentSpacing),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: tileHeight),
                    child: _PartitionMountField(
                      partitionFormat: partitionFormat,
                      partitionMount: partitionMount,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: Navigator.of(context).pop,
            child: Text(lang.cancelButtonText),
          ),
          const SizedBox(width: kButtonBarSpacing),
          OutlinedButton(
            onPressed: model.selectedDisk != null
                ? () {
                    model.addPartition(
                      model.selectedDisk!,
                      size: partitionSize.value,
                      format: partitionFormat.value,
                      mount: partitionMount.value,
                    );
                    Navigator.of(context).pop();
                  }
                : null,
            child: Text(lang.okButtonText),
          ),
        ],
      );
    },
  );
}

class _PartitionDialogLabel extends StatelessWidget {
  const _PartitionDialogLabel(this.text, {Key? key, this.height})
      : super(key: key);

  final String text;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: kContentPadding,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(text),
        ),
      ),
    );
  }
}

class _PartitionSizeBox extends StatelessWidget {
  const _PartitionSizeBox({
    Key? key,
    required this.bytes,
    required this.unit,
    required this.freeSpace,
  }) : super(key: key);

  final ValueNotifier<int> bytes;
  final ValueNotifier<DataUnit> unit;
  final int freeSpace;

  void _setBytes(double value) => bytes.value = toBytes(value, unit.value);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([bytes, unit]),
      builder: (context, snapshot) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SpinBox(
                value: fromBytes(bytes.value, unit.value),
                max: fromBytes(freeSpace, unit.value),
                onChanged: _setBytes,
              ),
            ),
            const SizedBox(width: kButtonBarSpacing),
            IntrinsicWidth(
              child: DropdownBuilder<DataUnit>(
                values: DataUnit.values,
                selected: unit.value,
                onSelected: (value) => unit.value = value!,
                itemBuilder: (context, unit, _) {
                  return Text(unit.localize(context), key: ValueKey(unit));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

extension _PartitionUnitLang on DataUnit {
  String localize(BuildContext context) {
    final lang = AppLocalizations.of(context);
    switch (this) {
      case DataUnit.bytes:
        return lang.partitionUnitB;
      case DataUnit.kilobytes:
        return lang.partitionUnitKB;
      case DataUnit.megabytes:
        return lang.partitionUnitMB;
      case DataUnit.gigabytes:
        return lang.partitionUnitGB;
    }
  }
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
    BuildContext context, Disk disk, Partition partition) {
  final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);

  return showDialog(
    context: context,
    builder: (context) {
      final partitionFormat =
          ValueNotifier(PartitionFormat.fromPartition(partition));
      final partitionWipe = ValueNotifier(partition.wipe);
      final partitionMount = ValueNotifier(partition.mount);
      final tileHeight = defaultTileHeight(context);

      final lang = AppLocalizations.of(context);
      return AlertDialog(
        title: Text(lang.partitionEditTitle),
        titlePadding: kHeaderPadding,
        contentPadding: kContentPadding.copyWith(
            top: kContentSpacing, bottom: kContentSpacing),
        actionsPadding: kFooterPadding,
        buttonPadding: EdgeInsets.zero,
        scrollable: true,
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  _PartitionDialogLabel(
                    lang.partitionFormatLabel,
                    height: tileHeight,
                  ),
                  const SizedBox(height: kContentSpacing),
                  SizedBox(height: kRadioSize.height),
                  const SizedBox(height: kContentSpacing),
                  _PartitionDialogLabel(
                    lang.partitionMountPointLabel,
                    height: tileHeight,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: tileHeight),
                    child: _PartitionFormatSelector(
                      partitionFormat: partitionFormat,
                    ),
                  ),
                  const SizedBox(height: kContentSpacing),
                  _PartitionWipeCheckbox(
                    canWipe: partition.canWipe,
                    wipe: partitionWipe,
                  ),
                  const SizedBox(height: kContentSpacing),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: tileHeight),
                    child: _PartitionMountField(
                      initialMount: partition.mount,
                      partitionFormat: partitionFormat,
                      partitionMount: partitionMount,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: Navigator.of(context).pop,
            child: Text(lang.cancelButtonText),
          ),
          const SizedBox(width: kButtonBarSpacing),
          OutlinedButton(
            onPressed: () {
              model.editPartition(
                disk,
                partition,
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
    Key? key,
    this.initialMount,
    required this.partitionFormat,
    required this.partitionMount,
  }) : super(key: key);

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
    Key? key,
    required this.canWipe,
    required this.wipe,
  }) : super(key: key);

  final bool canWipe;
  final ValueNotifier<bool?> wipe;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ValueListenableBuilder<bool?>(
      valueListenable: wipe,
      builder: (context, value, child) {
        return CheckButton(
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
    Key? key,
    required this.partitionFormat,
  }) : super(key: key);

  final ValueNotifier<PartitionFormat?> partitionFormat;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ValueListenableBuilder<PartitionFormat?>(
      valueListenable: partitionFormat,
      builder: (context, type, child) {
        return DropdownBuilder<PartitionFormat>(
          selected: type ?? PartitionFormat.defaultValue,
          values: PartitionFormat.values,
          itemBuilder: (context, format, _) {
            return Text(
              format.localize(lang),
              key: ValueKey(format.type),
            );
          },
          onSelected: (value) => partitionFormat.value = value,
        );
      },
    );
  }
}
