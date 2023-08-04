import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class RecoveryKeyPage extends StatelessWidget {
  const RecoveryKeyPage({super.key});

  static Widget create(BuildContext context) {
    return const RecoveryKeyPage();
  }

  @override
  Widget build(BuildContext context) {
    return WizardPage(
      title: const YaruWindowTitleBar(
        title: Text('TPM recovery key'),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'You can access your recovery key after installation with the following command:'),
          const SizedBox(height: kContentSpacing / 2),
          Container(
            color: Theme.of(context).highlightColor,
            padding:
                const EdgeInsetsDirectional.only(start: 4, top: 2, bottom: 3),
            child: SelectableText(
              'snap recovery --show-keys',
              style: TextStyle(
                inherit: false,
                fontFamily: 'Ubuntu Mono',
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
          const SizedBox(height: kContentSpacing),
          FractionallySizedBox(
            widthFactor: kContentWidthFraction,
            child: Html(
              data:
                  '<font color="${Theme.of(context).colorScheme.error.toHex()}">Warning:</font> If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.',
              style: {
                'body': Style(margin: Margins.zero),
              },
            ),
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardAction.back(context),
        trailing: [
          WizardAction.next(context),
        ],
      ),
    );
  }
}
