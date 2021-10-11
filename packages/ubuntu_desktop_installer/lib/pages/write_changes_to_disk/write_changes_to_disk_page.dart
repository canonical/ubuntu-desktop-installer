import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'write_changes_to_disk_model.dart';

/// @internal
final log = Logger('write_changes_to_disk');

class WriteChangesToDiskPage extends StatefulWidget {
  const WriteChangesToDiskPage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    final service = Provider.of<DiskStorageService>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => WriteChangesToDiskModel(client, service),
      child: WriteChangesToDiskPage(),
    );
  }

  @override
  _WriteChangesToDiskPageState createState() => _WriteChangesToDiskPageState();
}

class _WriteChangesToDiskPageState extends State<WriteChangesToDiskPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<WriteChangesToDiskModel>(context, listen: false);
    model.init();
  }

  String prettyFormatDisk(Disk disk) {
    final udev = Provider.of<UdevService>(context, listen: false);
    final fullName = <String?>[
      udev.modelName(disk.sysname),
      udev.vendorName(disk.sysname)
    ].where((p) => p?.isNotEmpty == true).join(' ');
    return '$fullName (${disk.sysname})';
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = Provider.of<WriteChangesToDiskModel>(context);
    return WizardPage(
      title: Text(lang.writeChangesToDisk),
      header: Text(lang.writeChangesDescription),
      content: ListView(children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(lang.writeChangesPartitionTablesHeader),
        ),
        const SizedBox(height: kContentSpacing / 2),
        for (final disk in model.disks)
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  prettyFormatDisk(disk),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  key: ValueKey(disk),
                ),
              ),
              const SizedBox(height: kContentSpacing / 2),
            ],
          ),
        const SizedBox(height: kContentSpacing),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(lang.writeChangesPartitionsHeader),
        ),
        const SizedBox(height: 10),
        for (final disk in model.disks)
          for (final partition in model.partitions(disk))
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PartitionLabel(disk, partition),
                const SizedBox(height: kContentSpacing / 2),
              ],
            ),
      ]),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction(
          highlighted: true,
          label: lang.startInstallingButtonText,
          onActivated: () async {
            await model.startInstallation();

            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}

class _PartitionLabel extends StatelessWidget {
  _PartitionLabel(this.disk, this.partition) : super(key: ValueKey(partition));

  final Disk disk;
  final Partition partition;

  String formatPartition(AppLocalizations lang) {
    if (partition.mount?.isNotEmpty == true) {
      return lang.writeChangesPartitionEntryMounted(
        disk.sysname,
        partition.number ?? 0,
        partition.format ?? '',
        partition.mount ?? '',
      );
    } else {
      return lang.writeChangesPartitionEntryUnmounted(
        disk.sysname,
        partition.number ?? 0,
        partition.format ?? '',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Text(formatPartition(lang));
  }
}
