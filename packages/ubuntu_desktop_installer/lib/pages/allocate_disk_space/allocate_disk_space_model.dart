import 'dart:async';

import 'package:filesize/filesize.dart';
import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

export 'package:subiquity_client/subiquity_client.dart' show Disk, Partition;

/// The default mount points for auto-completion.
const kDefaultMountPoints = <String>[
  '/',
  '/boot',
  '/home',
  '/tmp',
  '/usr',
  '/var',
  '/srv',
  '/opt',
  '/usr/local',
];

/// Available partition formats.
class PartitionFormat {
  const PartitionFormat._(this.type);

  /// The type of the partition format (e.g. 'ext4').
  final String type;

  String toString() => type;

  static const btrfs = PartitionFormat._('btrfs');
  static const ext2 = PartitionFormat._('ext2');
  static const ext3 = PartitionFormat._('ext3');
  static const ext4 = PartitionFormat._('ext4');
  static const fat = PartitionFormat._('fat');
  static const fat12 = PartitionFormat._('fat12');
  static const fat16 = PartitionFormat._('fat16');
  static const fat32 = PartitionFormat._('fat32');
  static const iso9660 = PartitionFormat._('iso9660');
  static const vfat = PartitionFormat._('vfat');
  static const jfs = PartitionFormat._('jfs');
  static const ntfs = PartitionFormat._('ntfs');
  static const reiserfs = PartitionFormat._('reiserfs');
  static const swap = PartitionFormat._('swap');
  static const xfs = PartitionFormat._('xfs');
  static const zfsroot = PartitionFormat._('zfsroot');

  /// The default partition format.
  static PartitionFormat get defaultValue => _formats['ext4']!;

  /// Converts a Partition object to a PartitionFormat enum value.
  static PartitionFormat? fromPartition(Partition partition) =>
      _formats[partition.format];

  /// Available partition formats.
  static List<PartitionFormat> get values => _formats.values.toList();

  static const _formats = <String, PartitionFormat>{
    'btrfs': btrfs,
    'ext2': ext2,
    'ext3': ext3,
    'ext4': ext4,
    'fat': fat,
    'fat12': fat12,
    'fat16': fat16,
    'fat32': fat32,
    'iso9660': iso9660,
    'vfat': vfat,
    'jfs': jfs,
    'ntfs': ntfs,
    'reiserfs': reiserfs,
    'swap': swap,
    'xfs': xfs,
    'zfsroot': zfsroot,
  };
}

/// The location of the partition within to the available space around.
enum PartitionLocation {
  /// At the beginning of the free space.
  beginning,

  /// At the end of the free space.
  end,
}

/// View model for [AllocateDiskSpacePage].
class AllocateDiskSpaceModel extends ChangeNotifier {
  /// Creates a new model with the given disk storage service.
  AllocateDiskSpaceModel(this._service);

  final DiskStorageService _service;

  var _disks = <Disk>[];
  var _selectedDiskIndex = -1;
  var _selectedPartitionIndex = -1;
  int _bootDiskIndex = -1;

  /// Whether the current input is valid.
  bool get isValid => !_service.needRoot && !_service.needBoot;

  /// The list of all disks.
  List<Disk> get disks => _disks;

  /// Returns the selected disk, or null if no disk is selected.
  Disk? get selectedDisk => disks.elementAtOrNull(_selectedDiskIndex);

  /// The index of the selected disk, or -1 if no disk is selected.
  int get selectedDiskIndex => _selectedDiskIndex;

  /// Returns the selected partition, or null if no partition is selected.
  Partition? get selectedPartition =>
      selectedDisk?.partitions?.elementAtOrNull(_selectedPartitionIndex);

  /// The index of the selected disk's selected partition, or -1 if no partition
  /// is selected.
  int get selectedPartitionIndex => _selectedPartitionIndex;

  /// Returns true if the specified disk or its partition is selected.
  bool isStorageSelected(int diskIndex, [int partitionIndex = -1]) {
    return diskIndex == _selectedDiskIndex &&
        partitionIndex == _selectedPartitionIndex;
  }

  /// Notifies selection changes for auto-scrolling.
  Stream get onSelectionChanged => _selectionController.stream;
  final _selectionController = StreamController();

