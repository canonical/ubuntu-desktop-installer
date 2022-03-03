import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'welcome_model.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => WelcomeModel(client),
      child: const WelcomePage(),
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
    final model = Provider.of<WelcomeModel>(context);
    final lang = AppLocalizations.of(context);
    final height = MediaQuery.of(context).size.height;
    return WizardPage(
      title: Text(lang.welcome),
      header: Text(lang.welcomeHeader),
      content: FractionallySizedBox(
        child: Row(
          children: [
            Expanded(
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
            const SizedBox(width: 20),
            Expanded(
              child: SvgPicture.asset(
                'assets/welcome/logo.svg',
                height: height / 4,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          onActivated: () {
            final locale = model.locale(model.selectedLanguageIndex);
            model.applyLocale(locale);
            getService<TelemetryService>().setLanguage(locale.languageCode);
            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
