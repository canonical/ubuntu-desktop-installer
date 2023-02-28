import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'storage_columns.dart';
import 'storage_types.dart';

typedef CanSelectStorage = bool Function(int disk, [int object]);
typedef IsStorageSelected = bool Function(int disk, [int object]);
typedef OnStorageSelected = void Function(int disk, [int object]);

class StorageTable extends StatelessWidget {
  const StorageTable({
    super.key,
    required this.storages,
    required this.columns,
    this.controller,
    this.canSelect,
    this.isSelected,
    this.onSelected,
  });

  final List<Disk> storages;
  final List<StorageColumn> columns;
  final AutoScrollController? controller;

  /// Called to determine whether the user is allowed to interactively select
  /// the storage device.
  final CanSelectStorage? canSelect;

  /// Called to determine whether the storage device is selected.
  final IsStorageSelected? isSelected;

  /// Called when the user selects a storage device.
  final OnStorageSelected? onSelected;

  Widget _autoScrollTag({
    required Widget child,
    required int disk,
    int object = -1,
  }) {
    if (controller == null) {
      return child;
    }

    final index = Object.hashAll([disk, object]);
    return AutoScrollTag(
      key: ValueKey(index),
      index: index,
      controller: controller!,
      child: child,
    );
  }

  List<DataRow> _buildDataRows(BuildContext context, {required int diskIndex}) {
    final disk = storages[diskIndex];
    return <DataRow>[
      DataRow.byIndex(
        index: diskIndex,
        selected: isSelected?.call(diskIndex) ?? false,
        onSelectChanged: canSelect?.call(diskIndex) == true
            ? (selected) {
                if (selected == true) {
                  onSelected?.call(diskIndex);
                }
              }
            : null,
        cells: <DataCell>[
          DataCell(
            SizedBox(
              height: kMinInteractiveDimension,
              child: _autoScrollTag(
                disk: diskIndex,
                child: columns.first.diskBuilder(context, disk),
              ),
            ),
          ),
          for (final column in columns.skip(1))
            DataCell(column.diskBuilder(context, disk))
        ],
      ),
      for (var objectIndex = 0;
          objectIndex < disk.partitions.length;
          ++objectIndex)
        DataRow(
          key: ValueKey(Object.hashAll([diskIndex, objectIndex])),
          selected: isSelected?.call(diskIndex, objectIndex) ?? false,
          onSelectChanged: canSelect?.call(diskIndex, objectIndex) == true
              ? (selected) {
                  if (selected == true) {
                    onSelected?.call(diskIndex, objectIndex);
                  }
                }
              : null,
          cells: <DataCell>[
            DataCell(
              SizedBox(
                height: kMinInteractiveDimension,
                child: _autoScrollTag(
                  disk: diskIndex,
                  object: objectIndex,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: disk.partitions[objectIndex] is Partition
                        ? columns.first.partitionBuilder(
                            context,
                            disk,
                            disk.partitions[objectIndex] as Partition,
                          )
                        : columns.first.gapBuilder(
                            context,
                            disk,
                            disk.partitions[objectIndex] as Gap,
                          ),
                  ),
                ),
              ),
            ),
            for (final column in columns.skip(1))
              DataCell(
                disk.partitions[objectIndex] is Partition
                    ? column.partitionBuilder(
                        context,
                        disk,
                        disk.partitions[objectIndex] as Partition,
                      )
                    : column.gapBuilder(
                        context,
                        disk,
                        disk.partitions[objectIndex] as Gap,
                      ),
              )
          ],
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return YaruBorderContainer(
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(builder: (context, constraints) {
        final theme = Theme.of(context);
        return OverflowBox(
          maxWidth: double.infinity,
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.minWidth),
            child: SingleChildScrollView(
              controller: controller,
              child: DataTable(
                dataRowHeight: kMinInteractiveDimension +
                    theme.visualDensity.baseSizeAdjustment.dy,
                headingRowHeight: kMinInteractiveDimension +
                    theme.visualDensity.baseSizeAdjustment.dy,
                showCheckboxColumn: false,
                headingTextStyle: theme.textTheme.titleSmall,
                dataTextStyle: theme.textTheme.bodyMedium,
                columns: columns
                    .map((column) =>
                        DataColumn(label: column.titleBuilder(context)))
                    .toList(),
                rows: List.generate(storages.length, (index) {
                  return _buildDataRows(context, diskIndex: index);
                }).fold<List<DataRow>>([], (allRows, diskRows) {
                  allRows.addAll(diskRows);
                  return allRows;
                }).toList(),
              ),
            ),
          ),
        );
      }),
    );
  }
}
