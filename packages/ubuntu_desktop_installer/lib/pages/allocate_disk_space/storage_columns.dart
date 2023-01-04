import 'package:data_table_2/data_table_2.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import 'storage_types.dart';

export 'package:data_table_2/data_table_2.dart' show ColumnSize;

typedef DiskBuilder = Widget Function(BuildContext context, Disk disk);
typedef GapBuilder = Widget Function(BuildContext context, Disk disk, Gap gap);
typedef PartitionBuilder = Widget Function(
    BuildContext context, Disk disk, Partition partition);

class StorageColumn {
  const StorageColumn({
    required this.size,
    required this.titleBuilder,
    required this.diskBuilder,
    required this.gapBuilder,
    required this.partitionBuilder,
  });

  final ColumnSize size;
  final WidgetBuilder titleBuilder;
  final DiskBuilder diskBuilder;
  final GapBuilder gapBuilder;
  final PartitionBuilder partitionBuilder;
}

class StorageDeviceColumn extends StorageColumn {
  StorageDeviceColumn({required super.size})
      : super(
          titleBuilder: (context) {
            final lang = AppLocalizations.of(context);
            return Text(lang.diskHeadersDevice);
          },
          diskBuilder: (context, disk) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(YaruIcons.drive_harddisk_filled),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    disk.path ?? disk.id,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          },
          gapBuilder: (context, disk, gap) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(YaruIcons.drive_harddisk),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).freeDiskSpace,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          },
          partitionBuilder: (context, disk, partition) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(YaruIcons.drive_harddisk),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    '${disk.path}${partition.number}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          },
        );
}

class StorageTypeColumn extends StorageColumn {
  StorageTypeColumn({required super.size})
      : super(
          titleBuilder: (context) {
            final lang = AppLocalizations.of(context);
            return Text(lang.diskHeadersType, overflow: TextOverflow.ellipsis);
          },
          diskBuilder: (context, disk) {
            return const SizedBox.shrink();
          },
          gapBuilder: (context, disk, gap) {
            return const SizedBox.shrink();
          },
          partitionBuilder: (context, disk, partition) {
            return Text(
              partition.format ?? '',
              overflow: TextOverflow.ellipsis,
            );
          },
        );
}

class StorageMountColumn extends StorageColumn {
  StorageMountColumn({required super.size})
      : super(
          titleBuilder: (context) {
            final lang = AppLocalizations.of(context);
            return Text(
              lang.diskHeadersMountPoint,
              overflow: TextOverflow.ellipsis,
            );
          },
          diskBuilder: (context, disk) {
            return const SizedBox.shrink();
          },
          gapBuilder: (context, disk, gap) {
            return const SizedBox.shrink();
          },
          partitionBuilder: (context, disk, partition) {
            return Text(partition.mount ?? '', overflow: TextOverflow.ellipsis);
          },
        );
}

class StorageSizeColumn extends StorageColumn {
  StorageSizeColumn({required super.size})
      : super(
          titleBuilder: (context) {
            final lang = AppLocalizations.of(context);
            return Text(lang.diskHeadersSize, overflow: TextOverflow.ellipsis);
          },
          diskBuilder: (context, disk) {
            return Text(filesize(disk.size), overflow: TextOverflow.ellipsis);
          },
          gapBuilder: (context, disk, gap) {
            return Text(filesize(gap.size), overflow: TextOverflow.ellipsis);
          },
          partitionBuilder: (context, disk, partition) {
            return Text(
              filesize(partition.size ?? 0),
              overflow: TextOverflow.ellipsis,
            );
          },
        );
}

class StorageSystemColumn extends StorageColumn {
  StorageSystemColumn({required super.size})
      : super(
          titleBuilder: (context) {
            final lang = AppLocalizations.of(context);
            return Text(
              lang.diskHeadersSystem,
              overflow: TextOverflow.ellipsis,
            );
          },
          diskBuilder: (context, disk) {
            return const SizedBox.shrink();
          },
          gapBuilder: (context, disk, gap) {
            return const SizedBox.shrink();
          },
          partitionBuilder: (context, disk, partition) {
            return Text(
              partition.os?.long ?? '',
              overflow: TextOverflow.ellipsis,
            );
          },
        );
}

class StorageWipeColumn extends StorageColumn {
  StorageWipeColumn({required this.onWipe, required super.size})
      : super(
          titleBuilder: (context) {
            final lang = AppLocalizations.of(context);
            return Text(
              lang.diskHeadersFormat,
              overflow: TextOverflow.ellipsis,
            );
          },
          diskBuilder: (context, disk) {
            return const SizedBox.shrink();
          },
          gapBuilder: (context, disk, gap) {
            return const SizedBox.shrink();
          },
          partitionBuilder: (context, disk, partition) {
            return YaruCheckbox(
              value: partition.isWiped,
              onChanged: partition.canWipe
                  ? (wipe) => onWipe(disk, partition, wipe!)
                  : null,
            );
          },
        );

  final void Function(Disk disk, Partition partition, bool wipe) onWipe;
}
