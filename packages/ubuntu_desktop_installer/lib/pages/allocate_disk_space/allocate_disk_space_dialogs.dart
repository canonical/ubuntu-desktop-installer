part of 'allocate_disk_space_page.dart';

enum PartitionType { primary, logical }
enum PartitionFormat { ext4, ext3, ext2 }
enum PartitionLocation { beginning, end }

Future<void> showCreatePartitionDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
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
                        child: SpinBox(),
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
                                return Text(type.toFormat(context));
                              },
                              onSelected: (value) {},
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: kContentSpacing),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: tileHeight),
                        child: DropdownBuilder<String>(
                          selected: 'Automatic',
                          values: ['Automatic'],
                          itemBuilder: (context, value, _) => Text(value),
                          onSelected: (value) {},
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

extension _PartitionTypeString on PartitionType {
  String toType(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    switch (this) {
      case PartitionType.primary:
        return lang.partitionTypePrimary;
      case PartitionType.logical:
        return lang.partitionTypeLogical;
    }
  }
}

extension _PartitionFormatString on PartitionFormat {
  String toFormat(BuildContext context) {
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
