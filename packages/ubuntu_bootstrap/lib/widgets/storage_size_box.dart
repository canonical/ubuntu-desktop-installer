import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';

/// Storage size entry with a spinbox and a data size unit dropdown.
class StorageSizeBox extends StatelessWidget {
  const StorageSizeBox({
    super.key,
    required this.size,
    required this.unit,
    this.minimum = 0,
    required this.maximum,
    required this.onSizeChanged,
    required this.onUnitSelected,
    this.autofocus = false,
    this.spacing = kWizardBarSpacing,
  });

  /// The current value in bytes.
  final int size;

  /// The unit for visualization.
  final DataUnit unit;

  /// The minimum value in bytes.
  final int minimum;

  /// The maximum value in bytes.
  final int maximum;

  /// The callback called whenever the size changes.
  final ValueChanged<int> onSizeChanged;

  /// The callback called whenever the user selects a size unit.
  final ValueChanged<DataUnit> onUnitSelected;

  /// Whether the widget should automatically gain focus if nothing else is
  /// already focused.
  final bool autofocus;

  /// The spacing between the value spinbox and the unit dropdown. Defaults to
  /// `kButtonBarSpacing`.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            width: 240,
            child: SpinBox(
              value: fromBytes(size, unit),
              min: fromBytes(minimum, unit),
              max: fromBytes(maximum, unit),
              onChanged: (value) => onSizeChanged(toBytes(value, unit)),
              autofocus: autofocus,
            ),
          ),
        ),
        SizedBox(width: spacing),
        IntrinsicWidth(
          child: MenuButtonBuilder<DataUnit>(
            values: DataUnit.values,
            selected: unit,
            onSelected: (value) => onUnitSelected(value),
            itemBuilder: (context, unit, _) {
              return Text(unit.l10n(context), key: ValueKey(unit));
            },
            child: IndexedStack(
              index: unit.index,
              children: DataUnit.values
                  .map((unit) => Text(unit.l10n(context)))
                  .toList(),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

extension _DataUnitLocalizations on DataUnit {
  String l10n(BuildContext context) {
    final lang = UbuntuLocalizations.of(context);
    switch (this) {
      case DataUnit.bytes:
        return lang.byte;
      case DataUnit.kilobytes:
        return lang.kilobyte;
      case DataUnit.megabytes:
        return lang.megabyte;
      case DataUnit.gigabytes:
        return lang.gigabyte;
    }
  }
}
