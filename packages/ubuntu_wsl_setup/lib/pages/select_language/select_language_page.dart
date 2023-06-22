import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/locale.dart';
import 'package:ubuntu_wsl_setup/services/language_fallback.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import 'select_language_model.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({
    super.key,
  });

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    final languageFallbackService = getService<LanguageFallbackService>();
    return ChangeNotifierProvider(
      create: (_) => SelectLanguageModel(client, languageFallbackService),
      child: const SelectLanguagePage(),
    );
  }

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  final _languageListScrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();

    final model = Provider.of<SelectLanguageModel>(context, listen: false);
    model.loadLanguages().then((_) {
      final locale = InheritedLocale.of(context);
      model.selectLocale(locale);
      _languageListScrollController.scrollToIndex(model.selectedLanguageIndex,
          preferPosition: AutoScrollPosition.middle,
          duration: const Duration(milliseconds: 1));
    });
    model.getInstallLanguagePacks();
  }

  @override
  void dispose() {
    _languageListScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = Provider.of<SelectLanguageModel>(context);
    return WizardPage(
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text(lang.selectLanguageTitle),
      ),
      content: Column(
        children: [
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: YaruBorderContainer(
                clipBehavior: Clip.antiAlias,
                child: ListView.builder(
                  controller: _languageListScrollController,
                  itemCount: model.languageCount,
                  itemBuilder: (context, index) {
                    return AutoScrollTag(
                      index: index,
                      key: ValueKey(index),
                      controller: _languageListScrollController,
                      child: ListTile(
                        title: Text(model.language(index)),
                        selected: index == model.selectedLanguageIndex,
                        onTap: () {
                          model.selectedLanguageIndex = index;
                          InheritedLocale.apply(context, model.uiLocale(index));
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: kContentSpacing),
          YaruCheckButton(
            contentPadding: kContentPadding,
            title: Text(lang.installLangPacksTitle(
                model.language(model.selectedLanguageIndex))),
            subtitle: Text(lang.installLangPacksSubtitle),
            value: model.installLanguagePacks,
            onChanged: (value) => model.setInstallLanguagePacks(value!),
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            onNext: () {
              model.applyInstallLanguagePacks();
              model.applyLocale(model.locale(model.selectedLanguageIndex));
            },
          ),
        ],
      ),
    );
  }
}
