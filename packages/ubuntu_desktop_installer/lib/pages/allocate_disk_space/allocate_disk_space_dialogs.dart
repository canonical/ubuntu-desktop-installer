import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';

import '../../constants.dart';
import '../../l10n.dart';
import '../../utils.dart';
import '../../widgets.dart';
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
enum PartitionFormat { ext4, ext3, ext2 }
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

      return LocalizedView(
        builder: (context, lang) {
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
                      _PartitionDialogLabel(lang.partitionSizeLabel),
                      const SizedBox(height: kContentSpacing),
                      _PartitionDialogLabel(lang.partitionTypeLabel),
                      ListTile(),
                      const SizedBox(height: kContentSpacing),
                      _PartitionDialogLabel(lang.partitionLocationLabel),
                      const SizedBox(height: kContentSpacing),
                      ListTile(),
                      _PartitionDialogLabel(lang.partitionFormatLabel),
                      const SizedBox(height: kContentSpacing),
                      _PartitionDialogLabel(lang.partitionMountPointLabel),
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
                      _RadioValueTile(
                        title: Text(lang.partitionTypePrimary),
                        value: PartitionType.primary,
                        groupValue: partitionType,
                      ),
                      _RadioValueTile(
                        title: Text(lang.partitionTypeLogical),
                        value: PartitionType.logical,
                        groupValue: partitionType,
                      ),
                      const SizedBox(height: kContentSpacing),
                      _RadioValueTile<PartitionLocation>(
                        title: Text(lang.partitionLocationBeginning),
                        value: PartitionLocation.beginning,
                        groupValue: partitionLocation,
                      ),
                      _RadioValueTile<PartitionLocation>(
                        title: Text(lang.partitionLocationEnd),
                        value: PartitionLocation.end,
                        groupValue: partitionLocation,
                      ),
                      const SizedBox(height: kContentSpacing),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: tileHeight),
                        child: ValueListenableBuilder<PartitionFormat>(
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
                        ),
                      ),
                      const SizedBox(height: kContentSpacing),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: tileHeight),
                        child: Autocomplete<String>(
                          initialValue: TextEditingValue(
                            text: lang.partitionMountPointAutomatic,
                          ),
                          optionsBuilder: (value) {
                            return <String>[
                              lang.partitionMountPointAutomatic,
                              ..._kDefaultMountPoints,
                            ].where((option) => option.startsWith(value.text));
                          },
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
  const _PartitionDialogLabel(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: kContentPadding,
      title: Align(
        alignment: Alignment.topRight,
        child: Text(text),
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
        return RadioListTile<T>(
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
              child: LocalizedView(
                builder: (context, lang) {
                  return DropdownBuilder<DataUnit>(
                    values: DataUnit.values,
                    selected: unit.value,
                    onSelected: (value) => unit.value = value,
                    itemBuilder: (context, unit, _) {
                      return Text(unit.localize(context));
                    },
                  );
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
    final lang = AppLocalizations.of(context)!;
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
    final lang = AppLocalizations.of(context)!;
    switch (this) {
      case PartitionFormat.ext4:
        return lang.partitionFormatExt4;
      case PartitionFormat.ext3:
        return lang.partitionFormatExt3;
      case PartitionFormat.ext2:
        return lang.partitionFormatExt2;
    }
  }
}
