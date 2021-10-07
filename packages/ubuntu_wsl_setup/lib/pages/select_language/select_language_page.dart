import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'select_language_model.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => SelectLanguageModel(client),
      child: SelectLanguagePage(),
    );
  }

  @override
  _SelectLanguagePageState createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  final _languageListScrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();

    final model = Provider.of<SelectLanguageModel>(context, listen: false);
    model.loadLanguages().then((_) {
      final settings = Settings.of(context, listen: false);
      model.selectLocale(settings.locale);

      _languageListScrollController.scrollToIndex(model.selectedLanguageIndex,
          preferPosition: AutoScrollPosition.middle,
          duration: const Duration(milliseconds: 1));
    });
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
      title: Text(lang.selectLanguageTitle),
      content: FractionallySizedBox(
        widthFactor: 0.5,
        child: RoundedListView.builder(
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
                  final settings = Settings.of(context, listen: false);
                  settings.applyLocale(model.locale(index));
                },
              ),
            );
          },
        ),
      ),
      actions: [
        WizardAction.back(context),
        WizardAction.next(
          context,
          onActivated: () {
            model.applyLocale(model.locale(model.selectedLanguageIndex));
            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