  /// Whether a partition can be added for the currently selected disk.
  bool get canAddPartition =>
      selectedDisk != null &&
      selectedDisk!.preserve != true &&
      (selectedDisk!.freeForPartitions ?? 0) > 0 &&
      selectedPartition == null;

  /// Whether the currently selected partition can be removed.
  bool get canRemovePartition =>
      selectedDisk != null &&
      selectedDisk!.preserve != true &&
      selectedPartition != null &&
      selectedPartition!.preserve != true;

  /// Whether the currently selected partition can be edited.
  bool get canEditPartition => selectedPartition != null;

  /// Whether the currently selected disk can be reformatted.
  bool get canReformatDisk => selectedDisk != null && selectedPartition == null;

  /// Adds a partition.
  Future<void> addPartition(
    Disk disk, {
    required int size,
    required PartitionFormat? format,
    required String? mount,
  }) {
    final partition = Partition(
      size: size,
      format: format?.type,
      mount: mount,
    );
    return _service.addPartition(disk, partition).then((disks) {
      _updateDisks(disks);
      selectStorage(
        _selectedDiskIndex,
        (selectedDisk?.partitions?.length ?? 0) - 1,
      );
    });
  }

  /// Edits a partition.
  Future<void> editPartition(
    Disk disk,
    Partition partition, {
    PartitionFormat? format,
    bool? wipe,
    String? mount,
  }) {
    final newPartition = partition.copyWith(
      format: format?.type,
      mount: mount,
      wipe: wipe,
    );
    return _service.editPartition(disk, newPartition).then(_updateDisks);
  }

  /// Deletes a partition.
  Future<void> deletePartition(Disk disk, Partition partition) async {
    final wasSelected = disk == selectedDisk;
    await _service.deletePartition(disk, partition).then(_updateDisks);
    if (wasSelected) {
      var index = _selectedPartitionIndex - 1;
      if (index < 0 && selectedDisk?.partitions?.isNotEmpty == true) {
        index = 0;
      }
      selectStorage(_selectedDiskIndex, index);
    }
    notifyListeners();
  }

  /// Selects the specified disk or its partition.
  void selectStorage(int diskIndex, [int partitionIndex = -1]) {
    if (isStorageSelected(diskIndex, partitionIndex)) {
      return;
    }

    _selectedDiskIndex = diskIndex;
    _selectedPartitionIndex = partitionIndex;
    _selectionController.add(null);
    notifyListeners();
  }

  /// The index of the selected boot disk.
  int? get bootDiskIndex => _bootDiskIndex != -1 ? _bootDiskIndex : null;

  /// Selects the specified boot disk.
  void selectBootDisk(int diskIndex) {
    if (_bootDiskIndex == diskIndex || disks[diskIndex].bootDevice == true) {
      return;
    }
    _bootDiskIndex = diskIndex;
    _service.addBootPartition(disks[diskIndex]).then(_updateDisks);
  }

  /// Fetches storage from the service.
  Future<void> getStorage() {
    return _service.getStorage().then(_updateDisks);
  }

  /// Applies storage via the service.
  Future<void> setStorage() {
    return _service.setStorage(_disks).then(_updateDisks);
  }

  /// Resets the storage via the service.
  Future<void> resetStorage() {
    return _service.resetStorage().then(_updateDisks);
  }

  /// Creates a new partition on the disk.
  Future<void> reformatDisk(Disk disk) {
    return _service.reformatDisk(disk).then(_updateDisks);
  }

  void _updateDisks(List<Disk> disks) {
    if (_disks == disks) return;
    _disks = disks;
    if (_selectedDiskIndex == -1 || _selectedDiskIndex >= disks.length) {
      selectStorage(disks.isEmpty ? -1 : 0);
    }
    _bootDiskIndex = disks.indexWhere((disk) => disk.bootDevice == true);
    notifyListeners();
  }

  @override
  void dispose() {
    _selectionController.close();
    super.dispose();
  }
}

extension DiskExtension on Disk {
  String get prettySize => filesize(size ?? 0);
}

extension PartitionExtension on Partition {
  bool get canWipe => preserve == true && mount != null;
  String get prettySize => filesize(size ?? 0);
}
