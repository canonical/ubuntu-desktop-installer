import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'try_or_install_model.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final Widget title;
  final Widget? subtitle;
  final Option value;
  final Option groupValue;
  final ValueChanged<Option?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 500),
      decoration: BoxDecoration(
        color: value == groupValue ? scheme.primary.withOpacity(0.1) : null,
        border: Border.all(
            color: value == groupValue ? scheme.primary : Colors.transparent),
        borderRadius: BorderRadius.circular(kYaruButtonRadius),
      ),
      child: YaruRadioButton<Option>(
        contentPadding: const EdgeInsetsDirectional.fromSTEB(15, 10, 60, 10),
        title: DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.bold),
          child: title,
        ),
        subtitle: subtitle,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
