import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'keyboard_layout_dialogs.dart';
import 'keyboard_layout_model.dart';

const _kScrollDuration = Duration(milliseconds: 1);

class KeyboardLayoutPage extends StatefulWidget {
  const KeyboardLayoutPage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => KeyboardLayoutModel(
        client: Provider.of<SubiquityClient>(context, listen: false),
        keyboardService: Provider.of<KeyboardService>(context, listen: false),
      ),
      child: KeyboardLayoutPage(),
    );
  }

  @override
  _KeyboardLayoutPageState createState() => _KeyboardLayoutPageState();
}

class _KeyboardLayoutPageState extends State<KeyboardLayoutPage> {
  final _layoutListScrollController = AutoScrollController();
  final _keyboardVariantListScrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();

    final model = Provider.of<KeyboardLayoutModel>(context, listen: false);
    model.init().then((_) {
      _scrollToLayout(model.selectedLayoutIndex);
      _scrollToVariant(model.selectedVariantIndex);
    });

    model.onLayoutSelected.listen(_scrollToLayout);
    model.onVariantSelected.listen(_scrollToVariant);
  }

  void _scrollToLayout(int index) {
    if (index == -1) return;
    _layoutListScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
      duration: _kScrollDuration,
    );
  }

  void _scrollToVariant(int index) {
    if (index == -1) return;
    _keyboardVariantListScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
      duration: _kScrollDuration,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _layoutListScrollController.dispose();
    _keyboardVariantListScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<KeyboardLayoutModel>(context);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.keyboardLayoutPageTitle),
      header: Text(lang.chooseYourKeyboardLayout),
      content: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RoundedListView.builder(
                    controller: _layoutListScrollController,
                    itemCount: model.layoutCount,
                    itemBuilder: (context, index) {
                      return AutoScrollTag(
                        index: index,
                        key: ValueKey(index),
                        controller: _layoutListScrollController,
                        child: ListTile(
                          title: Text(model.layoutName(index)),
                          selected: index == model.selectedLayoutIndex,
                          onTap: () => model.selectLayout(index),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: RoundedListView.builder(
                    controller: _keyboardVariantListScrollController,
                    itemCount: model.variantCount,
                    itemBuilder: (context, index) {
                      return AutoScrollTag(
                        index: index,
                        key: ValueKey(index),
                        controller: _keyboardVariantListScrollController,
                        child: ListTile(
                          title: Text(model.variantName(index)),
                          selected: index == model.selectedVariantIndex,
                          onTap: () => model.selectVariant(index),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: lang.typeToTest,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton(
              child: Text(lang.detectLayout),
              onPressed: () async {
                final result = await showDetectKeyboardLayoutDialog(context);
                if (result != null) {
                  model.trySelectLayoutVariant(result.layout, result.variant);
                }
              },
            ),
          ),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          enabled: model.isValid,
          onActivated: () async {
            await model.applyKeyboardSettings();
            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
