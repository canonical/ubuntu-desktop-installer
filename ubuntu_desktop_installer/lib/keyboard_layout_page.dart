import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';

import 'keyboard_model.dart';
import 'localized_view.dart';
import 'rounded_list_view.dart';

class KeyboardLayoutPage extends StatefulWidget {
  const KeyboardLayoutPage({
    Key key,
    @required this.client,
  })  : assert(client != null, '`SubiquityClient` must not be `null`'),
        super(key: key);

  final SubiquityClient client;

  @override
  _KeyboardLayoutPageState createState() => _KeyboardLayoutPageState();
}

class _KeyboardLayoutPageState extends State<KeyboardLayoutPage> {
  int _selectedLayoutIndex = 0;
  String _selectedLayoutName = '';
  int _selectedVariantIndex = 0;

  final _layoutListScrollController = AutoScrollController();
  final _keyboardVariantListScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final locale = Intl.defaultLocale.toString().split('_').last.toLowerCase();
    // FIXME: incorrect heuristic:
    //    Ukrainian is uk, but the default keyboard layout should be ua
    //    Greek is el, but the default keyboard layout should be gr
    //    Catalan is ca, but the default keyboard layout should be es-cat
    //    The kbdnames.txt asset doesn't include a mapping between locales and
    //    default keyboard layouts, we'll need to add one.
    var keyboardModel = Provider.of<KeyboardModel>(context, listen: false);
    for (var i = 0; i < keyboardModel.layouts.length; ++i) {
      if (locale.contains(keyboardModel.layouts[i].item1)) {
        _selectedLayoutIndex = i;
        _selectedLayoutName = locale;
        break;
      }
    }
    SchedulerBinding.instance.addPostFrameCallback((_) =>
        _layoutListScrollController.scrollToIndex(_selectedLayoutIndex,
            preferPosition: AutoScrollPosition.middle,
            duration: const Duration(milliseconds: 1)));
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
      return LocalizedView(
        builder: (context, lang) => Scaffold(
          appBar: AppBar(
            title: Text(lang.keyboardLayoutPageTitle),
            automaticallyImplyLeading: false,
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(lang.chooseYourKeyboardLayout),
                      ),
                      const SizedBox(height: 10),
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
                                        title: Text(
                                            keyboardModel.layouts[index].item2),
                                        selected: index == _selectedLayoutIndex,
                                        onTap: () {
                                          setState(() {
                                            _selectedLayoutIndex = index;
                                            _selectedLayoutName = keyboardModel
                                                .layouts[index].item1;
                                            _selectedVariantIndex = 0;
                                          });
                                        },
                                      ));
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: RoundedListView.builder(
                                controller:
                                    _keyboardVariantListScrollController,
                                itemCount: _selectedLayoutName.isNotEmpty
                                    ? keyboardModel
                                        .variants[_selectedLayoutName].length
                                    : 0,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(keyboardModel
                                        .variants[_selectedLayoutName][index]
                                        .item2),
                                    selected: index == _selectedVariantIndex,
                                    onTap: () {
                                      setState(() {
                                        _selectedVariantIndex = index;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: lang.typeToTest,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: OutlinedButton(
                          child: Text(lang.detectLayout),
                          onPressed: () {
                            print(
                                'TODO: show dialog to detect keyboard layout');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ButtonBar(
                  children: <OutlinedButton>[
                    OutlinedButton(
                      child: Text(lang.backButtonText),
                      onPressed: Navigator.of(context).pop,
                    ),
                    OutlinedButton(
                      child: Text(lang.continueButtonText),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
