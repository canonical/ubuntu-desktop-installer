import 'package:flutter/material.dart';

import '../../constants.dart';
import 'wizard_action.dart';

export 'package:wizard_router/wizard_router.dart';
export 'wizard_action.dart';

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
    this.headerPadding = kHeaderPadding,
    this.content,
    this.contentPadding = kContentPadding,
    this.footer,
    this.footerPadding = kFooterPadding,
    this.actions = const <WizardAction>[],
  }) : super(key: key);

  /// The title widget in the app bar.
  final Widget? title;

  /// A header widget below the title.
  final Widget? header;

  /// Padding around the header widget.
  ///
  /// The default value is `kHeaderPadding`.
  final EdgeInsetsGeometry headerPadding;

  /// A content widget laid out below the header.
  final Widget? content;

  /// Padding around the content widget.
  ///
  /// The default value is `kContentPadding`.
  final EdgeInsetsGeometry contentPadding;

  /// A footer widget on the side of the buttons.
  final Widget? footer;

  /// Padding around the footer widget.
  ///
  /// The default value is `kFooterPadding`.
  final EdgeInsetsGeometry footerPadding;

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
            padding: headerPadding,
            child: header != null
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: header,
                  )
                : null,
          ),
          if (header != null) const SizedBox(height: kContentSpacing),
          Expanded(
            child: Padding(padding: contentPadding, child: content),
          ),
          const SizedBox(height: kContentSpacing),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: footerPadding,
        child: Row(
          mainAxisAlignment: footer != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: <Widget>[
            if (footer != null) Expanded(child: footer!),
            const SizedBox(width: kContentSpacing),
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              children: <Widget>[
                for (final action in actions)
                  if (action.visible ?? true)
                    Padding(
                      padding: const EdgeInsets.only(left: kButtonBarSpacing),
                      child: _createButton(action),
                    ),
                const SizedBox(width: kButtonBarSpacing),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _createButton(WizardAction action) {
    final maybeActivate = action.enabled ?? true ? action.onActivated : null;
    return action.highlighted == true
        ? ElevatedButton(onPressed: maybeActivate, child: Text(action.label!))
        : OutlinedButton(onPressed: maybeActivate, child: Text(action.label!));
  }
}
