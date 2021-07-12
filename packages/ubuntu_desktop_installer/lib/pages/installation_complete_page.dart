import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../widgets.dart';
import '../widgets/highlighted_button.dart';
import 'wizard_page.dart';
import '../utils/product_info_extractor.dart';

const _kAvatarBorder = Color(0xFFe5e5e5);

class InstallationCompletePage extends StatelessWidget {
  const InstallationCompletePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => InstallationCompletePage();

  @override
  Widget build(BuildContext context) {
    final TextStyle? boldStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontWeight: FontWeight.bold);
    return LocalizedView(
      builder: (context, lang) => WizardPage(
        title: Text(lang.installationCompleteTitle),
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64, bottom: 32),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _kAvatarBorder,
                    width: 8,
                  ),
                ),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    'assets/version.png',
                  ),
                ),
              ),
            ),
            MarkdownBody(
              data: lang.readyToUse(ProductInfoExtractor().getProductInfo()),
            ),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: HighlightedButton(
                      onPressed: () {
                        //TODO: restart pc
                      },
                      child: Text(
                        lang.restartInto(
                            ProductInfoExtractor().getProductInfo()),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      //TODO: shutdown
                    },
                    child: Text(lang.shutdown),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
