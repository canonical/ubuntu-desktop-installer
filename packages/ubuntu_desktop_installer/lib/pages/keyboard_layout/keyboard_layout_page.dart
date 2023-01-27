import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'keyboard_layout_dialogs.dart';
import 'keyboard_layout_model.dart';

const _kScrollDuration = Duration(milliseconds: 1);

class KeyboardLayoutPage extends StatefulWidget {
  const KeyboardLayoutPage({
    super.key,
  });

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => KeyboardLayoutModel(getService<SubiquityClient>()),
      child: const KeyboardLayoutPage(),
    );
  }

  @override
  State<KeyboardLayoutPage> createState() => _KeyboardLayoutPageState();
}

class _KeyboardLayoutPageState extends State<KeyboardLayoutPage> {
  final _layoutListFocusNode = FocusNode();
  final _layoutListScrollController = AutoScrollController();
  final _keyboardVariantListScrollController = AutoScrollController();

  StreamSubscription<int>? _layoutChanged;
  StreamSubscription<int>? _variantChanged;

  @override
  void initState() {
    super.initState();

    final model = Provider.of<KeyboardLayoutModel>(context, listen: false);
    model.init().then((_) {
      _scrollToLayout(model.selectedLayoutIndex, AutoScrollPosition.middle);
      _scrollToVariant(model.selectedVariantIndex, AutoScrollPosition.middle);
      model.updateInputSource();
    });

    _layoutChanged = model.onLayoutSelected.listen(_scrollToLayout);
    _variantChanged = model.onVariantSelected.listen(_scrollToVariant);
  }

  void _scrollToLayout(int index, [AutoScrollPosition? position]) {
    if (index == -1) return;
    _layoutListScrollController.scrollToIndex(
      index,
      preferPosition: position,
      duration: _kScrollDuration,
    );
  }

  void _scrollToVariant(int index, [AutoScrollPosition? position]) {
    if (index == -1) return;
    _keyboardVariantListScrollController.scrollToIndex(
      index,
      preferPosition: position,
      duration: _kScrollDuration,
    );
  }

  @override
  void dispose() {
    _layoutListFocusNode.dispose();
    _layoutListScrollController.dispose();
    _keyboardVariantListScrollController.dispose();
    _layoutChanged?.cancel();
    _variantChanged?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<KeyboardLayoutModel>(context);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.keyboardLayoutPageTitle),
      ),
      header: Text(lang.chooseYourKeyboardLayout),
      content: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: KeySearch(
                    autofocus: true,
                    focusNode: _layoutListFocusNode,
                    onSearch: (value) {
                      final index = model.searchLayout(value);
                      if (index != -1) {
                        model.selectLayout(index);
                      }
                    },
                    child: FocusTraversalGroup(
                      policy: WidgetOrderTraversalPolicy(),
                      child: YaruBorderContainer(
                        clipBehavior: Clip.antiAlias,
                        child: ListView.builder(
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
                                onTap: () {
                                  model.selectLayout(index);
                                  _layoutListFocusNode.requestFocus();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: kContentSpacing),
                Expanded(
                  child: YaruBorderContainer(
                    clipBehavior: Clip.antiAlias,
                    child: ListView.builder(
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
          onNext: model.save,
        ),
      ],
    );
  }
}
