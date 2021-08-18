import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../widgets.dart';
import 'installation_complete_model.dart';

const _kAvatarBorder = Color(0xFFe5e5e5);

class InstallationCompletePage extends StatelessWidget {
  const InstallationCompletePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    return Provider(
      create: (_) => InstallationCompleteModel(client),
      child: InstallationCompletePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<InstallationCompleteModel>(context,
                                listen: false)
                            .reboot();
                      },
                      child: Text(
                        lang.restartInto(
                            ProductInfoExtractor().getProductInfo()),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // TODO: request shutdown
                      io.exit(0);
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
