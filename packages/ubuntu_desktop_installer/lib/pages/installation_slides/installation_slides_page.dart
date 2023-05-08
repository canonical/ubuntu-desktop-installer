import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/slides.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'bottom_bar.dart';
import 'installation_slides_model.dart';
import 'slide_view.dart';

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
class InstallationSlidesPage extends ConsumerStatefulWidget {
  const InstallationSlidesPage({super.key});

  static final modelProvider = ChangeNotifierProvider(
    (_) => InstallationSlidesModel(
      getService<SubiquityClient>(),
      getService<JournalService>(),
      getService<ProductService>(),
    ),
  );

  @override
  ConsumerState<InstallationSlidesPage> createState() =>
      _InstallationSlidesPageState();
}

class _InstallationSlidesPageState
    extends ConsumerState<InstallationSlidesPage> {
  final _slideController = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    final model = ref.read(InstallationSlidesPage.modelProvider);
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
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = ref.watch(InstallationSlidesPage.modelProvider);
    final slides = SlidesContext.of(context);
    return Scaffold(
      appBar: YaruWindowTitleBar(
        title: Text(model.productInfo.toString()),
      ),
      body: Stack(
        children: [
          SlideView(
            controller: _slideController,
            interval: model.isPlaying ? kDefaultSlideInterval : Duration.zero,
            slides: slides,
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 150),
              opacity: model.isLogVisible ? 1 : 0,
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
            ),
          )
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _slideController,
        builder: (context, value, child) {
          return BottomBar(
            title: Text(
              model.hasError
                  ? lang.installationFailed
                  : model.event.action.localize(lang),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: model.hasError
                      ? Theme.of(context).colorScheme.error
                      : null),
            ),
            subtitle: RepaintBoundary(
              child: LinearProgressIndicator(
                value: model.isInstalling ? null : 0,
              ),
            ),
            trailing: IconButton(
              icon: Icon(YaruIcons.terminal,
                  color: model.isLogVisible
                      ? Theme.of(context).primaryColor
                      : null),
              onPressed: model.toggleLogVisibility,
            ),
            leading: Row(
              children: [
                IconButton(
                  onPressed: _slideController.value > 0
                      ? () => --_slideController.value
                      : null,
                  icon: const Icon(YaruIcons.pan_start),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: model.togglePlaying,
                  icon: model.isPlaying
                      ? const Icon(YaruIcons.media_pause)
                      : const Icon(YaruIcons.media_play),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: _slideController.value < slides.length - 1
                      ? () => ++_slideController.value
                      : null,
                  icon: const Icon(YaruIcons.pan_end),
                ),
              ],
            ),
          );
        },
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
