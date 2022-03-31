import 'package:flutter/material.dart';

import 'radio_icon_tile.dart';

/// A desktop style checkbox with an interactive label.
class CheckButton extends StatelessWidget {
  /// Creates a new check button.
  const CheckButton({
    Key? key,
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
  }) : super(key: key);

  /// See [Checkbox.value]
  final bool value;

  /// See [Checkbox.onChanged]
  final ValueChanged<bool?>? onChanged;

  /// See [ListTile.title]
  final Widget? title;

  /// See [ListTile.subtitle]
  final Widget? subtitle;

  /// See [ListTile.contentPadding]
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: MouseRegion(
        cursor: onChanged != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: RadioIconTile(
          contentPadding: contentPadding,
          icon: Checkbox(
            value: value,
            onChanged: onChanged,
          ),
          title: title,
          subtitle: subtitle,
          enabled: onChanged != null,
        ),
      ),
    );
  }
}
