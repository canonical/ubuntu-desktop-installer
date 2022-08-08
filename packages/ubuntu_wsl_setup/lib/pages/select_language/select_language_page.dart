import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../locale.dart';
import 'select_language_model.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({
    super.key,
  });

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => SelectLanguageModel(client),
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
      model.getServerLocale().then((loc) {
        model.selectLocale(loc);
        InheritedLocale.apply(context, loc);
        _languageListScrollController.scrollToIndex(model.selectedLanguageIndex,
            preferPosition: AutoScrollPosition.middle,
            duration: const Duration(milliseconds: 1));
      });
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
                  InheritedLocale.apply(context, model.uiLocale(index));
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
          onNext: () {
            model.applyLocale(model.locale(model.selectedLanguageIndex));
          },
        ),
      ],
    );
  }
}
