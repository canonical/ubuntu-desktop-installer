import 'package:flutter/material.dart';

import '../../constants.dart';

const _kHorizontalSpacing = 8.0;
const _kVerticalSpacing = 2.0;

/// List tile with an icon that matches the geometry of [RadioButton]'s radio
/// indicator.
class RadioIconTile extends StatelessWidget {
  /// Creates a radio icon tile.
  const RadioIconTile({
    Key? key,
    this.icon,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.enabled = true,
  }) : super(key: key);

  /// An icon shown centered within the bounding box of [RadioButton]'s radio
  /// indicator.
  final Widget? icon;

  /// The primary content of the list tile.
  final Widget? title;

  /// The secondary content of the list tile.
  final Widget? subtitle;

  /// The tile's internal padding.
  final EdgeInsetsGeometry? contentPadding;

  /// When [enabled] is false, the text color is set to [ThemeData.disabledColor].
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final textColor = !enabled ? Theme.of(context).disabledColor : null;
    return Padding(
      padding: contentPadding ?? EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: kRadioSize.width,
            height: kRadioSize.height,
            child: Center(child: icon),
          ),
          const SizedBox(width: _kHorizontalSpacing),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (title != null)
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: textColor),
                    overflow: TextOverflow.ellipsis,
                    child: title!,
                  ),
                if (title != null && subtitle != null)
                  const SizedBox(height: _kVerticalSpacing),
                if (subtitle != null)
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: textColor),
                    overflow: TextOverflow.ellipsis,
                    child: subtitle!,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
