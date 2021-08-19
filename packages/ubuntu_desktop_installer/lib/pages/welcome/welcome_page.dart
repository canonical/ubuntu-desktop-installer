import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../services.dart';
import '../../widgets.dart';
import 'welcome_model.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeModel(
        client: Provider.of<SubiquityClient>(context, listen: false),
        keyboardService: Provider.of<KeyboardService>(context, listen: false),
      ),
      child: WelcomePage(),
    );
  }

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _languageListScrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();

    final model = Provider.of<WelcomeModel>(context, listen: false);
    model.loadKeyboards();

    model.loadLanguages().then((_) {
      model.selectLocale(Intl.defaultLocale!);
      // If the system's locale didn't match exactly
      // (language code + country code) one of the available translations,
      // we still want to load translations and keyboard layouts for the next
      // best match (language code only) that was picked by selectLocale().
      final settings = Settings.of(context, listen: false);
      settings.applyLocale(model.locale(model.selectedLanguageIndex));
      model.loadKeyboards();

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
    final model = Provider.of<WelcomeModel>(context);
    return LocalizedView(
      builder: (context, lang) => WizardPage(
        title: Text(lang.welcome),
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
                    model.loadKeyboards();
                  },
                ),
              );
            },
          ),
        ),
        actions: <WizardAction>[
          WizardAction(label: lang.backButtonText),
          WizardAction(
            label: lang.continueButtonText,
            onActivated: () {
              model.applyLocale(model.locale(model.selectedLanguageIndex));
              Wizard.of(context).next();
            },
          ),
        ],
      ),
    );
  }
}
