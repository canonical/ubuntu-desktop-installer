import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import '../../slides.dart';
import 'installation_slides_model.dart';

/// Slideshow during installation.
class InstallationSlidesPage extends StatefulWidget {
  /// Use [InstallationPage.create] instead.
  @visibleForTesting
  const InstallationSlidesPage({
    super.key,
  });

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
  State<InstallationSlidesPage> createState() => _InstallationSlidesPageState();
}

class _InstallationSlidesPageState extends State<InstallationSlidesPage> {
  final _titleController = PageController();

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      model.precacheSlideImages(context);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  String _formatEvent(InstallationEvent? event) {
    final lang = AppLocalizations.of(context);
    switch (event?.action) {
      case 'installing system':
        return lang.installingSystem;
      case 'final system configuration':
        return lang.configuringSystem;
      default:
        return lang.copyingFiles;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = Provider.of<InstallationSlidesModel>(context);
    final slides = SlidesContext.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: SizedBox(
          height: kYaruTitleBarHeight,
          child: PageView.builder(
            controller: _titleController,
            itemCount: slides.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: slides[index].title(context),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                SlideShow(
                  interval: const Duration(seconds: 50),
                  slides: slides.map((slide) => slide.body(context)).toList(),
                  onSlide: (index) {
                    _titleController.animateToPage(
                      index,
                      curve: kSlideCurve,
                      duration: kSlideDuration,
                    );
                  },
                ),
                Positioned.fill(
                  top: Theme.of(context).appBarTheme.toolbarHeight,
                  child: AnimatedSlide(
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 150),
                    offset: Offset(0, model.isLogVisible ? 0 : 1),
                    child: Container(
                      color: Theme.of(context).backgroundColor,
                      padding: const EdgeInsets.only(
                        top: kContentSpacing,
                        left: kContentSpacing,
                        right: kContentSpacing,
                      ),
                      child: _JournalView(journal: model.log),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Theme.of(context).backgroundColor,
            padding: const EdgeInsets.all(kContentSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      model.hasError
                          ? lang.installationFailed
                          : _formatEvent(model.event),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: model.hasError
                              ? Theme.of(context).errorColor
                              : null),
                    ),
                    const Spacer(),
                    YaruIconButton(
                      isSelected: model.isLogVisible,
                      icon: const Icon(Icons.terminal),
                      onPressed: model.toggleLogVisibility,
                    ),
                  ],
                ),
                const SizedBox(height: kContentSpacing),
                LinearProgressIndicator(
                  value: model.isInstalling ? null : 0,
                  backgroundColor: Theme.of(context).primaryColor.withAlpha(62),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _JournalView extends StatelessWidget {
  const _JournalView({required this.journal});

  final Stream<String> journal;

  @override
  Widget build(BuildContext context) {
    return LogView(
      log: journal,
      padding: const EdgeInsets.symmetric(horizontal: kContentSpacing),
      style: TextStyle(
        inherit: false,
        fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
        fontFamily: 'Ubuntu Mono',
        textBaseline: TextBaseline.alphabetic,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: kContentSpacing / 2),
      ),
      background: BoxDecoration(color: Theme.of(context).shadowColor),
    );
  }
}
