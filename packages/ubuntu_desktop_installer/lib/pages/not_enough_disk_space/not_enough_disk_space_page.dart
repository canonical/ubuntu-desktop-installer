import 'dart:math';

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'not_enough_disk_space_model.dart';

class NotEnoughDiskSpacePage extends StatelessWidget {
  @visibleForTesting
  const NotEnoughDiskSpacePage({super.key});

  static Widget create(BuildContext context) {
    final service = getService<DiskStorageService>();
    return ChangeNotifierProvider(
      create: (_) => NotEnoughDiskSpaceModel(service),
      child: const NotEnoughDiskSpacePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotEnoughDiskSpaceModel>(context);
    final lang = AppLocalizations.of(context);
    final flavor = Flavor.of(context);
    return Scaffold(
      body: WizardPage(
        title: YaruWindowTitleBar(
          title: Text(lang.notEnoughDiskSpaceTitle),
        ),
        content: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                YaruIcons.drive_harddisk_warning,
                size: min(128.00, MediaQuery.of(context).size.height * 0.2),
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              const SizedBox(height: kContentSpacing),
              Text(lang.notEnoughDiskSpaceUbuntu(flavor.name),
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: kContentSpacing),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lang.notEnoughDiskSpaceRequired,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          filesize(model.installMinimumSize),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lang.notEnoughDiskSpaceAvailable,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          filesize(model.largestDiskSize),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kContentSpacing),
              FilledButton(
                  onPressed: () async {
                    await Wizard.of(context).done();
                    if (context.mounted) {
                      YaruWindow.of(context).close();
                    }
                    // TODO: tell subiquity to quit?
                  },
                  child: Text(lang.quitButtonText)),
            ],
          ),
        ),
      ),
    );
  }
}
