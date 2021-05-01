import 'package:flutter/material.dart';

class DropdownBuilder<T> extends StatelessWidget {
  const DropdownBuilder({
    Key? key,
    this.selected,
    required this.values,
    required this.onSelected,
    required this.itemBuilder,
  }) : super(key: key);

  final T? selected;
  final List<T> values;
  final ValueChanged<T> onSelected;
  final ValueWidgetBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: selected,
      items: values.map((value) {
        return DropdownMenuItem<T>(
          value: value,
          child: itemBuilder(context, value, null),
        );
      }).toList(),
      isExpanded: true,
      icon: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).hintColor,
        ),
      ),
      onChanged: (value) => onSelected(value!),
    );
  }
}
