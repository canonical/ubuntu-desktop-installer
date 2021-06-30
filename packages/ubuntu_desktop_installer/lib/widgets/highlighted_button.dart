import 'package:flutter/material.dart';

const _kHighlightBackground = Color(0xFF0e8420);
const _kHighlightForeground = Colors.white;

class HighlightedButton extends StatelessWidget {
  const HighlightedButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButtonTheme.of(context).style!.copyWith(
            backgroundColor: MaterialStateColor.resolveWith(
              (_) => _kHighlightBackground,
            ),
            foregroundColor: MaterialStateColor.resolveWith(
              (_) => _kHighlightForeground,
            ),
          ),
      onPressed: onPressed,
      child: child,
    );
  }
}
