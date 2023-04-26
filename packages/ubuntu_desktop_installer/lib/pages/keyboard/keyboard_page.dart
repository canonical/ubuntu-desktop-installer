import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'keyboard_dialogs.dart';
import 'keyboard_model.dart';

class KeyboardPage extends StatefulWidget {
  const KeyboardPage({
    super.key,
  });

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => KeyboardModel(getService<SubiquityClient>()),
      child: const KeyboardPage(),
    );
  }

  @override
  State<KeyboardPage> createState() => _KeyboardPageState();
}

class _KeyboardPageState extends State<KeyboardPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<KeyboardModel>(context, listen: false);
    model.init().then((_) => model.updateInputSource());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<KeyboardModel>(context);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.keyboardLayoutPageTitle),
      ),
      content: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Expanded(child: Text(lang.chooseYourKeyboardLayout)),
                const SizedBox(width: kContentSpacing),
                OutlinedButton(
                  child: Text(lang.detectButtonText),
                  onPressed: () async {
                    final result = await showDetectKeyboardDialog(context);
                    if (result != null) {
                      model.trySelectLayoutVariant(
                          result.layout, result.variant);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: kContentSpacing),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListWidget.builder(
                      selectedIndex: model.selectedLayoutIndex,
                      itemCount: model.layoutCount,
                      itemBuilder: (context, index) => ListTile(
                        key: ValueKey(index),
                        title: Text(model.layoutName(index)),
                        selected: index == model.selectedLayoutIndex,
                        onTap: () => model.selectLayout(index),
                      ),
                      onKeySearch: (value) {
                        final index = model.searchLayout(value);
                        if (index != -1) {
                          model.selectLayout(index);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: kContentSpacing),
            Row(
              children: [
                Text(lang.keyboardVariant),
                const SizedBox(width: kContentSpacing),
                Expanded(
                  child: MenuButtonBuilder<int>(
                    selected: model.selectedVariantIndex,
                    values: List.generate(model.variantCount, (index) => index),
                    itemBuilder: (context, index, child) {
                      return index < 0 || index >= model.variantCount
                          ? const SizedBox.shrink()
                          : Text(model.variantName(index));
                    },
                    onSelected: model.selectVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: kContentSpacing),
            const Divider(height: 1),
            const SizedBox(height: kContentSpacing),
            TextField(
              decoration: InputDecoration(
                hintText: lang.typeToTest,
              ),
            ),
            const SizedBox(height: kContentSpacing * 2),
          ],
        ),
      ),
      bottomBar: WizardBar(
        leading: WizardAction.back(context),
        trailing: [
          WizardAction.next(
            context,
            enabled: model.isValid,
            onNext: model.save,
          ),
        ],
      ),
    );
  }
}
