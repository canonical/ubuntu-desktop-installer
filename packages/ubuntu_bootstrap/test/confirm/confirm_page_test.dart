import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/pages/confirm/confirm_page.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_confirm.dart';

final testDisks = <Disk>[
  fakeDisk(
    path: '/dev/sda',
    size: 12,
    preserve: false,
    partitions: [
      const Partition(
        path: '/dev/sda1',
        number: 1,
        size: 11,
        mount: '/mnt/1',
        format: 'ext',
        preserve: false,
      ),
      const Partition(
        path: '/dev/sda2',
        number: 2,
        size: 22,
        mount: '/mnt/2',
        format: 'ext2',
        preserve: false,
      )
    ],
  ),
  fakeDisk(
    path: '/dev/sdb',
    size: 23,
    preserve: false,
    partitions: [
      const Partition(
        path: '/dev/sdb3',
        number: 3,
        size: 33,
        wipe: 'superblock',
        mount: '/mnt/3',
        format: 'ext3',
      ),
      const Partition(
        path: '/dev/sdb4',
        number: 4,
        size: 44,
        wipe: 'superblock',
        format: 'ext4',
      ),
      const Partition(
        path: '/dev/sdb5',
        number: 5,
        size: 55,
        mount: '/mnt/5',
      ),
      const Partition(
        path: '/dev/sdb6',
        number: 6,
        size: 66,
        resize: true,
      ),
      const Partition(
        path: '/dev/sdb7',
        number: 7,
        preserve: false,
        wipe: 'superblock',
      ),
    ],
  ),
];

void main() {
  testWidgets('list of disks and partitions', (tester) async {
    final model = buildConfirmModel(disks: testDisks, partitions: {
      testDisks.first.sysname: testDisks.first.partitions.cast<Partition>(),
      testDisks.last.sysname: testDisks.last.partitions.cast<Partition>(),
    });
    await tester.pumpWidget(tester.buildApp((_) => buildConfirmPage(model)));

    for (final disk in testDisks) {
      expect(find.byKey(ValueKey(disk)), findsOneWidget);

      for (final partition in disk.partitions.whereType<Partition>()) {
        expect(find.byKey(ValueKey(partition)), findsOneWidget);
      }
    }
  });

  testWidgets('partition change summary', (tester) async {
    final model = buildConfirmModel(disks: testDisks, partitions: {
      testDisks.first.sysname: testDisks.first.partitions.cast<Partition>(),
      testDisks.last.sysname: testDisks.last.partitions.cast<Partition>(),
    }, originals: {
      'sdb': [const Partition(number: 6, size: 123)],
    });
    await tester.pumpWidget(tester.buildApp((_) => buildConfirmPage(model)));

    final context = tester.element(find.byType(ConfirmPage));
    final l10n = UbuntuBootstrapLocalizations.of(context);

    expect(
        find.html(l10n.confirmPartitionFormatMount('sdb3', 'ext3', '/mnt/3')),
        findsOneWidget);
    expect(
        find.html(l10n.confirmPartitionFormat('sdb4', 'ext4')), findsOneWidget);
    expect(find.html(l10n.confirmPartitionMount('sdb5', '/mnt/5')),
        findsOneWidget);
    expect(find.html(l10n.confirmPartitionResize('sdb6', '123 B', '66 B')),
        findsOneWidget);
    expect(find.html(l10n.confirmPartitionCreate('sdb7')), findsOneWidget);
  });

  testWidgets('starts installation', (tester) async {
    final model = buildConfirmModel();
    await tester.pumpWidget(tester.buildApp((_) => buildConfirmPage(model)));

    final context = tester.element(find.byType(ConfirmPage));
    final l10n = UbuntuBootstrapLocalizations.of(context);

    final installButton = find.button(l10n.confirmInstallButton);
    expect(installButton, findsOneWidget);

    await tester.tap(installButton);
    verifyNever(model.startInstallation());

    await tester.pumpAndSettle(kThemeAnimationDuration);
    verify(model.startInstallation()).called(1);
  });
}
