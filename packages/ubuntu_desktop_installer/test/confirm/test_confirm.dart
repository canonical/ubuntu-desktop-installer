import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/confirm/confirm_model.dart';
import 'package:ubuntu_desktop_installer/pages/confirm/confirm_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_provision/services.dart';

import '../test_utils.dart';
import 'test_confirm.mocks.dart';
export '../test_utils.dart';
export 'test_confirm.mocks.dart';

@GenerateMocks([ConfirmModel])
ConfirmModel buildConfirmModel({
  List<Disk>? disks,
  Map<String, List<Partition>>? partitions,
  Map<String, List<Partition>>? originals,
}) {
  final model = MockConfirmModel();
  when(model.disks).thenReturn(disks ?? <Disk>[]);
  when(model.partitions).thenReturn(partitions ?? <String, List<Partition>>{});
  when(model.getOriginalPartition(any, any)).thenAnswer((i) =>
      originals?[i.positionalArguments.first]?.firstWhereOrNull(
          (p) => p.number == i.positionalArguments.last as int));
  return model;
}

Widget buildConfirmPage(ConfirmModel model) {
  final udev = MockUdevService();
  final sda = MockUdevDeviceInfo();
  when(sda.modelName).thenReturn('SDA');
  when(sda.vendorName).thenReturn('ATA');
  when(udev.bySysname('sda')).thenReturn(sda);
  final sdb = MockUdevDeviceInfo();
  when(sdb.modelName).thenReturn('SDB');
  when(sdb.vendorName).thenReturn('ATA');
  when(udev.bySysname('sdb')).thenReturn(sdb);
  registerMockService<UdevService>(udev);

  return ProviderScope(
    overrides: [
      confirmModelProvider.overrideWith((_) => model),
    ],
    child: const ConfirmPage(),
  );
}
