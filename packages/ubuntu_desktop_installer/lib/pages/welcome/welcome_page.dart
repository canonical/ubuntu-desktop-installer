import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/widgets/mascot_avatar.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'welcome_model.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => WelcomeModel(client),
      child: const WelcomePage(),
    );
  }

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _languageListFocusNode = FocusNode();
  final _languageListScrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();

    final model = Provider.of<WelcomeModel>(context, listen: false);
    model.loadLanguages().then((_) {
      model.selectLocale(InheritedLocale.of(context));

      _selectAndScrollToLanguage(
          model.selectedLanguageIndex, AutoScrollPosition.middle);
    });
  }

  @override
  void dispose() {
    _languageListFocusNode.dispose();
    _languageListScrollController.dispose();
    super.dispose();
  }

  void _selectAndScrollToLanguage(int index, [AutoScrollPosition? position]) {
    if (index == -1) return;

    final model = context.read<WelcomeModel>();
    model.selectedLanguageIndex = index;

    InheritedLocale.apply(context, model.locale(index));

    _languageListFocusNode.requestFocus();
    _languageListScrollController.scrollToIndex(index,
        preferPosition: position, duration: const Duration(milliseconds: 1));
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
              child: KeySearch(
                autofocus: true,
                focusNode: _languageListFocusNode,
                onSearch: (value) {
                  _selectAndScrollToLanguage(model.searchLanguage(value));
                },
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
                          onTap: () => _selectAndScrollToLanguage(index),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: kContentSpacing),
          ],
        ),
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
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
    );
  }
}
