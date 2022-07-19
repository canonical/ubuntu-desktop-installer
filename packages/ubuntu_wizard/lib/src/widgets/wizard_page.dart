import 'package:flutter/material.dart';

import '../../constants.dart';
import 'wizard_action.dart';

export 'package:wizard_router/wizard_router.dart';
export 'wizard_action.dart';

/// The base for wizard pages in the installer.
///
/// Provides the appropriate layout and the common building blocks for
/// installation wizard pages.
class WizardPage extends StatefulWidget {
  /// Creates the wizard page.
  const WizardPage({
    super.key,
    this.title,
    this.header,
    this.headerPadding = kHeaderPadding,
    this.content,
    this.contentPadding = kContentPadding,
    this.footer,
    this.footerPadding = kFooterPadding,
    this.actions = const <WizardAction>[],
  });

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
  State<WizardPage> createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: widget.title, automaticallyImplyLeading: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: widget.headerPadding,
            child: widget.header != null
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: widget.header,
                  )
                : null,
          ),
          if (widget.header != null) const SizedBox(height: kContentSpacing),
          Expanded(
            child:
                Padding(padding: widget.contentPadding, child: widget.content),
          ),
          const SizedBox(height: kContentSpacing),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: widget.footerPadding,
        child: Row(
          mainAxisAlignment: widget.footer != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: <Widget>[
            if (widget.footer != null) Expanded(child: widget.footer!),
            const SizedBox(width: kContentSpacing),
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              children: <Widget>[
                for (final action in widget.actions)
                  if (action.visible ?? true)
                    Padding(
                      padding: const EdgeInsets.only(left: kButtonBarSpacing),
                      child: _createButton(context, action),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _createButton(BuildContext context, WizardAction action) {
    final maybeActivate = action.enabled ?? true
        ? () async {
            await action.onActivated?.call();
            if (mounted) action.execute?.call();
          }
        : null;
    return action.highlighted == true
        ? ElevatedButton(onPressed: maybeActivate, child: Text(action.label!))
        : OutlinedButton(onPressed: maybeActivate, child: Text(action.label!));
  }
}
