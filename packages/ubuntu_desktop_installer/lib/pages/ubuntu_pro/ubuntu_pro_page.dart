import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'ubuntu_pro_model.dart';
import 'ubuntu_pro_widgets.dart';

class UbuntuProPage extends StatefulWidget {
  const UbuntuProPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    final client = getService<UbuntuProClient>();
    final network = getService<NetworkService>();
    return ChangeNotifierProvider(
      create: (_) => UbuntuProModel(client, network),
      child: const UbuntuProPage(),
    );
  }

  @override
  UbuntuProPageState createState() => UbuntuProPageState();
}

class UbuntuProPageState extends State<UbuntuProPage> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    final model = Provider.of<UbuntuProModel>(context, listen: false);
    model.init().then((_) {
      _focusNode.addListener(() {
        if (_focusNode.hasFocus) {
          model.mode = UbuntuProMode.enable;
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UbuntuProModel>(context);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.ubuntuProPageTitle),
      content: LayoutBuilder(builder: (context, constraints) {
        final fieldPadding = EdgeInsets.symmetric(
            horizontal: kContentPadding.left, vertical: 10);
        final fieldWidth = (constraints.maxWidth - fieldPadding.horizontal) *
            kContentWidthFraction;
        return ListView(
          children: <Widget>[
            const UbuntuProHeader(),
            const SizedBox(height: kContentSpacing),
            Text(model.isOnline
                ? lang.ubuntuProInstructions
                : lang.ubuntuProOffline),
            const SizedBox(height: kContentSpacing),
            RadioButton<UbuntuProMode>(
              title: Text(lang.ubuntuProEnable),
              subtitle: Column(
                children: [
                  TokenFormField(
                    fieldWidth: fieldWidth,
                    focusNode: _focusNode,
                  ),
                  Html(
                    data: lang.ubuntuProTokenLabel,
                    style: {
                      'body': Style(
                        margin: const EdgeInsets.only(top: 8),
                        fontSize: FontSize(
                            Theme.of(context).textTheme.caption!.fontSize),
                        color: model.isOnline
                            ? Theme.of(context).textTheme.caption!.color
                            : Theme.of(context).disabledColor,
                      ),
                    },
                    onLinkTap: (url, _, __, ___) {
                      if (url != null) {
                        launchUrl(url);
                      }
                    },
                  ),
                ],
              ),
              value: UbuntuProMode.enable,
              groupValue: model.mode,
              onChanged: model.isOnline
                  ? (_) {
                      _focusNode.requestFocus();
                      model.mode = UbuntuProMode.enable;
                    }
                  : null,
            ),
            const SizedBox(height: kContentSpacing),
            RadioButton<UbuntuProMode>(
              title: Text(lang.ubuntuProSkip),
              subtitle: Text(lang.ubuntuProSkipLabel),
              value: UbuntuProMode.skip,
              groupValue: model.mode,
              onChanged: (_) {
                _focusNode.unfocus();
                model.mode = UbuntuProMode.skip;
              },
            ),
          ],
        );
      }),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction(
          label: lang.ubuntuProAttach,
          enabled: !model.isAttaching && model.hasValidToken,
          visible: model.isEnabled && !model.isAttached,
          onActivated: model.attach,
        ),
        WizardAction.next(
          context,
          enabled: !model.isAttaching,
          visible: !model.isEnabled || model.isAttached,
          onActivated: () async {
            await model.save();
            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
