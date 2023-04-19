import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/widgets/mascot_avatar.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import '../../widgets/scoped_list_focus.dart';
import 'welcome_model.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    final sound = tryGetService<SoundService>();
    return ChangeNotifierProvider(
      create: (_) => WelcomeModel(client: client, sound: sound),
      child: const WelcomePage(),
    );
  }

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<WelcomeModel>(context, listen: false);
    model.loadLanguages().then((_) {
      model.selectLocale(InheritedLocale.of(context));
      model.playWelcomeSound();
    });
  }

  void _selectLanguage(int index) {
    if (index == -1) return;

    final model = context.read<WelcomeModel>();
    model.selectedLanguageIndex = index;

    InheritedLocale.apply(context, model.locale(index));
  }

  @override
  Widget build(BuildContext context) {
    final flavor = Flavor.of(context);
    final model = Provider.of<WelcomeModel>(context);
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
              child: ScopedListFocus(
                child: ListWidget.builder(
                  selectedIndex: model.selectedLanguageIndex,
                  itemCount: model.languageCount,
                  itemBuilder: (context, index) => ListTile(
                    key: ValueKey(index),
                    title: Text(model.language(index)),
                    selected: index == model.selectedLanguageIndex,
                    autofocus: index == model.selectedLanguageIndex,
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
