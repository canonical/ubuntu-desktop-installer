import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../l10n.dart';

/// Storage size entry with a spinbox and a data size unit dropdown.
class StorageSizeBox extends StatelessWidget {
  const StorageSizeBox({
    Key? key,
    required this.size,
    required this.unit,
    this.minimum = 0,
    required this.maximum,
    required this.onSizeChanged,
    required this.onUnitSelected,
  }) : super(key: key);

  /// The current value in bytes.
  final int size;

  /// The unit for visualization.
  final DataUnit unit;

  /// The minimum value in bytes.
  final int minimum;

  /// The maximum value in bytes.
  final int maximum;

  final ValueChanged<int> onSizeChanged;
  final ValueChanged<DataUnit> onUnitSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SpinBox(
            value: fromBytes(size, unit),
            min: fromBytes(minimum, unit),
            max: fromBytes(maximum, unit),
            onChanged: (value) => onSizeChanged(toBytes(value, unit)),
          ),
        ),
        const SizedBox(width: kButtonBarSpacing),
        IntrinsicWidth(
          child: DropdownBuilder<DataUnit>(
            values: DataUnit.values,
            selected: unit,
            onSelected: (value) => onUnitSelected(value!),
            itemBuilder: (context, unit, _) {
              return Text(unit.l10n(context), key: ValueKey(unit));
            },
          ),
        ),
      ],
    );
  }
}

extension _DataUnitLocalizations on DataUnit {
  String l10n(BuildContext context) {
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
