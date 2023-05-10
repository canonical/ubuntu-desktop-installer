import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:wizard_router/wizard_router.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

/// Wizard activation callback signature.
typedef WizardCallback = FutureOr<void> Function();

const _kLoadingDelay = Duration(milliseconds: 100);
final _noAnimation = Listenable.merge([]);

/// Defines a wizard button, such as _Previous_ or _Next_.
///
/// See also:
///  * [WizardButton.next]
///  * [WizardButton.previous]
class WizardButton extends StatefulWidget {
  /// Creates a wizard button.
  const WizardButton({
    super.key,
    this.label,
    this.visible,
    this.highlighted,
    this.flat,
    this.enabled,
    this.loading,
    this.onActivated,
    this.execute,
  });

  /// A _Previous_ button that returns back to the previous page.
  static Widget previous(
    BuildContext context, {
    bool? visible,
    bool? enabled,
    WizardCallback? onBack,
    bool root = false,
  }) {
    final wizard = Wizard.maybeOf(context, root: root);
    return AnimatedBuilder(
      animation: wizard?.controller ?? _noAnimation,
      builder: (context, child) => WizardButton(
        label: UbuntuLocalizations.of(context).previousLabel,
        visible: visible,
        flat: true,
        enabled: wizard?.isLoading != true &&
            (enabled ?? wizard?.hasPrevious ?? false),
        onActivated: onBack,
        execute: wizard?.back,
      ),
    );
  }

  /// A _Next_ button that advances to the next page.
  static Widget next(
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
    final wizard = Wizard.maybeOf(context, root: root);
    return AnimatedBuilder(
      animation: wizard?.controller ?? _noAnimation,
      builder: (context, child) => WizardButton(
        label: label ?? UbuntuLocalizations.of(context).nextLabel,
        visible: visible,
        enabled: wizard?.isLoading != true && (enabled ?? true),
        loading: wizard?.isLoading ?? false,
        flat: flat,
        highlighted: highlighted,
        onActivated: onNext,
        execute: () async {
          await wizard?.next(arguments: arguments);
          onBack?.call();
        },
      ),
    );
  }

  /// Text label of the button.
  final String? label;

  /// Determines whether the button is visible.
  ///
  /// The default value is `true`
  final bool? visible;

  /// Determines whether the button is flat (no background).
  ///
  /// The default value is `false`.
  final bool? flat;

  /// Determines whether the button is highlighted (green);
  ///
  /// The default value is `false`.
  final bool? highlighted;

  /// Determines whether the button is enabled.
  ///
  /// The default value is `false`. If not specified, the button is implicitly
  /// disabled if [onActivated] is `null`.
  final bool? enabled;

  /// Determines whether the button is in loading state and shows a spinner
  /// (after a 100ms delay) instead of the label.
  final bool? loading;

  /// Called when the button is triggered e.g. by pressing the button, _before_
  /// proceeding to the next page or returning to the previous page.
  ///
  /// See also [enabled].
  final WizardCallback? onActivated;

  /// Called to execute the button i.e. to proceed to the next page or to return
  /// to the previous page, _after_ the button was activated.
  ///
  /// See also [enabled].
  final VoidCallback? execute;

  @override
  State<WizardButton> createState() => _WizardButtonState();
}

class _WizardButtonState extends State<WizardButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.visible == false) {
      return const SizedBox.shrink();
    }

    final maybeActivate = widget.enabled ?? true
        ? () async {
            await widget.onActivated?.call();
            if (mounted) widget.execute?.call();
          }
        : null;

    return FutureBuilder(
      key: ValueKey(widget.loading),
      future: widget.loading == true
          ? Future.delayed(_kLoadingDelay, () => widget.loading)
          : null,
      builder: (context, snapshot) {
        final child = snapshot.data == true
            ? SizedBox.square(
                dimension: IconTheme.of(context).size,
                child: const YaruCircularProgressIndicator(strokeWidth: 3),
              )
            : Text(widget.label!);

        return ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 136),
          child: widget.highlighted == true
              ? ElevatedButton(onPressed: maybeActivate, child: child)
              : widget.flat == true
                  ? OutlinedButton(onPressed: maybeActivate, child: child)
                  : FilledButton(onPressed: maybeActivate, child: child),
        );
      },
    );
  }
}
