import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'allocate_disk_space_model.dart';

const _kDefaultMountPoints = <String>[
  '/',
  '/boot',
  '/home',
  '/tmp',
  '/usr',
  '/var',
  '/srv',
  '/opt',
  '/usr/local',
];

enum PartitionType { primary, logical }
enum PartitionFormat {
  ext4,
  ext3,
  ext2,
  btrfs,
  jfs,
  xfs,
  fat16,
  fat32,
  swap,
  bios,
  efi,
  physical,
  none,
}
enum PartitionLocation { beginning, end }

Future<void> showCreatePartitionDialog(BuildContext context, DiskModel disk) {
  return showDialog(
    context: context,
    builder: (context) {
      final partitionUnit = ValueNotifier(DataUnit.megabytes);
      final partitionSize = ValueNotifier(disk.freeSpace);
      final partitionType = ValueNotifier(PartitionType.primary);
      final partitionLocation = ValueNotifier(PartitionLocation.beginning);
      final partitionFormat = ValueNotifier(PartitionFormat.ext4);
      final tileHeight = _defaultTileHeight(context);

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
                  // https://github.com/canonical/ubuntu-desktop-installer/issues/373
                  // _PartitionDialogLabel(
                  //   lang.partitionTypeLabel,
                  //   height: kRadioSize.height,
                  // ),
                  // SizedBox(height: kRadioSize.height),
                  // const SizedBox(height: kContentSpacing),
                  // _PartitionDialogLabel(
                  //   lang.partitionLocationLabel,
                  //   height: kRadioSize.height,
                  // ),
                  // SizedBox(height: kRadioSize.height),
                  // const SizedBox(height: kContentSpacing),
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
                      freeSpace: disk.freeSpace,
                    ),
                  ),
                  const SizedBox(height: kContentSpacing),
                  // https://github.com/canonical/ubuntu-desktop-installer/issues/373
                  // _RadioValueTile(
                  //   title: Text(lang.partitionTypePrimary),
                  //   value: PartitionType.primary,
                  //   groupValue: partitionType,
                  // ),
                  // _RadioValueTile(
                  //   title: Text(lang.partitionTypeLogical),
                  //   value: PartitionType.logical,
                  //   groupValue: partitionType,
                  // ),
                  // const SizedBox(height: kContentSpacing),
                  // _RadioValueTile<PartitionLocation>(
                  //   title: Text(lang.partitionLocationBeginning),
                  //   value: PartitionLocation.beginning,
                  //   groupValue: partitionLocation,
                  // ),
                  // _RadioValueTile<PartitionLocation>(
                  //   title: Text(lang.partitionLocationEnd),
                  //   value: PartitionLocation.end,
                  //   groupValue: partitionLocation,
                  // ),
                  // const SizedBox(height: kContentSpacing),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: tileHeight),
                    child: _PartitionFormatSelector(
                      partitionFormat: partitionFormat,
                    ),
                  ),
                  const SizedBox(height: kContentSpacing),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: tileHeight),
                    child: Autocomplete<String>(
                      optionsBuilder: (value) => _kDefaultMountPoints
                          .where((option) => option.startsWith(value.text)),
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
            onPressed: null,
            child: Text(lang.okButtonText),
          ),
        ],
      );
    },
  );
}

// material/list_tile.dart
double _defaultTileHeight(BuildContext context) {
  final baseDensity = Theme.of(context).visualDensity.baseSizeAdjustment;
  final isDense = ListTileTheme.of(context).dense;
  return (isDense ? 48.0 : 56.0) + baseDensity.dy;
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

class _RadioValueTile<T> extends StatelessWidget {
  const _RadioValueTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.title,
  }) : super(key: key);

  final T value;
  final ValueNotifier<T> groupValue;
  final Widget title;

  void _setValue(T? value) => groupValue.value = value!;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: groupValue,
      builder: (context, groupValue, child) {
        return RadioButton<T>(
          title: title,
          value: value,
          groupValue: groupValue,
          onChanged: _setValue,
        );
      },
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
                max: freeSpace.toDouble(),
                onChanged: _setBytes,
              ),
            ),
            const SizedBox(width: kButtonBarSpacing),
            IntrinsicWidth(
              child: DropdownBuilder<DataUnit>(
                values: DataUnit.values,
                selected: unit.value,
                onSelected: (value) => unit.value = value,
                itemBuilder: (context, unit, _) {
                  return Text(unit.localize(context));
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
  String localize(BuildContext context) {
    final lang = AppLocalizations.of(context);

    switch (this) {
      case PartitionFormat.ext4:
        return lang.partitionFormatExt4;
      case PartitionFormat.ext3:
        return lang.partitionFormatExt3;
      case PartitionFormat.ext2:
        return lang.partitionFormatExt2;
      case PartitionFormat.btrfs:
        return lang.partitionFormatBtrfs;
      case PartitionFormat.jfs:
        return lang.partitionFormatJfs;
      case PartitionFormat.xfs:
        return lang.partitionFormatXfs;
      case PartitionFormat.fat16:
        return lang.partitionFormatFat16;
      case PartitionFormat.fat32:
        return lang.partitionFormatFat32;
      case PartitionFormat.swap:
        return lang.partitionFormatSwap;
      case PartitionFormat.bios:
        return lang.partitionFormatBios;
      case PartitionFormat.efi:
        return lang.partitionFormatEfi;
      case PartitionFormat.physical:
        return lang.partitionFormatPhysical;
      case PartitionFormat.none:
        return lang.partitionFormatNone;
    }
  }
}

Future<void> showEditPartitionDialog(
    BuildContext context, PartitionModel partition) {
  return showDialog(
    context: context,
    builder: (context) {
      final partitionFormat = ValueNotifier(PartitionFormat.ext4);
      final partitionErase = ValueNotifier(true);
      final tileHeight = _defaultTileHeight(context);

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
                  ValueListenableBuilder<bool>(
                    valueListenable: partitionErase,
                    builder: (context, erase, child) {
                      return CheckButton(
                        title: Text(lang.partitionErase),
                        value: erase,
                        onChanged: (v) => partitionErase.value = v!,
                      );
                    },
                  ),
                  const SizedBox(height: kContentSpacing),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: tileHeight),
                    child: Autocomplete<String>(
                      optionsBuilder: (value) => _kDefaultMountPoints
                          .where((option) => option.startsWith(value.text)),
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
            onPressed: null,
            child: Text(lang.okButtonText),
          ),
        ],
      );
    },
  );
}

class _PartitionFormatSelector extends StatelessWidget {
  const _PartitionFormatSelector({
    Key? key,
    required this.partitionFormat,
  }) : super(key: key);

  final ValueNotifier<PartitionFormat> partitionFormat;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PartitionFormat>(
      valueListenable: partitionFormat,
      builder: (context, type, child) {
        return DropdownBuilder<PartitionFormat>(
          selected: type,
          values: PartitionFormat.values,
          itemBuilder: (context, type, _) {
            return Text(type.localize(context));
          },
          onSelected: (value) {},
        );
      },
    );
  }
}
