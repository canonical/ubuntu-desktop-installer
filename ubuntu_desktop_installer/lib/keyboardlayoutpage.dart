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
  }) : super(key: key);

  final SubiquityClient client;

  @override
  _KeyboardLayoutPageState createState() => _KeyboardLayoutPageState();

  String get title => Intl.message('Keyboard layout');
  String get header => Intl.message('Choose your keyboard layout:');
  String get hint => Intl.message('Type here to test your keyboard');
  String get detect => Intl.message('Detect Keyboard Layout');
}

class _KeyboardLayoutPageState extends State<KeyboardLayoutPage> {
  int _selectedLayoutIndex = 0;
  String _selectedLayoutName = '';
  int _selectedVariantIndex = 0;

  final AutoScrollController _layoutListScrollController =
      AutoScrollController();

  @override
  void initState() {
    super.initState();
    final locale = Intl.defaultLocale.toString().split('_').last.toLowerCase();
    // FIXME: incorrect heuristic:
    //    Ukrainian is uk, but the default keyboard layout is ua
    //    Greek is el, but the default keyboard layout is gr
    for (var i = 0; i < widget.client.keyboardlayoutlist.length; ++i) {
      if (widget.client.keyboardlayoutlist[i].item1 == locale) {
        _selectedLayoutIndex = i;
        _selectedLayoutName = locale;
        break;
      }
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
                  const SizedBox(height: 10),
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
                        const SizedBox(width: 20),
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
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: widget.hint,
                    ),
                  ),
                  const SizedBox(height: 15),
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
            const SizedBox(height: 20),
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
