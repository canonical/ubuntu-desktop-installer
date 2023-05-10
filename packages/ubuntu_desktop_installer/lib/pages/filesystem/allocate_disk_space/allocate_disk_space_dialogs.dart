import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'allocate_disk_space_model.dart';
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
        final model = ref.read(allocateDiskSpaceModelProvider);
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
                  partitionFormats: [
                    ...PartitionFormat.supported,
                    PartitionFormat.none,
                  ],
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
            PushButton.outlined(
              onPressed: Navigator.of(context).pop,
              child: Text(lang.cancelButtonText),
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
                    child: Text(lang.okButtonText),
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
      final partitionFormat =
          ValueNotifier(PartitionFormat.fromPartition(partition));
      final partitionWipe = ValueNotifier(partition.isWiped);
      final partitionMount = ValueNotifier(partition.mount);

      bool forceWipe() {
        return originalConfig?.mustWipe(partitionFormat.value?.type) != false;
      }

      final lang = AppLocalizations.of(context);
      return Consumer(builder: (context, ref, child) {
        final model = ref.read(allocateDiskSpaceModelProvider);
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
                AnimatedBuilder(
                  animation: Listenable.merge([
                    partitionFormat,
                    partitionWipe,
                  ]),
                  builder: (context, child) {
                    return _PartitionWipeCheckbox(
                      canWipe: partitionFormat.value?.canWipe == true &&
                          !forceWipe(),
                      wipe: partitionWipe.value || forceWipe(),
                      onChanged: (v) => partitionWipe.value = v,
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
              child: Text(lang.cancelButtonText),
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
                              wipe: partitionWipe.value || forceWipe(),
                            );
                            Navigator.of(context).pop();
                          }
                        : null,
                    child: Text(lang.okButtonText),
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
                enabled: format != PartitionFormat.swap,
                controller: textEditingController,
                focusNode: focusNode,
                onChanged: (value) => partitionMount.value = value,
                onFieldSubmitted: (_) => onFieldSubmitted(),
                autovalidateMode: AutovalidateMode.always,
                validator: PatternValidator(
                  _kValidMountPointPattern,
                  errorText: lang.allocateDiskSpaceInvalidMountPoint,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _PartitionWipeCheckbox extends StatelessWidget {
  const _PartitionWipeCheckbox({
    required this.canWipe,
    required this.wipe,
    required this.onChanged,
  });

  final bool canWipe;
  final bool? wipe;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return YaruCheckButton(
      title: Text(lang.partitionErase),
      value: wipe ?? false,
      onChanged: canWipe ? (v) => onChanged(v!) : null,
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
    return SizedBox(
      width: _kInputFieldWidth,
      child: ValueListenableBuilder<PartitionFormat?>(
        valueListenable: partitionFormat,
        builder: (context, type, child) {
          return MenuButtonBuilder<PartitionFormat?>(
            selected: type,
            values: partitionFormats,
            itemBuilder: (context, format, _) {
              return Text(
                format?.name ?? lang.partitionFormatNone,
                key: ValueKey(format?.type),
              );
            },
            onSelected: (value) => partitionFormat.value = value,
          );
        },
      ),
    );
  }
}
