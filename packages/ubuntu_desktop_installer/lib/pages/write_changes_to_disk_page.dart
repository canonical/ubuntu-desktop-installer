import 'dart:convert';

import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import '../routes.dart';

import '../widgets.dart';
import 'wizard_page.dart';

class WriteChangesToDiskPage extends StatefulWidget {
  const WriteChangesToDiskPage({
    Key? key,
  }) : super(key: key);

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
        wipe = json['wipe'],
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
  Widget build(BuildContext context) {
    _storageConfig = ModalRoute.of(context)!.settings.arguments as List?;
    print(
        'Storage config: ${JsonEncoder.withIndent('  ').convert(_storageConfig)}');
    for (var entry in _storageConfig!) {
      entry = entry as Map<String, dynamic>;
      switch (entry['type']) {
        case 'disk':
          _disks.add(_DiskObject.fromJson(entry));
          break;
        case 'partition':
          _partitions.add(_PartitionObject.fromJson(entry));
          break;
        case 'format':
          _formats.add(_FormatObject.fromJson(entry));
          break;
        case 'mount':
          _mounts.add(_MountObject.fromJson(entry));
          break;
        default:
          assert(false, 'Unexpected storage config type');
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

    return LocalizedView(
        builder: (context, lang) => WizardPage(
              title: Text(lang.writeChangesToDisk),
              content: Column(children: <Widget>[
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
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
                        child: Text(text,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    const SizedBox(height: 10),
                  ]);
                }),
              ]),
              actions: <WizardAction>[
                WizardAction(
                  label: lang.backButtonText,
                  onActivated: Navigator.of(context).pop,
                ),
                WizardAction(
                  label: lang.continueButtonText,
                  onActivated: () async {
                    final client =
                        Provider.of<SubiquityClient>(context, listen: false);

                    // Use the default values for a number of endpoints
                    // for which a UI page isn't implemented yet.
                    await client.markConfigured(
                        ['mirror', 'proxy', 'network', 'ssh', 'snaplist']);

                    // Define a default identity until a UI page is implemented
                    // for it.
                    final identity = IdentityData(
                        realname: 'Ubuntu',
                        username: 'ubuntu',
                        cryptedPassword: Crypt.sha512('ubuntu').toString(),
                        hostname: 'ubuntu-desktop');
                    await client.setIdentity(identity);

                    await client.setStorage(_storageConfig!);

                    await client.confirm('/dev/tty1');

                    Navigator.pushNamed(context, Routes.chooseYourLook);
                  },
                ),
              ],
            ));
  }
}
