import 'package:flutter/material.dart';

import 'radio_icon_tile.dart';

/// A desktop style radio button with an interactive label.
class RadioButton<T> extends StatelessWidget {
  /// Creates a new radio button.
  const RadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
  }) : super(key: key);

  /// See [Radio.value]
  final T value;

  /// See [Radio.groupValue]
  final T? groupValue;

  /// See [Radio.onChanged]
  final ValueChanged<T?>? onChanged;

  /// See [ListTile.title]
  final Widget? title;

  /// See [ListTile.subtitle]
  final Widget? subtitle;

  /// See [ListTile.contentPadding]
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged != null ? () => onChanged!(value) : null,
      child: MouseRegion(
        cursor: onChanged != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: RadioIconTile(
          contentPadding: contentPadding,
          icon: Radio<T>(
            value: value,
            groupValue: groupValue,
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
