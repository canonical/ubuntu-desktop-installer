import 'package:flutter/widgets.dart';
import 'package:wizard_router/wizard_router.dart';

import '../../l10n.dart';

/// Defines a wizard action, such as _Back_ or _Continue_.
///
/// See also:
///  * [WizardAction.next]
///  * [WizardAction.back]
class WizardAction {
  /// Creates a wizard action.
  const WizardAction({
    this.label,
    this.visible,
    this.highlighted,
    this.enabled,
    this.onActivated,
  });

  /// A _Go Back_ action action that returns back to the previous page.
  factory WizardAction.back(
    BuildContext context, {
    bool? visible,
    bool? enabled,
    VoidCallback? onActivated,
  }) {
    return WizardAction(
      label: UbuntuLocalizations.of(context).backAction,
      visible: visible,
      enabled: enabled ?? Wizard.of(context).hasPrevious,
      onActivated: () {
        if (onActivated != null) {
          onActivated();
        } else {
          Wizard.of(context).back();
        }
      },
    );
  }

  /// A _Continue_ action that advances to the next page.
  factory WizardAction.next(
    BuildContext context, {
    bool? visible,
    bool? enabled,
    VoidCallback? onActivated,
  }) {
    return WizardAction(
      label: UbuntuLocalizations.of(context).continueAction,
      visible: visible,
      enabled: enabled,
      onActivated: () {
        if (onActivated != null) {
          onActivated();
        } else {
          Wizard.of(context).next();
        }
      },
    );
  }

  /// Text label of the back button.
  final String? label;

  /// Determines whether the action is visible.
  ///
  /// The default value is `true`
  final bool? visible;

  /// Determines whether the action is highlighted (green);
  ///
  /// The default value is `false`.
  final bool? highlighted;

  /// Determines whether the action is enabled.
  ///
  /// The default value is `false`. If not specified, the action is implicitly
  /// disabled if [onActivated] is `null`.
  final bool? enabled;

  /// Called when the action is triggered e.g. by pressing the action button.
  ///
  /// See also [enabled].
  final VoidCallback? onActivated;
}
