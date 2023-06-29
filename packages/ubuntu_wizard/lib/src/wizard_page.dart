import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

/// The spacing between header, content, and footer.
const kWizardSpacing = kYaruPagePadding;

/// The padding around the content.
const kWizardPadding = EdgeInsets.symmetric(horizontal: kWizardSpacing);

/// The fraction of wizard width in relation to the page.
const kWizardWidthFraction = 0.7;

/// The indentation to align with radio indicators etc.
const kWizardIndentation =
    EdgeInsetsDirectional.only(start: kWizardSpacing * 2);

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
    this.headerPadding = const EdgeInsets.fromLTRB(
        kYaruPagePadding, kYaruPagePadding, kYaruPagePadding, 0),
    this.content,
    this.contentPadding = kWizardPadding,
    this.contentSpacing = kWizardSpacing,
    this.snackBar,
    this.bottomBar,
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

  /// A snack bar to display above the buttons.
  final SnackBar? snackBar;

  /// The bottom bar
  final Widget? bottomBar;

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
        bottomNavigationBar: widget.bottomBar,
      ),
    );
  }
}
