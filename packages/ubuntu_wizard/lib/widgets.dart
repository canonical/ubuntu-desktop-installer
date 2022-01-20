import 'package:flutter/material.dart';

export 'src/widgets/animated_expanded.dart';
export 'src/widgets/check_button.dart';
export 'src/widgets/dropdown_builder.dart';
export 'src/widgets/flavor.dart';
export 'src/widgets/menu_button_builder.dart';
export 'src/widgets/option_card.dart';
export 'src/widgets/password_strength_label.dart';
export 'src/widgets/radio_button.dart';
export 'src/widgets/radio_icon_tile.dart';
export 'src/widgets/rounded_container.dart';
export 'src/widgets/rounded_list_view.dart';
export 'src/widgets/success_icon.dart';
export 'src/widgets/theme.dart';
export 'src/widgets/validated_form_field.dart';
export 'src/widgets/wizard_page.dart';

/// Calculates the appropriate height for a [ListTile]. This helps creating
/// balanced form layouts when mixing other widgets with [ListTile]s.
///
/// The logic was adapted from `flutter/lib/src/material/list_tile.dart`.
double defaultTileHeight(
  BuildContext context, {
  bool isTwoLine = false,
  bool isThreeLine = false,
}) {
  assert(!isTwoLine || !isThreeLine);

  final visualDensity = Theme.of(context).visualDensity;
  final baseDensity = visualDensity.baseSizeAdjustment;
  final isDense = ListTileTheme.of(context).dense == true;
  if (isThreeLine) {
    return (isDense ? 76.0 : 88.0) + baseDensity.dy;
  }
  if (isTwoLine) {
    return (isDense ? 64.0 : 72.0) + baseDensity.dy;
  }
  return (isDense ? 48.0 : 56.0) + baseDensity.dy;
}
