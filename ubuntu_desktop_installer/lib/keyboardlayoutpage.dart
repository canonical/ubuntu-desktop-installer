import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:ubuntu_desktop_installer/i18n.dart';
import 'package:yaru/yaru.dart';

import 'package:subiquity_client/subiquity_client.dart';

class KeyboardLayoutPage extends StatefulWidget {
  const KeyboardLayoutPage({
    Key key,
    this.client,
    this.keyboardLayoutExceptions = const {
      'ua': 'uk',
      'gr': 'el',
    },
  }) : super(key: key);

  final SubiquityClient client;
  final Map<String, String> keyboardLayoutExceptions;

  @override
  _KeyboardLayoutPageState createState() => _KeyboardLayoutPageState();

  String get title => Intl.message('Keyboard layout');
  String get header => Intl.message('Choose your keyboard layout:');
  String get hint => Intl.message('Type here to test your keyboard');
  String get detect => Intl.message('Detect Keyboard Layout');
}

class _KeyboardLayoutPageState extends State<KeyboardLayoutPage> {
  var _selectedLayoutIndex = 0;
  var _selectedLayoutName = '';
  var _selectedVariantIndex = 0;

  final AutoScrollController _layoutListScrollController =
      AutoScrollController();

  List<String> get _adjustedKeyboardLayoutList {
    final keyboardLayoutList = [
      for (final t in widget.client.keyboardlayoutlist) t.item1
    ];
    for (final i in widget.keyboardLayoutExceptions.values) {
      if (keyboardLayoutList.contains(i)) {
        keyboardLayoutList[keyboardLayoutList.indexOf(i)] =
            widget.keyboardLayoutExceptions[i];
      }
    }
    return keyboardLayoutList;
  }

  @override
  void initState() {
    super.initState();
    final locale = Intl.defaultLocale.toString().split('_').last.toLowerCase();
    final adjustedKeyboardLayoutList = _adjustedKeyboardLayoutList;
    final keyboardLayout = adjustedKeyboardLayoutList.firstWhere(
      (k) => k == locale,
    );
    if (keyboardLayout != null) {
      _selectedLayoutIndex = adjustedKeyboardLayoutList.indexOf(keyboardLayout);
      _selectedLayoutName = keyboardLayout;
    }
    SchedulerBinding.instance.addPostFrameCallback((_) =>
        _layoutListScrollController.scrollToIndex(_selectedLayoutIndex,
            preferPosition: AutoScrollPosition.middle,
            duration: Duration(milliseconds: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                    child: Text(widget.header),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: yaruLightTheme.dividerColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: ListView.builder(
                              controller: _layoutListScrollController,
                              itemCount:
                                  widget.client.keyboardlayoutlist.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AutoScrollTag(
                                    index: index,
                                    key: ValueKey(index),
                                    controller: _layoutListScrollController,
                                    child: ListTile(
                                      title: Text(widget.client
                                          .keyboardlayoutlist[index].item2),
                                      selected: index == _selectedLayoutIndex,
                                      onTap: () {
                                        setState(() {
                                          _selectedLayoutIndex = index;
                                          _selectedLayoutName = widget.client
                                              .keyboardlayoutlist[index].item1;
                                          _selectedVariantIndex = 0;
                                        });
                                      },
                                    ));
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: yaruLightTheme.dividerColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: ListView.builder(
                              itemCount: _selectedLayoutName.isNotEmpty
                                  ? widget
                                      .client
                                      .keyboardvariantlist[_selectedLayoutName]
                                      .length
                                  : 0,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(widget
                                      .client
                                      .keyboardvariantlist[_selectedLayoutName]
                                          [index]
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: widget.hint,
                    ),
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: OutlinedButton(
                      child: Text(widget.detect),
                      onPressed: () {
                        print('TODO: show dialog to detect keyboard layout');
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ButtonBar(
              children: <OutlinedButton>[
                OutlinedButton(
                    child:
                        Text(UbuntuLocalizations.of(context).goBackButtonText),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                OutlinedButton(
                  child:
                      Text(UbuntuLocalizations.of(context).continueButtonText),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
