import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'storage_columns.dart';
import 'storage_types.dart';

typedef CanSelectStorage = bool Function(int disk, [int object]);
typedef IsStorageSelected = bool Function(int disk, [int object]);
typedef OnStorageSelected = void Function(int disk, [int object]);
typedef OnStorageDoubleTap = void Function(int disk, [int object]);

class StorageTable extends StatefulWidget {
  const StorageTable({
    super.key,
    required this.storages,
    required this.columns,
    this.controller,
    this.canSelect,
    this.isSelected,
    this.onSelected,
    this.onDoubleTap,
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

  /// Callend when the user double taps a storage device.
  final OnStorageDoubleTap? onDoubleTap;

  @override
  State<StorageTable> createState() => _StorageTableState();
}

class _StorageTableState extends State<StorageTable> {
  @override
  void initState() {
    super.initState();
    dataTableShowLogs = false;
  }

  Widget _autoScrollTag({
    required Widget child,
    required int disk,
    int object = -1,
  }) {
    if (widget.controller == null) {
      return child;
    }

    final index = Object.hashAll([disk, object]);
    return AutoScrollTag(
      key: ValueKey(index),
      index: index,
      controller: widget.controller!,
      child: child,
    );
  }

  List<DataRow> _buildDataRows(BuildContext context, {required int diskIndex}) {
    final disk = widget.storages[diskIndex];
    return <DataRow>[
      DataRow2.byIndex(
        index: diskIndex,
        onDoubleTap: widget.onDoubleTap != null
            ? () => widget.onDoubleTap!(diskIndex)
            : null,
        selected: widget.isSelected?.call(diskIndex) ?? false,
        onSelectChanged: (selected) {
          if (widget.canSelect?.call(diskIndex) == true) {
            if (selected == true) {
              widget.onSelected?.call(diskIndex);
            }
          }
        },
        cells: <DataCell>[
          DataCell(
            SizedBox(
              height: kMinInteractiveDimension,
              child: _autoScrollTag(
                disk: diskIndex,
                child: widget.columns.first.diskBuilder(context, disk),
              ),
            ),
          ),
          for (final column in widget.columns.skip(1))
            DataCell(column.diskBuilder(context, disk))
        ],
      ),
      for (var objectIndex = 0;
          objectIndex < disk.partitions.length;
          ++objectIndex)
        DataRow2(
          key: ValueKey(Object.hashAll([diskIndex, objectIndex])),
          onDoubleTap: widget.onDoubleTap != null
              ? () => widget.onDoubleTap!(diskIndex, objectIndex)
              : null,
          selected: widget.isSelected?.call(diskIndex, objectIndex) ?? false,
          onSelectChanged:
              widget.canSelect?.call(diskIndex, objectIndex) == true
                  ? (selected) {
                      if (selected == true) {
                        widget.onSelected?.call(diskIndex, objectIndex);
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
                        ? widget.columns.first.partitionBuilder(
                            context,
                            disk,
                            disk.partitions[objectIndex] as Partition,
                          )
                        : widget.columns.first.gapBuilder(
                            context,
                            disk,
                            disk.partitions[objectIndex] as Gap,
                          ),
                  ),
                ),
              ),
            ),
            for (final column in widget.columns.skip(1))
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
    final theme = Theme.of(context);
    return YaruBorderContainer(
      child: DataTable2(
        dataRowHeight: kMinInteractiveDimension +
            theme.visualDensity.baseSizeAdjustment.dy,
        showCheckboxColumn: false,
        headingTextStyle: theme.textTheme.subtitle2,
        dataTextStyle: theme.textTheme.bodyText2,
        columns: widget.columns
            .map((column) => DataColumn2(
                label: column.titleBuilder(context), size: column.size))
            .toList(),
        rows: List.generate(widget.storages.length, (index) {
          return _buildDataRows(context, diskIndex: index);
        }).fold<List<DataRow>>([], (allRows, diskRows) {
          allRows.addAll(diskRows);
          return allRows;
        }).toList(),
      ),
    );
  }
}
