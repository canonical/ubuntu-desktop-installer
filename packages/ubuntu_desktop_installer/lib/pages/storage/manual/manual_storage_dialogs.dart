import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'manual_storage_model.dart';
import 'storage_types.dart';

const _kInputFieldWidth = 400.0;
const _kValidMountPointPattern = r'^(/\S*|)$';

/// Shows a dialog for creating a new partition for the given [disk].
Future<void> showCreatePartitionDialog(
  BuildContext context,
  Disk disk,
  Gap gap,
) {
  return showDialog(
    context: context,
    builder: (context) {
      final partitionUnit = ValueNotifier(DataUnit.megabytes);
      final partitionSize = ValueNotifier(gap.size);
      final partitionFormat =
          ValueNotifier<PartitionFormat?>(PartitionFormat.defaultValue);
      final partitionMount = ValueNotifier<String?>(null);

      final lang = AppLocalizations.of(context);
      return Consumer(builder: (context, ref, child) {
        final model = ref.read(manualStorageModelProvider);
        return AlertDialog(
          title: YaruDialogTitleBar(
            title: Text(lang.partitionCreateTitle),
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.all(kYaruPagePadding),
          actionsPadding: const EdgeInsets.all(kYaruPagePadding),
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
                ValueListenableBuilder(
                  valueListenable: partitionFormat,
                  builder: (context, value, child) {
                    return MenuButtonBuilder<PartitionFormat?>(
                      entries: [
                        ...PartitionFormat.supported
                            .map((f) => MenuButtonEntry(value: f)),
                        const MenuButtonEntry(value: null, isDivider: true),
                        const MenuButtonEntry(value: PartitionFormat.swap),
                        const MenuButtonEntry(value: null, isDivider: true),
                        const MenuButtonEntry(value: PartitionFormat.none),
                      ],
                      selected: partitionFormat.value,
                      onSelected: (format) => partitionFormat.value = format,
                      itemBuilder: (context, format, child) => Text(
                        format?.name ?? lang.partitionFormatNone,
                        key: ValueKey(format?.type),
                      ),
                    );
                  },
                ),
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
            PushButton.outlined(
              onPressed: Navigator.of(context).pop,
              child: Text(UbuntuLocalizations.of(context).cancelLabel),
            ),
            const SizedBox(width: kButtonBarSpacing),
            ValueListenableBuilder(
                valueListenable: partitionMount,
                builder: (context, value, child) {
                  return PushButton.filled(
                    onPressed: RegExp(_kValidMountPointPattern)
                            .hasMatch(partitionMount.value ?? '')
                        ? () {
                            model.addPartition(
                              disk,
                              gap,
                              size: partitionSize.value,
                              format: partitionFormat.value,
                              mount: partitionMount.value,
                            );
                            Navigator.of(context).pop();
                          }
                        : null,
                    child: Text(UbuntuLocalizations.of(context).okLabel),
                  );
                }),
          ],
        );
      });
    },
  );
}

/// Shows a dialog for editing an existing partition on the given [disk].
Future<void> showEditPartitionDialog(
  BuildContext context,
  Disk disk,
  Partition partition,
  Partition? originalConfig,
  Gap? gap,
) {
  return showDialog(
    context: context,
    builder: (context) {
      final partitionSize = ValueNotifier(partition.size ?? 0);
      final partitionUnit = ValueNotifier(DataUnit.megabytes);
      final partitionFormat = ValueNotifier<PartitionFormat?>(
          partition.preserve == true && !partition.isWiped
              ? null
              : PartitionFormat.fromPartition(partition));
      final partitionMount = ValueNotifier(partition.mount);

      final lang = AppLocalizations.of(context);
      return Consumer(builder: (context, ref, child) {
        final model = ref.read(manualStorageModelProvider);
        return AlertDialog(
          title: YaruDialogTitleBar(
            title: Text(lang.partitionEditTitle),
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.all(kYaruPagePadding),
          actionsPadding: const EdgeInsets.all(kYaruPagePadding),
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
                ValueListenableBuilder(
                  valueListenable: partitionFormat,
                  builder: (context, value, child) {
                    final configFormat = originalConfig != null
                        ? PartitionFormat.fromPartition(originalConfig)
                        : null;
                    return MenuButtonBuilder<PartitionFormat?>(
                      entries: [
                        if (partition.preserve == true) ...[
                          const MenuButtonEntry(value: null),
                          const MenuButtonEntry(value: null, isDivider: true),
                        ],
                        ...PartitionFormat.supported
                            .map((f) => MenuButtonEntry(value: f)),
                        const MenuButtonEntry(value: null, isDivider: true),
                        const MenuButtonEntry(value: PartitionFormat.swap),
                        if (partition.preserve != true) ...[
                          const MenuButtonEntry(value: null, isDivider: true),
                          const MenuButtonEntry(value: PartitionFormat.none),
                        ],
                      ],
                      selected: partitionFormat.value,
                      onSelected: (format) => partitionFormat.value = format,
                      itemBuilder: (context, format, child) => Text(
                        format?.name ??
                            (configFormat?.name != null
                                ? lang.partitionFormatKeep(configFormat!.name!)
                                : lang.partitionFormatNone),
                        key: ValueKey(format?.type),
                      ),
                      child: Text(
                        partitionFormat.value?.name ??
                            (configFormat?.name != null
                                ? lang.partitionFormatKeep(configFormat!.name!)
                                : lang.partitionFormatNone),
                        key: ValueKey(partitionFormat.value?.type),
                      ),
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
            PushButton.outlined(
              onPressed: Navigator.of(context).pop,
              child: Text(UbuntuLocalizations.of(context).cancelLabel),
            ),
            const SizedBox(width: kButtonBarSpacing),
            ValueListenableBuilder(
                valueListenable: partitionMount,
                builder: (context, value, child) {
                  return PushButton.filled(
                    onPressed: RegExp(_kValidMountPointPattern)
                            .hasMatch(partitionMount.value ?? '')
                        ? () {
                            model.editPartition(
                              disk,
                              partition,
                              size: partitionSize.value,
                              format: partitionFormat.value,
                              mount: partitionMount.value,
                              wipe: partitionFormat.value != null &&
                                  partitionFormat.value != PartitionFormat.none,
                            );
                            Navigator.of(context).pop();
                          }
                        : null,
                    child: Text(UbuntuLocalizations.of(context).okLabel),
                  );
                }),
          ],
        );
      });
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
    final lang = AppLocalizations.of(context);
    return SizedBox(
      width: _kInputFieldWidth,
      child: ValueListenableBuilder<PartitionFormat?>(
        valueListenable: partitionFormat,
        builder: (context, format, child) {
          return YaruAutocomplete<String>(
            initialValue: initialMount != null
                ? TextEditingValue(text: initialMount!)
                : null,
            optionsBuilder: (value) => kDefaultMountPoints
                .where((option) => option.startsWith(value.text)),
            onSelected: (option) => partitionMount.value = option,
            fieldViewBuilder:
                (context, textEditingController, focusNode, onFieldSubmitted) {
              return TextFormField(
                enabled: format != PartitionFormat.none &&
                    format != PartitionFormat.swap,
                controller: textEditingController,
                focusNode: focusNode,
                onChanged: (value) => partitionMount.value = value,
                onFieldSubmitted: (_) => onFieldSubmitted(),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return null;
                  } else if (!value!.startsWith('/')) {
                    return lang.allocateDiskSpaceInvalidMountPointSlash;
                  } else if (value.contains(' ')) {
                    return lang.allocateDiskSpaceInvalidMountPointSpace;
                  } else {
                    return null;
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
