import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'storage_columns.dart';
import 'storage_types.dart';

typedef CanSelectStorage = bool Function(int disk, [int partition]);
typedef IsStorageSelected = bool Function(int disk, [int partition]);
typedef OnStorageSelected = void Function(int disk, [int partition]);

class StorageTable extends StatelessWidget {
  const StorageTable({
    Key? key,
    required this.storages,
    required this.columns,
    this.controller,
    this.canSelect,
    this.isSelected,
    this.onSelected,
  }) : super(key: key);

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
    int partition = -1,
  }) {
    if (controller == null) {
      return child;
    }

    final index = hashList([disk, partition]);
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
      for (var partitionIndex = 0;
          partitionIndex < (disk.partitions?.length ?? 0);
          ++partitionIndex)
        DataRow(
          key: ValueKey(hashList([diskIndex, partitionIndex])),
          selected: isSelected?.call(diskIndex, partitionIndex) ?? false,
          onSelectChanged: canSelect?.call(diskIndex, partitionIndex) == true
              ? (selected) {
                  if (selected == true) {
                    onSelected?.call(diskIndex, partitionIndex);
                  }
                }
              : null,
          cells: <DataCell>[
            DataCell(
              SizedBox(
                height: kMinInteractiveDimension,
                child: _autoScrollTag(
                  disk: diskIndex,
                  partition: partitionIndex,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: columns.first.partitionBuilder(
                      context,
                      disk,
                      disk.partitions![partitionIndex],
                    ),
                  ),
                ),
              ),
            ),
            for (final column in columns.skip(1))
              DataCell(column.partitionBuilder(
                context,
                disk,
                disk.partitions![partitionIndex],
              ))
          ],
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
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
                showCheckboxColumn: false,
                headingTextStyle: theme.textTheme.subtitle2,
                dataTextStyle: theme.textTheme.bodyText2,
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
