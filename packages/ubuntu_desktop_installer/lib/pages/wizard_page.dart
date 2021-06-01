import 'package:flutter/material.dart';

const _kButtonSpacing = 8.0;
const _kContentSpacing = 20.0;
const _kContentPadding = EdgeInsets.symmetric(horizontal: 24);
const _kHeaderPadding = EdgeInsets.fromLTRB(24, 24, 24, 0);
const _kFooterPadding = EdgeInsets.fromLTRB(24, 0, 24, 24);
const _kHighlightBackground = Color(0xFF0e8420);
const _kHighlightForeground = Colors.white;

/// Defines a wizard action, such as _Back_ or _Continue_.
class WizardAction {
  /// Creates a wizard action.
  const WizardAction({
    this.label,
    this.visible,
    this.highlighted,
    this.enabled,
    this.onActivated,
  });

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

/// The base for wizard pages in the installer.
///
/// Provides the appropriate layout and the common building blocks for
/// installation wizard pages.
class WizardPage extends StatelessWidget {
  /// Creates the wizard page.
  const WizardPage({
    Key? key,
    this.title,
    this.header,
    this.content,
    this.contentPadding = _kContentPadding,
    this.footer,
    this.actions = const <WizardAction>[],
  }) : super(key: key);

  /// The title widget in the app bar.
  final Widget? title;

  /// A header widget below the title.
  final Widget? header;

  /// A content widget laid out below the header.
  final Widget? content;

  /// Padding around the content widget.
  final EdgeInsetsGeometry contentPadding;

  /// A footer widget on the side of the buttons.
  final Widget? footer;

  /// A list of actions in the button bar.
  final List<WizardAction> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title, automaticallyImplyLeading: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: _kHeaderPadding,
            child: header != null
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: header,
                  )
                : null,
          ),
          if (header != null) const SizedBox(height: _kContentSpacing),
          Expanded(
            child: Padding(padding: contentPadding, child: content),
          ),
          const SizedBox(height: _kContentSpacing),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: _kFooterPadding,
        child: Row(
          mainAxisAlignment: footer != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: <Widget>[
            if (footer != null) Expanded(child: footer!),
            const SizedBox(width: _kContentSpacing),
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              children: <Widget>[
                for (final action in actions)
                  if (action.visible ?? true)
                    Padding(
                      padding: const EdgeInsets.only(left: _kButtonSpacing),
                      child: OutlinedButton(
                        onPressed:
                            action.enabled ?? true ? action.onActivated : null,
                        style: _buttonStyle(
                          context,
                          highlighted: action.highlighted ?? false,
                        ),
                        child: Text(action.label!),
                      ),
                    ),
                const SizedBox(width: _kButtonSpacing),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle? _buttonStyle(BuildContext context, {bool? highlighted}) {
    if (highlighted != true) return null;
    return OutlinedButtonTheme.of(context).style!.copyWith(
          backgroundColor: MaterialStateColor.resolveWith(
            (_) => _kHighlightBackground,
          ),
          foregroundColor: MaterialStateColor.resolveWith(
            (_) => _kHighlightForeground,
          ),
        );
  }
}
