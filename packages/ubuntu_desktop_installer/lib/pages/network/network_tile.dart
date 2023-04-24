import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class NetworkTile extends StatelessWidget {
  const NetworkTile(
      {super.key, this.leading, this.title, this.subtitle, this.trailing});

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return YaruTile(
      padding: EdgeInsets.zero,
      leading: SizedBox(width: 32, child: leading),
      title: title ?? const SizedBox.shrink(),
      subtitle: subtitle,
      trailing: trailing,
    );
  }
}
