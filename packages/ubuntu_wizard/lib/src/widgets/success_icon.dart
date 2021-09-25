import 'package:flutter/material.dart';
import 'theme.dart';

/// Presents successful form validation state.
///
/// See also:
///  * [ValidatedFormField]
class SuccessIcon extends StatelessWidget {
  /// Creates the icon.
  const SuccessIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.check_circle, color: Theme.of(context).successColor);
  }
}
