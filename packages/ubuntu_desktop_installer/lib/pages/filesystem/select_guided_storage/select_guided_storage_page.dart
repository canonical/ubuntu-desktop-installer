import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'select_guided_storage_model.dart';

/// Select a storage for guided partitioning.
class SelectGuidedStoragePage extends StatefulWidget {
  /// Use [SelectGuidedStoragePage.create] instead.
  @visibleForTesting
  const SelectGuidedStoragePage({super.key});

  /// Creates a [SelectGuidedStoragePage] with [SelectGuidedStorageModel].
  static Widget create(BuildContext context) {
    final service = getService<DiskStorageService>();
    return ChangeNotifierProvider(
      create: (context) => SelectGuidedStorageModel(service),
      child: const SelectGuidedStoragePage(),
    );
  }

  @override
  State<SelectGuidedStoragePage> createState() =>
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

  /// Formats a disk in a pretty way e.g. "sda ATA Maxtor (123 GB)"
  String prettyFormatDisk(Disk disk) {
    final fullName = <String?>[
      disk.model,
      disk.vendor,
    ].where((p) => p?.isNotEmpty == true).join(' ');

    final size = filesize(disk.size);
    return '${disk.sysname} - $size $fullName';
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SelectGuidedStorageModel>(context);
    final lang = AppLocalizations.of(context);
    final flavor = Flavor.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.selectGuidedStoragePageTitle(flavor.name)),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(lang.selectGuidedStorageDropdownLabel),
              const SizedBox(width: kContentSpacing),
              Expanded(
                child: MenuButtonBuilder<int>(
                  values: List.generate(model.storages.length, (i) => i),
                  selected: model.selectedIndex,
                  onSelected: (i) => model.selectStorage(i),
                  itemBuilder: (context, index, child) {
                    final disk = model.getDisk(index);
                    return disk != null
                        ? Text(prettyFormatDisk(disk), key: ValueKey(index))
                        : const SizedBox.shrink();
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: kContentSpacing),
          if (model.selectedStorage != null)
            Text(lang.selectGuidedStorageInfoLabel),
          const SizedBox(height: kContentSpacing * 2),
          if (model.selectedDisk != null)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/select_guided_storage/ubuntu.svg',
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(height: kContentSpacing / 2),
                  Text(
                    flavor.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: kContentSpacing / 2),
                  Text(model.selectedDisk?.sysname ?? ''),
                  const SizedBox(height: kContentSpacing / 2),
                  Text(
                    filesize(model.selectedDisk?.size ?? 0),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardAction.back(context),
        trailing: [
          WizardAction.next(
            context,
            root: model.isDone,
            label: lang.selectGuidedStorageInstallNow,
            onNext: model.saveGuidedStorage,
            // If the user returns back to select another disk, the previously
            // configured guided storage must be reset to avoid multiple disks
            // being configured for guided partitioning.
            onBack: model.resetGuidedStorage,
          ),
        ],
      ),
    );
  }
}
