import 'package:flutter/material.dart';
import 'package:wizard_router/wizard_router.dart';
import 'package:yaru_widgets/widgets.dart';

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
    this.contentSpacing = kContentSpacing,
    this.footer,
    this.footerPadding = kFooterPadding,
    this.actions = const <WizardAction>[],
    this.snackBar,
  });

  /// The title widget.
  final PreferredSizeWidget? title;

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

  /// The spacing between the content and the header and footer.
  ///
  /// The default value is `kContentSpacing`.
  final double contentSpacing;

  /// A footer widget on the side of the buttons.
  final Widget? footer;

  /// A snack bar to display above the buttons.
  final SnackBar? snackBar;

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    if (widget.snackBar != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final messenger = ScaffoldMessenger.of(_scaffoldKey.currentContext!);
        messenger.removeCurrentSnackBar();
        messenger.showSnackBar(widget.snackBar!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final wizardScope = Wizard.maybeOf(context);
    final totalSteps = (wizardScope?.wizardData as int?);
    final currentStep = (wizardScope?.routeData as int?);
    return ScaffoldMessenger(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: widget.title,
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
            if (widget.header != null) SizedBox(height: widget.contentSpacing),
            Expanded(
              child: Padding(
                  padding: widget.contentPadding, child: widget.content),
            ),
            SizedBox(height: widget.contentSpacing),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: widget.footerPadding,
          child: Row(
            children: [
              widget.footer != null
                  ? Expanded(child: widget.footer!)
                  : const Spacer(),
              if (currentStep != null && totalSteps != null)
                YaruPageIndicator(
                  page: currentStep,
                  length: totalSteps,
                  dotSize: 12,
                  dotSpacing: 8,
                ),
              Expanded(
                child: ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  children: <Widget>[
                    for (final action in widget.actions)
                      if (action.visible ?? true)
                        Padding(
                          padding:
                              const EdgeInsets.only(left: kButtonBarSpacing),
                          child: _createButton(context, action),
                        ),
                  ],
                ),
              ),
            ],
          ),
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
