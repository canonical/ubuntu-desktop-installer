import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:ubuntu_desktop_installer/i18n.dart';
import 'package:yaru/yaru.dart';

import 'package:subiquity_client/subiquity_client.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key key,
    @required this.client,
  })  : assert(client != null, '`SubiquityClient` must not be `null`'),
        super(key: key);

  final SubiquityClient client;

  @override
  _WelcomePageState createState() => _WelcomePageState();

  String get title => Intl.message('Welcome');
}

class _WelcomePageState extends State<WelcomePage> {
  var _selectedLanguageIndex = 0;

  var _languageListScrollController;
  static const kbdAssetName = 'assets/kbdnames.txt';

  @override
  void initState() {
    super.initState();
    _languageListScrollController = AutoScrollController();

    widget.client
        .fetchKeyboardLayouts(kbdAssetName, Locale(Intl.defaultLocale));
    final locale = Intl.defaultLocale;
    for (var i = 0; i < widget.client.languagelist.length; ++i) {
      if (widget.client.languagelist[i].item1.languageCode == locale) {
        _selectedLanguageIndex = i;
        break;
      }
    }
    SchedulerBinding.instance.addPostFrameCallback((_) =>
        _languageListScrollController.scrollToIndex(_selectedLanguageIndex,
            preferPosition: AutoScrollPosition.middle,
            duration: Duration(milliseconds: 1)));
  }

  @override
  void dispose() {
    _languageListScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: yaruLightTheme.dividerColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: ListView.builder(
                        controller: _languageListScrollController,
                        itemCount: widget.client.languagelist.length,
                        itemBuilder: (BuildContext context, int index) =>
                            AutoScrollTag(
                          index: index,
                          key: ValueKey(index),
                          controller: _languageListScrollController,
                          child: ListTile(
                            title:
                                Text(widget.client.languagelist[index].item2),
                            selected: index == _selectedLanguageIndex,
                            onTap: () => setState(() {
                              _selectedLanguageIndex = index;
                              final locale =
                                  widget.client.languagelist[index].item1;
                              UbuntuLocalizations.load(locale);
                              widget.client
                                  .fetchKeyboardLayouts(kbdAssetName, locale);
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ButtonBar(
                children: <OutlinedButton>[
                  OutlinedButton(
                    child:
                        Text(UbuntuLocalizations.of(context).goBackButtonText),
                    onPressed: () {},
                  ),
                  OutlinedButton(
                    child: Text(
                        UbuntuLocalizations.of(context).continueButtonText),
                    onPressed: () {
                      Navigator.pushNamed(context, '/tryorinstall');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
