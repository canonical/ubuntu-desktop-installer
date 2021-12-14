import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/constants.dart';

class NetworkTile extends StatelessWidget {
  const NetworkTile(
      {Key? key, this.leading, this.title, this.subtitle, this.trailing})
      : super(key: key);

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.fromSize(
          size: kRadioSize,
          child: Center(child: leading),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                DefaultTextStyle(
                  child: title!,
                  style: Theme.of(context).textTheme.subtitle1!,
                ),
              if (title != null && subtitle != null) const SizedBox(height: 2),
              if (subtitle != null)
                DefaultTextStyle(
                  child: subtitle!,
                  style: Theme.of(context).textTheme.bodyText2!,
                ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox.fromSize(
          size: kRadioSize,
          child: Center(child: trailing),
        ),
      ],
    );
  }
}
