import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class FormLayout extends StatelessWidget {
  const FormLayout({
    Key? key,
    required this.rows,
    this.rowSpacing = 0,
    this.columnSpacing = 0,
  }) : super(key: key);

  final double rowSpacing;
  final double columnSpacing;
  final List<List<Widget>> rows;

  @override
  Widget build(BuildContext context) {
    final columnCount = rows.firstOrNull?.length ?? 0;
    final columnSpacer = SizedBox(width: columnSpacing);
    final rowSpacer = TableRow(
      children: List.filled(columnCount * 2 - 1, SizedBox(height: rowSpacing)),
    );

    final children = rows
        .map((row) => TableRow(children: row.separated(columnSpacer).toList()))
        .separated(rowSpacer);

    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: children.toList(),
    );
  }
}

extension _IterableX<T> on Iterable<T> {
  Iterable<T> separated(T separator) {
    return expand((item) sync* {
      yield separator;
      yield item;
    }).skip(1);
  }
}
