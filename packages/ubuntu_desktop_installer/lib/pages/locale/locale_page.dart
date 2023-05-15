import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'locale_model.dart';

class LocalePage extends ConsumerStatefulWidget {
  const LocalePage({super.key});

  @override
  ConsumerState<LocalePage> createState() => _LocalePageState();
}

class _LocalePageState extends ConsumerState<LocalePage> {
  @override
  void initState() {
    super.initState();

    final model = ref.read(localeModelProvider);
    model.init().then((_) {
      _selectLanguage(model.selectedLanguageIndex);
      model.playWelcomeSound();
    });
  }

  void _selectLanguage(int index) {
    if (index == -1) return;

    final model = ref.read(localeModelProvider);
    model.selectedLanguageIndex = index;

    InheritedLocale.apply(context, model.locale(index));
  }

  @override
  Widget build(BuildContext context) {
    final flavor = Flavor.of(context);
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
                  onTap: () => _selectLanguage(index),
                ),
                onKeySearch: (value) {
                  final index = model.searchLanguage(value);
                  if (index != -1) {
                    _selectLanguage(index);
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
            onNext: () {
              final locale = model.locale(model.selectedLanguageIndex);
              model.applyLocale(locale);
              getService<TelemetryService>()
                  .addMetric('Language', locale.languageCode);
            },
          ),
        ],
      ),
    );
  }
}
