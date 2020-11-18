import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:ubuntu_desktop_installer/i18n.dart';
import 'package:yaru/yaru.dart';

import 'package:subiquity_client/subiquity_client.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key key,
    this.client,
  }) : super(key: key);

  final SubiquityClient client;

  @override
  _WelcomePageState createState() => _WelcomePageState();

  String get title => Intl.message('Welcome');
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedLanguageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      itemCount: widget.client.languagelist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(widget.client.languagelist[index].item2),
                          selected: index == _selectedLanguageIndex,
                          onTap: () {
                            setState(() {
                              _selectedLanguageIndex = index;
                              UbuntuLocalizations.load(
                                  widget.client.languagelist[index].item1);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ButtonBar(
              children: <OutlinedButton>[
                OutlinedButton(
                  child: Text(UbuntuLocalizations.of(context).goBackButtonText),
                  onPressed: null,
                ),
                OutlinedButton(
                  child:
                      Text(UbuntuLocalizations.of(context).continueButtonText),
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
}
