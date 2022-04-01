import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import '../../slides.dart';
import 'installation_slides_model.dart';

// The amount of log lines shown when expanded.
const kLogLines = 10;

/// Slideshow during installation.
class InstallationSlidesPage extends StatefulWidget {
  /// Use [InstallationPage.create] instead.
  @visibleForTesting
  const InstallationSlidesPage({
    Key? key,
  }) : super(key: key);

  /// Creates a [InstallationSlidesPage] with [InstallationSlidesModel].
  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    final journal = getService<JournalService>();
    return ChangeNotifierProvider(
      create: (_) => InstallationSlidesModel(client, journal),
      child: const InstallationSlidesPage(),
    );
  }

  @override
  InstallationSlidesPageState createState() => InstallationSlidesPageState();
}

@visibleForTesting
class InstallationSlidesPageState extends State<InstallationSlidesPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<InstallationSlidesModel>(context, listen: false);
    model.addListener(() {
      if (model.isDone) {
        Wizard.of(context).next();
      }
    });
    model.init();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!mounted) return;
      model.precacheSlideImages(context);
    });
  }

  static TextStyle _getTextStyle(BuildContext context) {
    return TextStyle(
      inherit: false,
      fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
      fontFamily: 'Ubuntu Mono',
      textBaseline: TextBaseline.alphabetic,
    );
  }

  static double getTextHeight(BuildContext context, {int lines = 1}) {
    final painter = TextPainter(
      text: TextSpan(
        text: 'X',
        style: _getTextStyle(context),
      ),
      maxLines: lines,
      locale: Localizations.localeOf(context),
      textDirection: Directionality.of(context),
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
    );
    painter.layout();
    return lines * painter.height;
  }

  // ignore: avoid_positional_boolean_parameters
  void _expandWindow(bool expand) {
    final model = Provider.of<InstallationSlidesModel>(context, listen: false);
    if (expand) {
      model.expandWindow(getTextHeight(context, lines: kLogLines));
    } else {
      model.collapseWindow();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = Provider.of<InstallationSlidesModel>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          SlideShow(
            interval: const Duration(seconds: 50),
            slides: SlidesContext.of(context)
                .map((slide) => _SlidePage(slide: slide))
                .toList(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(kContentSpacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ExpandButton(
                        isExpanded: model.isWindowExpanded,
                        onExpanded: _expandWindow,
                        child: Text(
                          model.hasError
                              ? lang.installationFailed
                              : lang.copyingFiles,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: model.hasError
                                      ? Theme.of(context).errorColor
                                      : null),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kContentSpacing),
                  Flexible(
                    flex: model.isWindowExpanded ? 1 : 0,
                    child: Visibility(
                      maintainState: true,
                      visible: model.isWindowExpanded,
                      child: _JournalView(
                        journal: model.journal,
                        style: _getTextStyle(context),
                      ),
                    ),
                  ),
                  LinearProgressIndicator(
                    value: model.isInstalling ? null : 0,
                    backgroundColor:
                        Theme.of(context).primaryColor.withAlpha(62),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpandButton extends StatelessWidget {
  const _ExpandButton({
    Key? key,
    required this.isExpanded,
    required this.onExpanded,
    required this.child,
  }) : super(key: key);

  final bool isExpanded;
  final ValueChanged<bool> onExpanded;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onExpanded(!isExpanded),
      child: MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: kThemeAnimationDuration,
              child: Icon(Icons.arrow_right),
              transform: Matrix4.rotationZ(isExpanded ? math.pi / 2 : 0),
              transformAlignment: Alignment.center,
            ),
            child,
          ],
        ),
      ),
    );
  }
}

class _SlidePage extends StatelessWidget {
  const _SlidePage({
    Key? key,
    required this.slide,
  }) : super(key: key);

  final Slide slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppBar(
          title: slide.title(context),
          automaticallyImplyLeading: false,
        ),
        slide.body(context),
      ],
    );
  }
}

class _JournalView extends StatelessWidget {
  const _JournalView({
    Key? key,
    required this.style,
    required this.journal,
  }) : super(key: key);

  final TextStyle style;
  final Stream<String> journal;

  @override
  Widget build(BuildContext context) {
    return LogView(
      log: journal,
      padding: const EdgeInsets.symmetric(horizontal: kContentSpacing),
      style: style,
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: kContentSpacing / 2),
      ),
      background: BoxDecoration(color: Theme.of(context).shadowColor),
    );
  }
}
