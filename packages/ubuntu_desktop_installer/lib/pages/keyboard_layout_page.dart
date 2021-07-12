import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:keyboard_info/keyboard_info.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../keyboard_model.dart';
import '../routes.dart';
import '../widgets.dart';
import 'wizard_page.dart';

class KeyboardLayoutPage extends StatefulWidget {
  const KeyboardLayoutPage({
    Key? key,
  }) : super(key: key);

  @override
  _KeyboardLayoutPageState createState() => _KeyboardLayoutPageState();
}

class _KeyboardLayoutPageState extends State<KeyboardLayoutPage> {
  int _selectedLayoutIndex = -1;
  KeyboardLayout? get _selectedLayout => (_selectedLayoutIndex > -1)
      ? Provider.of<KeyboardModel>(context, listen: false)
          .layouts[_selectedLayoutIndex]
      : null;
  int _selectedVariantIndex = -1;
  KeyboardVariant? get _selectedVariant => (_selectedVariantIndex > -1)
      ? _selectedLayout?.variants?.elementAt(_selectedVariantIndex)
      : null;

  final _layoutListScrollController = AutoScrollController();
  final _keyboardVariantListScrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();

    getKeyboardInfo().then((info) {
      var keyboardModel = Provider.of<KeyboardModel>(context, listen: false);
      setState(() {
        _selectedLayoutIndex = keyboardModel.layouts.indexWhere((layout) {
          return layout.code == info.layout;
        });
        if (_selectedLayoutIndex > -1) {
          _selectedVariantIndex = _selectedLayout!.variants!
              .indexWhere((variant) => variant.code == info.variant);
          if (_selectedVariantIndex > -1) {
            SchedulerBinding.instance!.addPostFrameCallback((_) =>
                _keyboardVariantListScrollController.scrollToIndex(
                    _selectedVariantIndex,
                    preferPosition: AutoScrollPosition.middle,
                    duration: const Duration(milliseconds: 1)));
          }
        }
        if (_selectedLayoutIndex > -1) {
          SchedulerBinding.instance!.addPostFrameCallback((_) =>
              _layoutListScrollController.scrollToIndex(_selectedLayoutIndex,
                  preferPosition: AutoScrollPosition.middle,
                  duration: const Duration(milliseconds: 1)));
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _layoutListScrollController.dispose();
    _keyboardVariantListScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KeyboardModel>(builder: (context, keyboardModel, child) {
      Future<ProcessResult> _setXkbMap() async {
        return Process.run('setxkbmap', [
          '-layout',
          _selectedLayout!.code!,
          '-variant',
          _selectedVariant!.code!
        ]);
      }

      return LocalizedView(
        builder: (context, lang) => WizardPage(
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
                        itemCount: keyboardModel.layouts.length,
                        itemBuilder: (context, index) {
                          return AutoScrollTag(
                            index: index,
                            key: ValueKey(index),
                            controller: _layoutListScrollController,
                            child: ListTile(
                              title: Text(keyboardModel.layouts[index].name!),
                              selected: index == _selectedLayoutIndex,
                              onTap: () {
                                setState(() {
                                  _selectedLayoutIndex = index;
                                  _selectedVariantIndex = 0;
                                });
                                _setXkbMap();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: RoundedListView.builder(
                        controller: _keyboardVariantListScrollController,
                        itemCount: _selectedLayout != null
                            ? _selectedLayout!.variants!.length
                            : 0,
                        itemBuilder: (context, index) {
                          return AutoScrollTag(
                            index: index,
                            key: ValueKey(index),
                            controller: _keyboardVariantListScrollController,
                            child: ListTile(
                              title:
                                  Text(_selectedLayout!.variants![index].name!),
                              selected: index == _selectedVariantIndex,
                              onTap: () {
                                setState(() {
                                  _selectedVariantIndex = index;
                                });
                                _setXkbMap();
                              },
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
                  border: const OutlineInputBorder(),
                  hintText: lang.typeToTest,
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton(
                  child: Text(lang.detectLayout),
                  onPressed: () {
                    print('TODO: show dialog to detect keyboard layout');
                  },
                ),
              ),
            ],
          ),
          actions: <WizardAction>[
            WizardAction(
              label: lang.backButtonText,
              onActivated: Navigator.of(context).pop,
            ),
            WizardAction(
              label: lang.continueButtonText,
              onActivated: () async {
                final client =
                    Provider.of<SubiquityClient>(context, listen: false);
                final keyboard = KeyboardSetting(
                    layout: _selectedLayout!.code!,
                    variant: _selectedVariant!.code!);
                await client.setKeyboard(keyboard);

                Navigator.pushNamed(context, Routes.updatesOtherSoftware);
              },
            ),
          ],
        ),
      );
    });
  }
}
