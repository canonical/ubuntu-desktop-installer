import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'locale_model.dart';

class LocalePage extends ConsumerWidget {
  const LocalePage({super.key});

  static Future<bool> load(BuildContext context, WidgetRef ref) {
    final model = ref.read(localeModelProvider);
    return model.init().then((_) {
      _selectLanguage(context, ref, model.selectedLanguageIndex);
      return model.playWelcomeSound();
    }).then((_) => true);
  }

  static void _selectLanguage(BuildContext context, WidgetRef ref, int index) {
    if (index == -1) return;

    final model = ref.read(localeModelProvider);
    model.selectedLanguageIndex = index;

    InheritedLocale.apply(context, model.locale(index));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = ref.watch(flavorProvider);
    final model = ref.watch(localeModelProvider);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.welcomePageTitle(flavor.name)),
      ),
      content: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          children: [
            const SizedBox(height: kContentSpacing / 2),
            const MascotAvatar(),
            const SizedBox(height: kContentSpacing),
            Text(lang.welcomeHeader),
            const SizedBox(height: kContentSpacing / 2),
            Expanded(
              child: ListWidget.builder(
                selectedIndex: model.selectedLanguageIndex,
                itemCount: model.languageCount,
                itemBuilder: (context, index) => ListTile(
                  key: ValueKey(index),
                  title: Text(model.language(index)),
                  selected: index == model.selectedLanguageIndex,
                  onTap: () => _selectLanguage(context, ref, index),
                ),
                onKeySearch: (value) {
                  final index = model.searchLanguage(value);
                  if (index != -1) {
                    _selectLanguage(context, ref, index);
                  }
                },
              ),
            ),
            const SizedBox(height: kContentSpacing),
          ],
        ),
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            onNext: () async {
              final locale = model.locale(model.selectedLanguageIndex);
              await model.applyLocale(locale);
              tryGetService<TelemetryService>()
                  ?.addMetric('Language', locale.languageCode);
            },
          ),
        ],
      ),
    );
  }
}
