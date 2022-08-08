import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'write_changes_to_disk_model.dart';

/// @internal
final log = Logger('write_changes_to_disk');

class WriteChangesToDiskPage extends StatefulWidget {
  const WriteChangesToDiskPage({
    super.key,
  });

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    final service = getService<DiskStorageService>();
    return ChangeNotifierProvider(
      create: (_) => WriteChangesToDiskModel(client, service),
      child: const WriteChangesToDiskPage(),
    );
  }

  @override
  State<WriteChangesToDiskPage> createState() => _WriteChangesToDiskPageState();
}

class _WriteChangesToDiskPageState extends State<WriteChangesToDiskPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<WriteChangesToDiskModel>(context, listen: false);
    model.init();
  }

  String prettyFormatDisk(Disk disk) {
    final fullName = <String?>[
      disk.model,
      disk.vendor,
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
        for (final entry in model.partitions.entries)
          for (final partition in entry.value)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PartitionLabel(entry.key, partition),
                const SizedBox(height: kContentSpacing / 2),
              ],
            ),
      ]),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          highlighted: true,
          label: lang.startInstallingButtonText,
          onNext: model.startInstallation,
        ),
      ],
    );
  }
}

class _PartitionLabel extends StatelessWidget {
  _PartitionLabel(this.sysname, this.partition)
      : super(key: ValueKey(partition));

  final String sysname;
  final Partition partition;

  String formatPartition(AppLocalizations lang) {
    if (partition.mount?.isNotEmpty == true) {
      return lang.writeChangesPartitionEntryMounted(
        sysname,
        partition.number ?? 0,
        partition.format ?? '',
        partition.mount ?? '',
      );
    } else {
      return lang.writeChangesPartitionEntryUnmounted(
        sysname,
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
