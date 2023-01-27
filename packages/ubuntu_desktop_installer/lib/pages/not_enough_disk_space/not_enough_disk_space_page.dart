import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
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
        header: Text(lang.notEnoughDiskSpaceHeader(
            filesize(model.installMinimumSize), flavor.name)),
        content: Text(model.hasMultipleDisks
            ? lang
                .notEnoughDiskSpaceBiggestDisk(filesize(model.largestDiskSize))
            : lang.notEnoughDiskSpaceHasOnly(filesize(model.largestDiskSize))),
        actions: <WizardAction>[
          WizardAction.done(
            context,
            label: lang.quitButtonText,
            onDone: () => model.quit(),
          ),
        ],
      ),
    );
  }
}
