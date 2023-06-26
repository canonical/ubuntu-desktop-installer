import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'confirm_model.dart';

/// @internal
final log = Logger('confirm');

class ConfirmPage extends ConsumerWidget {
  const ConfirmPage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return ref.read(confirmModelProvider).init().then((_) => true);
  }

  String prettyFormatDisk(Disk disk) {
    final fullName = <String?>[
      disk.model,
      disk.vendor,
    ].where((p) => p?.isNotEmpty == true).join(' ');
    return '$fullName <b>${disk.sysname}</b>';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final model = ref.watch(confirmModelProvider);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.writeChangesToDisk),
      ),
      header: Text(lang.writeChangesDescription),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang.writeChangesDevicesTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: kContentSpacing / 2),
              Text(lang.writeChangesPartitionTablesHeader)
            ],
          ),
          const SizedBox(height: kContentSpacing / 2),
          Flexible(
            child: YaruBorderContainer(
              color: Theme.of(context).colorScheme.surface,
              padding: EdgeInsets.symmetric(
                  horizontal: kContentPadding.left, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final disk in model.disks)
                      Html(
                        data: prettyFormatDisk(disk),
                        style: {'body': Style(margin: Margins.zero)},
                        key: ValueKey(disk),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: kContentSpacing),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang.writeChangesPartitionsTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: kContentSpacing / 2),
              Text(lang.writeChangesPartitionsHeader),
            ],
          ),
          const SizedBox(height: 10),
          Flexible(
            child: YaruBorderContainer(
              color: Theme.of(context).colorScheme.surface,
              padding: EdgeInsets.symmetric(
                  horizontal: kContentPadding.left, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final entry in model.partitions.entries)
                      for (final partition in entry.value)
                        _PartitionLabel(
                          entry.key,
                          partition,
                          model.getOriginalPartition(
                              entry.key, partition.number ?? -1),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            highlighted: true,
            label: lang.startInstallingButtonText,
            onNext: () {
              // start installation after the page transition (#1393)
              Future.delayed(kThemeAnimationDuration).then((_) {
                model.startInstallation();
              });
            },
          ),
        ],
      ),
    );
  }
}

class _PartitionLabel extends StatelessWidget {
  _PartitionLabel(this.sysname, this.partition, this.original)
      : super(key: ValueKey(partition));

  final String sysname;
  final Partition partition;
  final Partition? original;

  String formatPartition(AppLocalizations lang) {
    if (partition.resize == true) {
      return lang.writeChangesPartitionResized(
        '', // TODO: remove unused {disk} argument
        partition.sysname,
        filesize(original?.size ?? 0),
        filesize(partition.size ?? 0),
      );
    } else if (partition.wipe != null && partition.mount?.isNotEmpty == true) {
      return lang.writeChangesPartitionFormattedMounted(
        '', // TODO: remove unused {disk} argument
        partition.sysname,
        partition.format ?? '',
        partition.mount ?? '',
      );
    } else if (partition.wipe != null && partition.format?.isNotEmpty == true) {
      return lang.writeChangesPartitionFormatted(
        '', // TODO: remove unused {disk} argument
        partition.sysname,
        partition.format ?? '',
      );
    } else if (partition.mount?.isNotEmpty == true) {
      return lang.writeChangesPartitionMounted(
        '', // TODO: remove unused {disk} argument
        partition.sysname,
        partition.mount ?? '',
      );
    } else {
      assert(partition.preserve == false);
      return lang.writeChangesPartitionCreated(
        '', // TODO: remove unused {disk} argument
        partition.sysname,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Html(
      data: formatPartition(lang),
      style: {'body': Style(margin: Margins.zero)},
    );
  }
}
