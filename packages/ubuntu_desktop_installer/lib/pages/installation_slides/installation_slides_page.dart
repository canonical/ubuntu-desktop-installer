import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import '../../slides.dart';
import 'installation_slides_model.dart';

extension InstallationActionL10n on InstallationAction {
  String localize(AppLocalizations lang) {
    switch (this) {
      case InstallationAction.installingSystem:
        return lang.installingSystem;
      case InstallationAction.configuringSystem:
        return lang.configuringSystem;
      case InstallationAction.copyingFiles:
        return lang.copyingFiles;
      case InstallationAction.none:
        return '';
    }
  }
}

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

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = Provider.of<InstallationSlidesModel>(context);
    final slides = SlidesContext.of(context);
    final titlePadding = kYaruWindowControlSize +
        (YaruTitleBarTheme.of(context).buttonPadding ?? EdgeInsets.zero)
            .horizontal;
    return Scaffold(
      appBar: YaruWindowTitleBar(
        titleSpacing: 0,
        centerTitle: false,
        title: SizedBox(
          height: kYaruTitleBarHeight,
          child: PageView.builder(
            controller: _titleController,
            itemCount: slides.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(start: titlePadding),
              child: Center(
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
                  child: AnimatedSlide(
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 150),
                    offset: Offset(0, model.isLogVisible ? 0 : 1),
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
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
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.all(kContentSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      model.hasError
                          ? lang.installationFailed
                          : model.event.action.localize(lang),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: model.hasError
                              ? Theme.of(context).colorScheme.error
                              : null),
                    ),
                    const Spacer(),
                    YaruIconButton(
                      isSelected: model.isLogVisible,
                      icon: const Icon(YaruIcons.terminal),
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
        fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
        fontFamily: 'Ubuntu Mono',
        textBaseline: TextBaseline.alphabetic,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: kContentSpacing / 2),
      ),
      background: BoxDecoration(color: Theme.of(context).shadowColor),
    );
  }
}
