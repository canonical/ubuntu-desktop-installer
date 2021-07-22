import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../constants.dart';
import '../wizard_page.dart';
import 'installation_slides_model.dart';

class InstallationSlidesPage extends StatefulWidget {
  const InstallationSlidesPage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => InstallationSlidesModel(client),
      child: InstallationSlidesPage(),
    );
  }

  @override
  InstallationSlidesPageState createState() => InstallationSlidesPageState();
}

class InstallationSlidesPageState extends State<InstallationSlidesPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<InstallationSlidesModel>(context, listen: false);
    model.init();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InstallationSlidesModel>(context);
    return WizardPage(
      title: const Text('Welcome to Ubuntu'),
      content: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (model.isInstalling) CircularProgressIndicator(),
            const SizedBox(height: kContentSpacing),
            Text(
              model.isDone
                  ? 'Installation complete.\n\nPlease restart the machine.'
                  : model.hasError
                      ? 'Something went wrong.\n\nPlease restart the machine.'
                      : model.isPreparing
                          ? 'Preparing...'
                          : 'Installing... (${model.installationStep + 1}/${model.installationStepCount})',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: <WizardAction>[
        WizardAction(
          label: 'Restart',
          enabled: model.isDone || model.hasError,
          onActivated: model.reboot,
        ),
      ],
    );
  }
}
