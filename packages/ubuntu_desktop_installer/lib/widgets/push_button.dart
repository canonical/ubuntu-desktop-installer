import 'package:flutter/material.dart';

const kPushButtonSize = Size(136, 36);

abstract class PushButton extends ButtonStyleButton {
  const factory PushButton.elevated({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus,
    Clip clipBehavior,
    MaterialStatesController? statesController,
    required Widget child,
  }) = _ElevatedPushButton;

  const factory PushButton.filled({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus,
    Clip clipBehavior,
    MaterialStatesController? statesController,
    required Widget child,
  }) = _FilledPushButton;

  const factory PushButton.outlined({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus,
    Clip clipBehavior,
    MaterialStatesController? statesController,
    required Widget child,
  }) = _OutlinedPushButton;
}

class _ElevatedPushButton extends ElevatedButton implements PushButton {
  const _ElevatedPushButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
  });

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return super.defaultStyleOf(context).applyMinimumSize(kPushButtonSize);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButtonTheme.of(context)
        .style
        ?.applyMinimumSize(kPushButtonSize);
  }
}

class _FilledPushButton extends FilledButton implements PushButton {
  const _FilledPushButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
  });

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return super.defaultStyleOf(context).applyMinimumSize(kPushButtonSize);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return FilledButtonTheme.of(context)
        .style
        ?.applyMinimumSize(kPushButtonSize);
  }
}

class _OutlinedPushButton extends OutlinedButton implements PushButton {
  const _OutlinedPushButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
  });

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return super.defaultStyleOf(context).applyMinimumSize(kPushButtonSize);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return OutlinedButtonTheme.of(context)
        .style
        ?.applyMinimumSize(kPushButtonSize);
  }
}

extension on ButtonStyle {
  ButtonStyle applyMinimumSize(Size size) {
    return copyWith(minimumSize: MaterialStateProperty.all(size));
  }
}
