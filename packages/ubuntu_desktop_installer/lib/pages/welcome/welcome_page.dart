import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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
  final _focusNode = FocusNode();
  final _scrollableKey = GlobalKey();
  final _itemScrollController = ItemScrollController();
  final _itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();

    final model = Provider.of<WelcomeModel>(context, listen: false);
    model.loadLanguages().then((_) {
      model.selectLocale(InheritedLocale.of(context));
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _selectAndScrollToLanguage(int index) {
    if (index == -1) return;

    final model = context.read<WelcomeModel>();
    model.selectedLanguageIndex = index;

    InheritedLocale.apply(context, model.locale(index));

    _focusNode.requestFocus();

    final pos = _itemPositionsListener.itemPositions.value
        .firstWhereOrNull((item) => item.index == index);
    if (pos == null) {
      // the item does not exist in the viewport. jump and align the center.
      final box =
          _scrollableKey.currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        _itemScrollController.jumpTo(
            index: index,
            alignment: 0.5 - kMinInteractiveDimension / box.size.height / 2);
      }
    } else if (pos.itemLeadingEdge < 0) {
      // partly above the viewport, align the top edge
      _itemScrollController.jumpTo(index: index, alignment: 0);
    } else if (pos.itemTrailingEdge > 1) {
      // partly below the viewport, align the bottom edge
      _itemScrollController.jumpTo(
          index: index,
          alignment: 1 - pos.itemTrailingEdge + pos.itemLeadingEdge);
    }
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
                focusNode: _focusNode,
                onSearch: (value) {
                  _selectAndScrollToLanguage(model.searchLanguage(value));
                },
                child: YaruBorderContainer(
                  clipBehavior: Clip.antiAlias,
                  child: model.languageCount > 0
                      ? LayoutBuilder(
                          builder: (context, constraints) {
                            return ScrollablePositionedList.builder(
                              key: _scrollableKey,
                              initialAlignment: 0.5 -
                                  kMinInteractiveDimension /
                                      constraints.maxHeight /
                                      2,
                              initialScrollIndex: model.selectedLanguageIndex,
                              itemScrollController: _itemScrollController,
                              itemPositionsListener: _itemPositionsListener,
                              itemCount: model.languageCount,
                              itemBuilder: (context, index) => ListTile(
                                key: ValueKey(index),
                                title: Text(model.language(index)),
                                selected: index == model.selectedLanguageIndex,
                                onTap: () => _selectAndScrollToLanguage(index),
                              ),
                            );
                          },
                        )
                      : const SizedBox.expand(),
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
