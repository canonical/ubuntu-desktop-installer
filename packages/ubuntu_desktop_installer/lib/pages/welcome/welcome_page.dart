import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../app.dart';
import '../../keyboard_model.dart';
import '../../routes.dart';
import '../../widgets.dart';
import '../wizard_page.dart';
import 'welcome_model.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeModel(
        client: Provider.of<SubiquityClient>(context, listen: false),
        keyboardModel: Provider.of<KeyboardModel>(context, listen: false),
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
    model.loadKeyboardModel();

    model.loadLanguages().then((_) {
      model.selectLocale(Intl.defaultLocale!);

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
                    UbuntuDesktopInstallerApp.locale = model.locale(index);
                    model.loadKeyboardModel();
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
              Navigator.pushNamed(context, Routes.tryOrInstall);
            },
          ),
        ],
      ),
    );
  }
}
