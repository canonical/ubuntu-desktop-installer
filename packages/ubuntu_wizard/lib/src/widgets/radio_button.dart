import 'package:flutter/material.dart';

const _kHorizontalSpacing = 8.0;
const _kRadioSize = Size.square(kMinInteractiveDimension - 8);
const _kVerticalSpacing = 2.0;

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
  final ValueChanged<T?> onChanged;

  /// See [ListTile.title]
  final Widget? title;

  /// See [ListTile.subtitle]
  final Widget? subtitle;

  /// See [ListTile.contentPadding]
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () => onChanged(value),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: _kRadioSize.width,
                height: _kRadioSize.height,
                child: Radio<T>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
              ),
              const SizedBox(width: _kHorizontalSpacing),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (title != null)
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.subtitle1!,
                        overflow: TextOverflow.ellipsis,
                        child: title!,
                      ),
                    if (title != null && subtitle != null)
                      const SizedBox(height: _kVerticalSpacing),
                    if (subtitle != null)
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.caption!,
                        overflow: TextOverflow.ellipsis,
                        child: subtitle!,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
