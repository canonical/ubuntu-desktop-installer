import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'bottom_bar.dart';
import 'install_model.dart';
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

class InstallPage extends ConsumerWidget {
  const InstallPage({super.key});

  static Future<bool> load(BuildContext context, WidgetRef ref) {
    final model = ref.read(installModelProvider);
    return Future.wait([
      model.init(),
      model.precacheSlideImages(context),
    ]).then((_) => true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDone = ref.watch(installModelProvider.select((m) => m.isDone));
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      switchInCurve: Curves.easeInExpo,
      switchOutCurve: Curves.easeOutExpo,
      child: isDone ? const _DonePage() : const _SlidePage(),
    );
  }
}

class _SlidePage extends ConsumerStatefulWidget {
  const _SlidePage();

  @override
  ConsumerState<_SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends ConsumerState<_SlidePage> {
  final _slideController = ValueNotifier(0);

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = ref.watch(installModelProvider);
    final slides = SlidesContext.of(context);
    return WizardPage(
      headerPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: YaruWindowTitleBar(
        title: Text(model.productInfo.toString()),
      ),
      content: Stack(
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
                    top: kWizardSpacing,
                    left: kWizardSpacing,
                    right: kWizardSpacing,
                  ),
                  child: _JournalView(journal: model.log),
                ),
              ),
            ),
          )
        ],
      ),
      bottomBar: ValueListenableBuilder(
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
              child: YaruLinearProgressIndicator(
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
      padding: const EdgeInsets.symmetric(horizontal: kWizardSpacing),
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
        contentPadding: EdgeInsets.symmetric(vertical: kWizardSpacing / 2),
      ),
      background: BoxDecoration(color: Theme.of(context).shadowColor),
    );
  }
}

class _DonePage extends ConsumerWidget {
  const _DonePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = ref.watch(flavorProvider);
    final lang = AppLocalizations.of(context);
    final model = ref.watch(installModelProvider);
    return WizardPage(
      headerPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: YaruWindowTitleBar(
        title: Text(lang.installationCompleteTitle),
      ),
      content: Row(
        children: [
          const Spacer(flex: 2),
          const MascotAvatar(),
          const Spacer(),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MarkdownBody(
                  data: lang.readyToUse(model.productInfo),
                  styleSheet: MarkdownStyleSheet(
                    p: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: kWizardSpacing * 1.5),
                Text(lang.restartWarning(flavor.name)),
                const SizedBox(height: kWizardSpacing * 1.5),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final window = YaruWindow.of(context);
                          model.reboot().then((_) => window.close());
                        },
                        child: Text(lang.restartNow),
                      ),
                    ),
                    const SizedBox(width: kWizardSpacing),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: YaruWindow.of(context).close,
                        child: Text(lang.continueTesting),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
