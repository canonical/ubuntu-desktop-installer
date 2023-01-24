import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

/// Presents successful form validation state.
///
/// See also:
///  * [ValidatedFormField]
class SuccessIcon extends StatelessWidget {
  /// Creates the icon.
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.check_circle, color: Theme.of(context).successColor);
  }
}

/// Presents unsuccessful form validation state.
///
/// See also:
///  * [ValidatedFormField]
class ErrorIcon extends StatelessWidget {
  const ErrorIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.error, color: Theme.of(context).colorScheme.error);
  }
}
