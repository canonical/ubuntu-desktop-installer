import 'package:flutter/material.dart';

/// A builder widget that makes it straight-forward to build a menu button
/// for an arbitrary list of values.
///
/// The following example creates a menu button for choosing enum values:
/// ```dart
/// MenuButtonBuilder<MyEnum>(
///   values: MyEnum.values,
///   selected: model.enumValue,
///   onSelected: (value) => model.enumValue = value,
///   iconBuilder: (context, value, _) => _toIcon(value),
///   itemBuilder: (context, value, _) => Text(value.toString()),
/// )
/// ```
///
/// See also:
///  * [DropdownBuilder] - A similar builder widget but for dropdowns.
class MenuButtonBuilder<T> extends StatelessWidget {
  /// Creates a menu button with the given `values`.
  ///
  /// The `onSelected` callback is called when the user selects an item.
  ///
  /// The `itemBuilder` function is called for each item in the menu.
  /// The returned widgets are set as children of the popup menu items.
  ///
  /// The `iconBuilder` function is called for the selected item. The returned
  /// widget is set as an icon of the menu button.
  ///
  const MenuButtonBuilder({
    Key? key,
    required this.selected,
    required this.values,
    required this.onSelected,
    required this.iconBuilder,
    required this.itemBuilder,
  }) : super(key: key);

  /// The currently selected value.
  final T selected;

  /// The list of values.
  ///
  /// For enums, use the enum's `values` constant.
  final List<T> values;

  /// Called when the user selects an item.
  final ValueChanged<T> onSelected;

  /// Builds an icon for the given `value`.
  ///
  /// Note: The returned widget is set as an icon of [PopupMenuButton].
  final ValueWidgetBuilder<T> iconBuilder;

  /// Builds a menu item for the given `value`.
  ///
  /// Note: The returned widget is set as a child of [CheckedPopupMenuItem].
  final ValueWidgetBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      initialValue: selected,
      onSelected: onSelected,
      icon: iconBuilder(context, selected, null),
      itemBuilder: (context) {
        return values.map((value) {
          return CheckedPopupMenuItem<T>(
            value: value,
            checked: value == selected,
            child: itemBuilder(context, value, null),
          );
        }).toList();
      },
    );
  }
}
