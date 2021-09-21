import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../l10n.dart';
import '../services.dart';

/// @internal
final log = Logger('write_changes_to_disk');

class WriteChangesToDiskPage extends StatefulWidget {
  const WriteChangesToDiskPage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) => WriteChangesToDiskPage();

  @override
  _WriteChangesToDiskPageState createState() => _WriteChangesToDiskPageState();
}

class _DiskObject {
  final String id;
  final String serial;
  final String path;
  final String name;
  final String wipe;
  final bool preserve;
  final bool grubDevice;

  _DiskObject(this.id, this.serial, this.path, this.name, this.wipe,
      this.preserve, this.grubDevice);

  _DiskObject.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        serial = json['serial'] ?? '',
        path = json['path'],
        name = json['name'],
        wipe = json['wipe'] ?? '',
        preserve = json['preserve'],
        grubDevice = json['grub_device'];

  final List<_PartitionObject> partitions = [];
}

class _PartitionObject {
  final String id;
  final String device;
  final int number;
  final int size;
  final String wipe;
  final String flag;
  final bool preserve;
  final bool grubDevice;

  _PartitionObject(this.id, this.device, this.number, this.size, this.wipe,
      this.flag, this.preserve, this.grubDevice);

  _PartitionObject.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        device = json['device'],
        number = json['number'],
        size = json['size'],
        wipe = json['wipe'] ?? '',
        flag = json['flag'],
        preserve = json['preserve'],
        grubDevice = json['grub_device'] ?? false;

  final List<_FormatObject> formats = [];
}

class _FormatObject {
  final String id;
  final String volume;
  final String fstype;
  final bool preserve;

  _FormatObject(this.id, this.volume, this.fstype, this.preserve);

  _FormatObject.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        volume = json['volume'],
        fstype = json['fstype'],
        preserve = json['preserve'];

  _MountObject? mount;
}

class _MountObject {
  final String id;
  final String device;
  final String path;

  _MountObject(this.id, this.device, this.path);

  _MountObject.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        device = json['device'],
        path = json['path'];
}

class _PartitionChangeComposite {
  final bool primary;
  final String diskSerial;
  final String diskPath;
  final int partitionNumber;
  final String fstype;
  final String mountPath;

  _PartitionChangeComposite(this.primary, this.diskSerial, this.diskPath,
      this.partitionNumber, this.fstype, this.mountPath);
}

class _WriteChangesToDiskPageState extends State<WriteChangesToDiskPage> {
  List<dynamic>? _storageConfig;

  final List<_DiskObject> _disks = [];
  final List<_PartitionObject> _partitions = [];
  final List<_FormatObject> _formats = [];
  final List<_MountObject> _mounts = [];

  final List<_PartitionChangeComposite> _partitionChanges = [];

  @override
  void initState() {
    super.initState();
    final model = Provider.of<DiskStorageService>(context, listen: false);
    _storageConfig = model.storageConfig;

    log.debug(
        'Storage config: ${JsonEncoder.withIndent('  ').convert(_storageConfig)}');
    for (var entry in _storageConfig!) {
      entry = entry as Map<String, dynamic>;
      switch (entry['type']) {
        case 'disk':
          final disk = _DiskObject.fromJson(entry);
          if (!disk.preserve) {
            _disks.add(disk);
          }
          break;
        case 'partition':
          final partition = _PartitionObject.fromJson(entry);
          if (!partition.preserve) {
            _partitions.add(partition);
          }
          break;
        case 'format':
          final format = _FormatObject.fromJson(entry);
          if (!format.preserve) {
            _formats.add(format);
          }
          break;
        case 'mount':
          _mounts.add(_MountObject.fromJson(entry));
          break;
        default:
          log.warning('Unexpected storage config type: ${entry['type']}');
      }
    }
    for (var partition in _partitions) {
      for (var disk in _disks) {
        if (partition.device == disk.id) {
          disk.partitions.add(partition);
        }
      }
    }
    for (var disk in _disks) {
      disk.partitions.sort((a, b) => a.number.compareTo(b.number));
      for (var partition in disk.partitions) {
        for (var format in _formats) {
          for (var mount in _mounts) {
            if (format.id == mount.device) {
              format.mount = mount;
            }
          }
          if (format.volume == partition.id) {
            partition.formats.add(format);
          }
        }
        if (partition.formats.length == 1) {
          final format = partition.formats.first;
          _partitionChanges.add(_PartitionChangeComposite(true, disk.serial,
              disk.path, partition.number, format.fstype, format.mount!.path));
        } else {
          _partitionChanges.add(_PartitionChangeComposite(
              true, disk.serial, disk.path, partition.number, '', ''));
          for (var format in partition.formats) {
            _partitionChanges.add(_PartitionChangeComposite(
                false,
                disk.serial,
                disk.path,
                partition.number,
                format.fstype,
                format.mount!.path));
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.writeChangesToDisk),
      content: ListView(children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Text(lang.writeChangesDescription)),
        const SizedBox(height: 20),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(lang.writeChangesPartitionTablesHeader)),
        const SizedBox(height: 10),
        ...List.generate(
            _disks.length,
            (index) => Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          lang.writeChangesPartitionTablesEntry(
                              _disks[index].serial.isNotEmpty
                                  ? _disks[index].serial
                                  : lang.writeChangesFallbackSerial,
                              _disks[index].path),
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  const SizedBox(height: 10),
                ])),
        const SizedBox(height: 10),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(lang.writeChangesPartitionsHeader)),
        const SizedBox(height: 10),
        ...List.generate(_partitionChanges.length, (index) {
          final change = _partitionChanges[index];
          var text = '';
          if (change.primary) {
            if (change.fstype.isNotEmpty) {
              text = lang.writeChangesPartitionEntryPrimaryFull(
                  change.partitionNumber,
                  change.diskSerial.isNotEmpty
                      ? change.diskSerial
                      : lang.writeChangesFallbackSerial,
                  change.diskPath,
                  change.fstype,
                  change.mountPath);
            } else {
              text = lang.writeChangesPartitionEntryPrimary(
                  change.partitionNumber,
                  change.diskSerial.isNotEmpty
                      ? change.diskSerial
                      : lang.writeChangesFallbackSerial,
                  change.diskPath);
            }
          } else {
            text = lang.writeChangesPartitionEntrySecondary(
                change.fstype, change.mountPath);
          }
          return Column(children: [
            Align(
                alignment: Alignment.centerLeft,
                child:
                    Text(text, style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 10),
          ]);
        }),
      ]),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          onActivated: () async {
            final client = Provider.of<SubiquityClient>(context, listen: false);
            await client.setStorage(_storageConfig!);
            await client.confirm('/dev/tty1');

            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
