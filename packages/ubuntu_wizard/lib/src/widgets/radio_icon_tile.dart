import 'package:flutter/material.dart';

import '../../constants.dart';

/// List tile with an icon that matches the geometry of [RadioListTile]'s radio
/// indicator.
class RadioIconTile extends StatelessWidget {
  /// Creates a radio icon tile.
  const RadioIconTile({
    Key? key,
    this.icon,
    this.title,
    this.contentPadding,
  }) : super(key: key);

  /// An icon shown centered within the bounding box of [RadioListTile]'s radio
  /// indicator.
  final Widget? icon;

  /// The primary content of the list tile.
  final Widget? title;

  /// The tile's internal padding.
  final EdgeInsetsGeometry? contentPadding;

  Size _calculateIconSize(BuildContext context) {
    final theme = Theme.of(context);
    final visualDensity = theme.radioTheme.visualDensity ?? theme.visualDensity;
    return kRadioSize + visualDensity.baseSizeAdjustment;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: contentPadding,
      leading: SizedBox.fromSize(
        size: _calculateIconSize(context),
        child: Center(child: icon),
      ),
      title: title,
    );
  }
}
