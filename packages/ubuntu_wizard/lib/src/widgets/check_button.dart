import 'package:flutter/material.dart';

const _kHorizontalSpacing = 8.0;
const _kRadioSize = Size.square(kMinInteractiveDimension - 8);
const _kVerticalSpacing = 2.0;

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
  final ValueChanged<bool?> onChanged;

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
        onTap: () => onChanged(!value),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: _kRadioSize.width,
                height: _kRadioSize.height,
                child: Checkbox(
                  value: value,
                  onChanged: (v) => onChanged(v!),
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
