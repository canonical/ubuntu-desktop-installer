import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'select_guided_storage_model.dart';

/// Select a storage for guided partitioning.
class SelectGuidedStoragePage extends StatefulWidget {
  /// Use [SelectGuidedStoragePage.create] instead.
  @visibleForTesting
  const SelectGuidedStoragePage({Key? key}) : super(key: key);

  /// Creates a [SelectGuidedStoragePage] with [SelectGuidedStorageModel].
  static Widget create(BuildContext context) {
    final service = getService<DiskStorageService>();
    return ChangeNotifierProvider(
      create: (context) => SelectGuidedStorageModel(service),
      child: const SelectGuidedStoragePage(),
    );
  }

  @override
  _SelectGuidedStoragePageState createState() =>
      _SelectGuidedStoragePageState();
}

class _SelectGuidedStoragePageState extends State<SelectGuidedStoragePage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<SelectGuidedStorageModel>(context, listen: false);
    model.loadGuidedStorage();
  }

  String prettyFormatPartition(Disk disk, Partition partition) {
    return '${disk.sysname}${partition.number}';
  }

  /// Formats a disk in a pretty way e.g. "/dev/sda ATA Maxtor (123 GB)"
  String prettyFormatStorage(Disk disk) {
    final fullName = <String?>[
      disk.model,
      disk.vendor,
    ].where((p) => p?.isNotEmpty == true).join(' ');

    final size = filesize(disk.size);
    return '${disk.path} - $size $fullName';
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SelectGuidedStorageModel>(context);
    final lang = AppLocalizations.of(context);
    final flavor = Flavor.of(context);
    return WizardPage(
      title: Text(lang.selectGuidedStoragePageTitle(flavor.name)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(lang.selectGuidedStorageDropdownLabel),
              const SizedBox(width: kContentSpacing),
              Expanded(
                child: DropdownBuilder<int>(
                  values: List.generate(model.storages.length, (i) => i),
                  selected: model.selectedIndex,
                  onSelected: (i) => model.selectStorage(i!),
                  itemBuilder: (context, index, child) {
                    final storage = model.storages[index];
                    return Text(
                      prettyFormatStorage(storage),
                      key: ValueKey(index),
                    );
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: kContentSpacing),
          if (model.selectedStorage != null)
            Text(lang.selectGuidedStorageInfoLabel),
          const SizedBox(height: kContentSpacing * 2),
          if (model.selectedStorage != null)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/cof_orange_hex.svg',
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(height: kContentSpacing / 2),
                  Text(
                    flavor.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: kContentSpacing / 2),
                  Text(model.selectedStorage?.path ?? ''),
                  const SizedBox(height: kContentSpacing / 2),
                  Text(
                    filesize(model.selectedStorage?.size ?? 0),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction(
          label: lang.selectGuidedStorageInstallNow,
          onActivated: () async {
            await model.saveGuidedStorage();
            await Wizard.of(context).next();

            // If the user returns back to select another disk, the previously
            // configured guided storage must be reset to avoid multiple disks
            // being configured for guided partitioning.
            await model.resetGuidedStorage();
          },
        )
      ],
    );
  }
}
