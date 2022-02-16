import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../services.dart';
import '../../slides.dart';
import 'installation_slides_model.dart';

// The size of the rotating expansion icon.
const _kExpandIconSize = 24.0;

// The amount of extra lines shown when expanded.
const kExpandLines = 6;

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
      fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
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
      model.expandWindow(getTextHeight(context, lines: kExpandLines));
    } else {
      model.collapseWindow();
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InstallationSlidesModel>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SlideShow(
                interval: const Duration(seconds: 50),
                slides: SlidesContext.of(context)
                    .map((slide) => _SlidePage(slide: slide))
                    .toList(),
              ),
              Positioned(
                left: kContentSpacing,
                bottom: kContentSpacing / 2,
                child: _ExpandButton(
                  isExpanded: model.isWindowExpanded,
                  onExpanded: _expandWindow,
                  child: Text(
                    model.hasError
                        ? 'Something went wrong.\n\nPlease restart the machine.'
                        : model.isPreparing
                            ? 'Preparing...'
                            : 'Installing... (${model.installationStep + 1}/${model.installationStepCount})',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: model.hasError
                            ? Theme.of(context).errorColor
                            : Colors.white),
                  ),
                ),
              ),
            ],
          ),
          LinearProgressIndicator(value: model.isInstalling ? null : 0),
          Expanded(
            child: _JournalView(
              journal: model.journal,
              style: _getTextStyle(context),
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
            SizedBox(
              width: _kExpandIconSize,
              height: _kExpandIconSize,
              child: ExpandIcon(
                color: Colors.white,
                size: _kExpandIconSize,
                padding: EdgeInsets.zero,
                isExpanded: isExpanded,
                onPressed: (_) => onExpanded(!isExpanded),
              ),
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
