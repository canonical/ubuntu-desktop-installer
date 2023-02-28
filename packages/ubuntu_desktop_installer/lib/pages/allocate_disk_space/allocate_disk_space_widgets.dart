import 'package:collection/collection.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import 'allocate_disk_space_dialogs.dart';
import 'allocate_disk_space_model.dart';
import 'storage_columns.dart';
import 'storage_table.dart';
import 'storage_types.dart';

class PartitionBar extends StatelessWidget {
  const PartitionBar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    return YaruBorderContainer(
      borderRadius: BorderRadius.circular(kYaruButtonRadius),
      clipBehavior: Clip.antiAlias,
      child: CustomPaint(
        size: const Size(double.infinity, 16),
        painter: _PartitionPainter(model),
      ),
    );
  }
}

Color _partitionColor(int index, int count) {
  assert(count > 0);
  final baseColor = HSLColor.fromColor(Colors.blue.shade900);
  final hue = (baseColor.hue + 360 / count * index) % 360;
  return baseColor.withHue(hue).toColor();
}

class _PartitionPainter extends CustomPainter {
  _PartitionPainter(this._model)
      : _selectedDiskIndex = _model.selectedDiskIndex,
        _selectedObjectIndex = _model.selectedObjectIndex;

  final AllocateDiskSpaceModel _model;
  final int _selectedDiskIndex;
  final int _selectedObjectIndex;

  @override
  void paint(Canvas canvas, Size size) {
    final diskSize = _model.selectedDisk?.size ?? 0;
    if (diskSize <= 0) return;

    final rect = Offset.zero & size;
    final objects = _model.selectedDisk?.partitions;
    final objectCount = objects?.length ?? 0;
    for (var index = 0; index < objectCount; ++index) {
      final object = objects![index];
      if (object is! Partition) continue;
      final objectSize = object.size ?? 0;
      if (objectSize <= 0) continue;

      final paint = Paint();
      paint.color = _partitionColor(index, objects.length);
      paint.style = PaintingStyle.fill;

      final x = (object.offset ?? 0) / diskSize * rect.width;
      final width = rect.width * objectSize / diskSize;
      canvas.drawRect(Rect.fromLTWH(x, 0, width, rect.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _PartitionPainter old) {
    return old._selectedDiskIndex != _selectedDiskIndex ||
        old._selectedObjectIndex != _selectedObjectIndex;
  }
}

class PartitionLegend extends StatelessWidget {
  const PartitionLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    final lang = AppLocalizations.of(context);

    final objects = model.selectedDisk?.partitions ?? [];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: objects
            .mapIndexed((index, object) => Padding(
                  padding:
                      EdgeInsetsDirectional.only(start: index > 0 ? 40 : 0),
                  child: object.map(
                    partition: (partition) => _PartitionLabel(
                      // TODO:
                      // - localize?
                      // - partition type?
                      title: '${model.selectedDisk!.id}${partition.number}',
                      size: partition.size ?? 0,
                      color: _partitionColor(index, objects.length),
                    ),
                    gap: (gap) => _PartitionLabel(
                      size: gap.size,
                      title: lang.freeDiskSpace,
                      borderColor: Theme.of(context).dividerColor,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _PartitionLabel extends StatelessWidget {
  const _PartitionLabel({
    required this.title,
    required this.size,
    this.color = Colors.transparent,
    this.borderColor = Colors.transparent,
  });

  final String title;
  final int size;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 8, 0),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            Text(filesize(size), style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}

class PartitionTable extends StatelessWidget {
  const PartitionTable({super.key, required this.controller});

  final AutoScrollController controller;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    return StorageTable(
      columns: [
        StorageDeviceColumn(),
        StorageTypeColumn(),
        StorageMountColumn(),
        StorageSizeColumn(),
        StorageSystemColumn(),
        StorageWipeColumn(
          onWipe: (disk, partition, wipe) {
            model.editPartition(disk, partition, wipe: wipe);
          },
        ),
      ],
      storages: model.disks,
      controller: controller,
      canSelect: model.canSelectStorage,
      isSelected: model.isStorageSelected,
      onSelected: model.selectStorage,
    );
  }
}

class PartitionButtonRow extends StatelessWidget {
  const PartitionButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    final lang = AppLocalizations.of(context);

    return Row(
      children: <Widget>[
        YaruBorderContainer(
          borderRadius: BorderRadius.circular(kYaruButtonRadius),
          clipBehavior: Clip.antiAlias,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Tooltip(
                  message: model.selectedGap?.tooManyPrimaryPartitions == true
                      ? lang.tooManyPrimaryPartitions
                      : '',
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: model.canAddPartition
                        ? () => showCreatePartitionDialog(
                            context, model.selectedDisk!, model.selectedGap!)
                        : null,
                    child: const Icon(Icons.add),
                  ),
                ),
                const VerticalDivider(width: 1),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: model.canRemovePartition
                      ? () => model.deletePartition(
                          model.selectedDisk!, model.selectedPartition!)
                      : null,
                  child: const Icon(Icons.remove),
                ),
                const VerticalDivider(width: 1),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: model.canEditPartition
                      ? () => showEditPartitionDialog(
                          context,
                          model.selectedDisk!,
                          model.selectedPartition!,
                          model.trailingGap)
                      : null,
                  child: Text(lang.changeButtonText),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        ButtonBar(
          children: [
            OutlinedButton(
              onPressed: model.canReformatDisk
                  ? () => _maybeReformatDisk(context)
                  : null,
              child: Text(lang.newPartitionTable),
            ),
          ],
        ),
        OutlinedButton(
          onPressed: model.resetStorage,
          child: Text(lang.revertButtonText),
        ),
      ],
    );
  }

  Future<void> _maybeReformatDisk(BuildContext context) async {
    final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);
    final lang = AppLocalizations.of(context);

    final disk = model.selectedDisk!;
    if (disk.ptable != null) {
      final confirmed = await showConfirmationDialog(
        context,
        title: lang.newPartitionTableConfirmationTitle,
        message: lang.newPartitionTableConfirmationMessage,
      );
      if (!confirmed) return;
    }
    model.reformatDisk(disk);
  }
}
