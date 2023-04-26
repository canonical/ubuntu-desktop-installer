/*
 * Copyright (C) 2022 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/app_model.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services/journal.dart';
import 'installation_slides_model.dart';
import 'slides.dart';

/// Implements a slide show in which all slides have a common background image,
/// meant to only exist while Subiquity server is not up and running, (like
/// when WSL is still registering the distro).
/// Control comes from the SlideShow widget from ubuntu_widgets package.
class InstallationSlidesPage extends StatefulWidget {
  const InstallationSlidesPage({super.key});

  @override
  State<InstallationSlidesPage> createState() => _InstallationSlidesPageState();

  static Widget create(BuildContext context) {
    final slides = theSlides(context);
    return ChangeNotifierProxyProvider<AppModel, InstallationSlidesModel?>(
      create: (_) => InstallationSlidesModel(
        journal: getService<JournalService>().stream,
        monitor: getService<SubiquityStatusMonitor>(),
      ),
      update: (_, value, model) {
        model?.appModel = value;
        return model;
      },
      child: Provider<SlidesProvider>(
          create: (context) => SlidesProvider(slides),
          child: const InstallationSlidesPage()),
    );
  }
}

class _InstallationSlidesPageState extends State<InstallationSlidesPage> {
  @override
  void initState() {
    super.initState();
    final model = context.read<InstallationSlidesModel>();
    model.init(onServerUp: replaceThisPage);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<InstallationSlidesModel>();
    final slides = context.read<SlidesProvider>().slides;
    return model.isServerUp
        // Avoids glitching if the server is already up, since the wizard will
        // just push the next route anyway.
        ? const SizedBox.shrink()
        : _SlidesPage(slides);
  }

  void replaceThisPage() {
    final model = context.read<InstallationSlidesModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Wizard.of(context).replace(arguments: model.skipLanguageSelection);
    });
  }
}

class _SlidesPage extends StatelessWidget {
  final List<Widget> slides;

  const _SlidesPage(this.slides);

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                DecoratedBox(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Ubuntu_WSL_bgrd_x1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: SlideShow(
                    slides: slides,
                    interval: const Duration(seconds: 10),
                  ),
                ),
                Selector<InstallationSlidesModel, bool>(
                  selector: (_, model) => model.hasError,
                  builder: (context, hasError, child) => buildPositioned(
                    context,
                    offsetFlag: hasError,
                    builder: (_) => const _ErrorScreen(),
                  ),
                ),
                Consumer<InstallationSlidesModel>(
                  builder: (context, model, child) => buildPositioned(
                    context,
                    top: Theme.of(context).appBarTheme.toolbarHeight,
                    offsetFlag: model.isLogVisible,
                    builder: (_) => _JournalView(journal: model.journal),
                  ),
                ),
              ],
            ),
          ),
          Consumer<InstallationSlidesModel>(
            builder: (context, model, _) => Padding(
              padding: const EdgeInsets.all(kContentSpacing),
              child: Row(
                children: [
                  SizedBox(
                    height: kContentSpacing,
                    width: kContentSpacing,
                    child: model.hasError
                        ? const Icon(YaruIcons.error_filled)
                        : CircularProgressIndicator(
                            value: model.isRegistering ? null : 0,
                            backgroundColor:
                                Theme.of(context).primaryColor.withAlpha(62),
                          ),
                  ),
                  const SizedBox(width: kContentSpacing),
                  Text(
                    model.hasError
                        ? lang.installationSlidesErrorMsg
                        : lang.installationSlidesUnpacking,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: model.hasError
                            ? Theme.of(context).colorScheme.error
                            : null),
                  ),
                  const Spacer(),
                  YaruIconButton(
                    icon: const Icon(Icons.terminal),
                    isSelected: model.isLogVisible,
                    onPressed: model.toggleLogVisibility,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildPositioned(
    BuildContext context, {
    double? top,
    required bool offsetFlag,
    required Widget? Function(BuildContext) builder,
  }) {
    return Positioned.fill(
      top: top ?? 0.0,
      child: ClipRect(
        child: AnimatedSlide(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 150),
          offset: Offset(0, offsetFlag ? 0 : 1),
          child: builder(context),
        ),
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
        contentPadding: EdgeInsets.symmetric(vertical: kContentSpacing / 2),
      ),
      background: BoxDecoration(color: Theme.of(context).shadowColor),
    );
  }
}

// TODO: Invest a new PR on more capable error handling and discrimination.
// TODO: Work with design team on the real error screens design.
class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return ColoredBox(
      color: Colors.white,
      child: Slide.withRichText(
        image: const Icon(YaruIcons.emote_sick, size: 192),
        title: lang.installationSlidesErrorTitle,
        subtitle: 'Oh, no!',
        span: [
          TextSpan(
            style: Theme.of(context).textTheme.bodyLarge,
            text: lang.installationSlidesErrorText,
          ),
          const TextSpan(text: '\n'),
          const WidgetSpan(
            child: _CodeLabel('\$ wsl --unregister Ubuntu-22.04'),
          ),
          const TextSpan(text: '\n'),
          const WidgetSpan(child: _CodeLabel('\$ wsl --shutdown')),
          const TextSpan(text: '\n'),
          const WidgetSpan(child: _CodeLabel('\$ ubuntu2204.exe'))
        ],
      ),
    );
  }
}

// TODO: Promote this widget to avoid code duplication.
class _CodeLabel extends StatelessWidget {
  const _CodeLabel(this.code);

  final String code;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: 'Ubuntu Mono',
          backgroundColor: Theme.of(context).highlightColor,
        );
    return Text(code, style: style);
  }
}
