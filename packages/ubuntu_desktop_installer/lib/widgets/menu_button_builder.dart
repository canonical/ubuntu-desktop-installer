import 'package:flutter/material.dart';

class MenuButtonBuilder<T> extends StatelessWidget {
  const MenuButtonBuilder({
    Key? key,
    required this.selected,
    required this.values,
    required this.onSelected,
    required this.iconBuilder,
    required this.itemBuilder,
  }) : super(key: key);

  final T selected;
  final List<T> values;
  final ValueChanged<T> onSelected;
  final ValueWidgetBuilder<T> iconBuilder;
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
