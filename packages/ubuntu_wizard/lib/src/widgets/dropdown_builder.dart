import 'package:flutter/material.dart';

/// A builder widget that makes it straight-forward to build a dropdown
/// for an arbitrary list of values.
///
/// The following example creates a dropdown for choosing enum values:
/// ```dart
/// DropdownBuilder<MyEnum>(
///   values: MyEnum.values,
///   selected: model.enumValue,
///   onSelected: (value) => model.enumValue = value,
///   itemBuilder: (context, value, _) => Text(value.toString()),
/// )
/// ```
///
/// See also:
///  * [MenuButtonBuilder] - A similar builder widget but for menu buttons.
class DropdownBuilder<T> extends StatefulWidget {
  /// Creates a dropdown with the given `values`.
  ///
  /// The `onSelected` callback is called when the user selects an item.
  ///
  /// Optionally, the currently `selected` value can be specified too.
  ///
  /// The `itemBuilder` function is called for each item in the dropdown menu.
  /// The returned widgets are set as children of the dropdown menu items.
  const DropdownBuilder({
    Key? key,
    this.selected,
    required this.values,
    required this.onSelected,
    required this.itemBuilder,
  }) : super(key: key);

  /// The currently selected value or `null` if no value is selected.
  final T? selected;

  /// The list of values.
  ///
  /// For enums, use the enum's `values` constant.
  final List<T> values;

  /// Called when the user selects an item.
  final ValueChanged<T?> onSelected;

  /// Builds a dropdown item for the given `value`.
  ///
  /// Note: The returned widget is set as a child of [DropDownMenuItem].
  final ValueWidgetBuilder<T> itemBuilder;

  @override
  State<DropdownBuilder<T>> createState() => _DropdownBuilderState<T>();
}

class _DropdownBuilderState<T> extends State<DropdownBuilder<T>> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonHideUnderline(
        child: AnimatedBuilder(
          animation: _focusNode,
          builder: (context, child) {
            return InputDecorator(
              isFocused: _focusNode.hasFocus,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
              child: child,
            );
          },
          child: DropdownButton<T>(
            value: widget.selected,
            items: widget.values.map((value) {
              return DropdownMenuItem<T>(
                value: value,
                child: widget.itemBuilder(context, value, null),
              );
            }).toList(),
            onChanged: widget.onSelected,
            focusNode: _focusNode,
            focusColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
