import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:wizard_router/wizard_router.dart';

/// Wizard activation callback signature.
typedef WizardCallback = FutureOr<void> Function();

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
    this.flat,
    this.enabled,
    this.onActivated,
    this.execute,
  });

  /// A _Go Back_ action action that returns back to the previous page.
  factory WizardAction.back(
    BuildContext context, {
    bool? visible,
    bool? enabled,
    WizardCallback? onBack,
    bool root = false,
  }) {
    return WizardAction(
      label: UbuntuLocalizations.of(context).previousLabel,
      visible: visible,
      flat: true,
      enabled:
          enabled ?? Wizard.maybeOf(context, root: root)?.hasPrevious ?? false,
      onActivated: onBack,
      execute: () => Wizard.maybeOf(context, root: root)?.back(),
    );
  }

  /// A _Continue_ action that advances to the next page.
  factory WizardAction.next(
    BuildContext context, {
    String? label,
    bool? visible,
    bool? enabled,
    bool? flat,
    bool? highlighted,
    Object? arguments,
    WizardCallback? onNext,
    WizardCallback? onBack,
    bool root = false,
  }) {
    return WizardAction(
      label: label ?? UbuntuLocalizations.of(context).nextLabel,
      visible: visible,
      enabled: enabled,
      flat: flat,
      highlighted: highlighted,
      onActivated: onNext,
      execute: () async {
        await Wizard.maybeOf(context, root: root)?.next(arguments: arguments);
        onBack?.call();
      },
    );
  }

  /// An action that finishes the wizard.
  factory WizardAction.done(
    BuildContext context, {
    String? label,
    bool? visible,
    bool? enabled,
    bool? flat,
    bool? highlighted,
    Object? result,
    WizardCallback? onDone,
    bool root = false,
  }) {
    return WizardAction(
      label: label,
      visible: visible,
      enabled: enabled,
      flat: flat,
      highlighted: highlighted,
      onActivated: onDone,
      execute: () => Wizard.maybeOf(context, root: root)?.done(result: result),
    );
  }

  /// Text label of the back button.
  final String? label;

  /// Determines whether the action is visible.
  ///
  /// The default value is `true`
  final bool? visible;

  /// Determines whether the action is flat (no background).
  ///
  /// The default value is `false`.
  final bool? flat;

  /// Determines whether the action is highlighted (green);
  ///
  /// The default value is `false`.
  final bool? highlighted;

  /// Determines whether the action is enabled.
  ///
  /// The default value is `false`. If not specified, the action is implicitly
  /// disabled if [onActivated] is `null`.
  final bool? enabled;

  /// Called when the action is triggered e.g. by pressing the action button,
  /// _before_ proceeding to the next page or returning to the previous page.
  ///
  /// See also [enabled].
  final WizardCallback? onActivated;

  /// Called to execute the action i.e. to proceed to the next page or to return
  /// to the previous page, _after_ the action was activated.
  ///
  /// See also [enabled].
  final VoidCallback? execute;
}
