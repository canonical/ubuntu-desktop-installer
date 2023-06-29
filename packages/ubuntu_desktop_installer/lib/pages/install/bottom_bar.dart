import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kYaruPagePadding,
        right: kYaruPagePadding,
        bottom: kYaruPagePadding,
      ),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 20),
          ],
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(child: title ?? const SizedBox.shrink()),
                    if (trailing != null) ...[
                      const SizedBox(width: 20),
                      trailing!,
                    ],
                  ],
                ),
                if (subtitle != null) subtitle!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
