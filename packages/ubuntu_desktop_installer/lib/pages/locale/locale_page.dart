import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'locale_model.dart';

class LocalePage extends StatefulWidget {
  const LocalePage({
    super.key,
  });

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    final sound = tryGetService<SoundService>();
    return ChangeNotifierProvider(
      create: (_) => LocaleModel(client: client, sound: sound),
      child: const LocalePage(),
    );
  }

  @override
  State<LocalePage> createState() => _LocalePageState();
}

class _LocalePageState extends State<LocalePage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<LocaleModel>(context, listen: false);
    model.loadLanguages().then((_) {
      model.selectLocale(InheritedLocale.of(context));
      model.playWelcomeSound();
    });
  }

  void _selectLanguage(int index) {
    if (index == -1) return;

    final model = context.read<LocaleModel>();
    model.selectedLanguageIndex = index;

    InheritedLocale.apply(context, model.locale(index));
  }

  @override
  Widget build(BuildContext context) {
    final flavor = Flavor.of(context);
    final model = Provider.of<LocaleModel>(context);
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
        leading: WizardAction.back(context),
        trailing: [
          WizardAction.next(
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
