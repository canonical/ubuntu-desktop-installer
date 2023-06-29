import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/services/storage_service.dart';

void main() {
  final testDisks = <Disk>[fakeDisk(id: 'a'), fakeDisk(id: 'b')];
  final testTargets = testDisks
      .map((disk) => GuidedStorageTargetReformat(diskId: disk.id))
      .toList();

  late SubiquityClient client;

  setUp(() {
    client = MockSubiquityClient();
    when(client.getGuidedStorageV2()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(targets: testTargets));
    when(client.getStorageV2())
        .thenAnswer((_) async => fakeStorageResponse(disks: testDisks));
    when(client.hasRst()).thenAnswer((_) async => false);
    when(client.hasBitLocker()).thenAnswer((_) async => false);
    when(client.getStatus()).thenAnswer((_) async => const ApplicationStatus(
          cloudInitOk: null,
          confirmingTty: '',
          echoSyslogId: '',
          error: null,
          eventSyslogId: '',
          interactive: null,
          logSyslogId: '',
          state: ApplicationState.RUNNING,
        ));
  });

  test('get guided storage', () async {
    final service = StorageService(client);
    expect(await service.getGuidedStorage(),
        equals(fakeGuidedStorageResponse(targets: testTargets)));
    verify(client.getGuidedStorageV2()).called(1);
  });

  test('set guided storage', () async {
    final target = GuidedStorageTargetReformat(
        diskId: testDisks.last.id, allowed: [GuidedCapability.DIRECT]);
    final choice = GuidedChoiceV2(
      target: target,
      capability: GuidedCapability.DIRECT,
      sizingPolicy: SizingPolicy.ALL,
    );
    when(client.setGuidedStorageV2(choice))
        .thenAnswer((_) async => fakeGuidedStorageResponse(configured: choice));
    when(client.setStorageV2()).thenAnswer((_) async => fakeStorageResponse());

    final service = StorageService(client);
    service.guidedTarget = target;
    await service.setGuidedStorage();
    verify(client.setGuidedStorageV2(choice)).called(1);
    verify(client.setStorageV2()).called(1);
  });

  test('use LVM', () async {
    final target = GuidedStorageTargetReformat(
        diskId: testDisks.last.id, allowed: [GuidedCapability.LVM]);
    final choice = GuidedChoiceV2(
      target: target,
      capability: GuidedCapability.LVM,
      sizingPolicy: SizingPolicy.ALL,
    );
    when(client.setGuidedStorageV2(choice))
        .thenAnswer((_) async => fakeGuidedStorageResponse(configured: choice));
    when(client.setStorageV2()).thenAnswer((_) async => fakeStorageResponse());

    final service = StorageService(client);
    service.useLvm = true;

    service.guidedTarget = target;
    await service.setGuidedStorage();
    verify(client.setGuidedStorageV2(choice)).called(1);
    verify(client.setStorageV2()).called(1);
  });

  test('reset guided storage', () async {
    final service = StorageService(client);
    expect(service.hasMultipleDisks, isFalse);
    await service.init();

    await service.getGuidedStorage();
    expect(service.hasMultipleDisks, isTrue);

    when(client.resetStorageV2())
        .thenAnswer((_) async => fakeStorageResponse(disks: []));

    await service.resetStorage();
    expect(service.hasMultipleDisks, isFalse);
  });

  test('get storage', () async {
    when(client.getStorageV2())
        .thenAnswer((_) async => fakeStorageResponse(disks: testDisks));
    when(client.getOriginalStorageV2()).thenAnswer(
        (_) async => fakeStorageResponse(disks: testDisks.reversed.toList()));

    final service = StorageService(client);
    await service.init();
    verify(client.getStorageV2()).called(1);

    expect(await service.getStorage(), equals(testDisks));
    verify(client.getStorageV2()).called(1);

    expect(await service.getOriginalStorage(), equals(testDisks.reversed));
    verify(client.getOriginalStorageV2()).called(1);
  });

  test('set storage', () async {
    when(client.setStorageV2())
        .thenAnswer((_) async => fakeStorageResponse(disks: testDisks));

    final service = StorageService(client);
    expect(await service.setStorage(), equals(testDisks));
    verify(client.setStorageV2()).called(1);
  });

  test('reset storage', () async {
    when(client.resetStorageV2())
        .thenAnswer((_) async => fakeStorageResponse(disks: testDisks));

    final service = StorageService(client);
    expect(await service.resetStorage(), equals(testDisks));
    verify(client.resetStorageV2()).called(1);
  });

  test('needs', () async {
    when(client.getStorageV2())
        .thenAnswer((_) async => fakeStorageResponse(needRoot: true));

    final service = StorageService(client);
    await service.getStorage();

    expect(service.needRoot, isTrue);
    expect(service.needBoot, isFalse);

    when(client.resetStorageV2()).thenAnswer((_) async => fakeStorageResponse(
        needRoot: false, needBoot: true, disks: [], installMinimumSize: 0));

    await service.resetStorage();

    expect(service.needRoot, isFalse);
    expect(service.needBoot, isTrue);
  });

  test('add/edit/remove partition', () async {
    final disk = fakeDisk(id: 'tst');
    const gap = Gap(offset: 2, size: 3, usable: GapUsable.YES);
    const partition = Partition(number: 1);
    final service = StorageService(client);

    when(client.addPartitionV2(disk, gap, partition))
        .thenAnswer((_) async => fakeStorageResponse(disks: testDisks));

    expect(await service.addPartition(disk, gap, partition), equals(testDisks));
    verify(client.addPartitionV2(disk, gap, partition)).called(1);

    when(client.editPartitionV2(disk, partition)).thenAnswer(
        (_) async => fakeStorageResponse(disks: testDisks.reversed.toList()));

    expect(await service.editPartition(disk, partition),
        equals(testDisks.reversed.toList()));
    verify(client.editPartitionV2(disk, partition)).called(1);

    when(client.deletePartitionV2(disk, partition))
        .thenAnswer((_) async => fakeStorageResponse(disks: testDisks));

    expect(await service.deletePartition(disk, partition), equals(testDisks));
    verify(client.deletePartitionV2(disk, partition)).called(1);
  });

  test('add boot partition', () async {
    final disk = fakeDisk(id: 'tst');
    final service = StorageService(client);

    when(client.addBootPartitionV2(disk))
        .thenAnswer((_) async => fakeStorageResponse(disks: testDisks));

    expect(await service.addBootPartition(disk), equals(testDisks));
    verify(client.addBootPartitionV2(disk)).called(1);
  });

  test('reformat disk', () async {
    final disk = fakeDisk(id: 'tst');
    final service = StorageService(client);

    when(client.reformatDiskV2(disk))
        .thenAnswer((_) async => fakeStorageResponse(disks: testDisks));

    expect(await service.reformatDisk(disk), equals(testDisks));
    verify(client.reformatDiskV2(disk)).called(1);
  });

  test('has BitLocker', () async {
    final service = StorageService(client);

    when(client.hasBitLocker()).thenAnswer((_) async => true);
    expect(await service.hasBitLocker(), isTrue);
    verify(client.hasBitLocker()).called(1);

    when(client.hasBitLocker()).thenAnswer((_) async => false);
    expect(await service.hasBitLocker(), isFalse);
    verify(client.hasBitLocker()).called(1);
  });

  test('existing OS', () async {
    const win10 = OsProber(
      long: 'Windows 10',
      label: 'Windows',
      version: '10',
      type: 'windows',
    );
    const ubuntu2110 = OsProber(
      long: 'Ubuntu 21.10',
      label: 'Ubuntu',
      version: '21.10',
      type: 'linux',
    );
    const ubuntu2204 = OsProber(
      long: 'Ubuntu 22.04 LTS',
      label: 'Ubuntu',
      version: '22.04 LTS',
      type: 'linux',
    );

    when(client.getStorageV2()).thenAnswer(
      (_) async => fakeStorageResponse(
        disks: [
          fakeDisk(
            partitions: [
              const Partition(os: win10),
            ],
          ),
          fakeDisk(
            partitions: [
              const Partition(os: ubuntu2110),
              const Partition(os: ubuntu2204),
            ],
          ),
        ],
      ),
    );

    final service = StorageService(client);

    await service.init();
    expect(service.existingOS, equals([win10, ubuntu2110, ubuntu2204]));
  });

  test('guided target', () async {
    final target = GuidedStorageTargetReformat(
        diskId: testDisks.last.id, allowed: [GuidedCapability.DIRECT]);
    final choice = GuidedChoiceV2(
      target: target,
      capability: GuidedCapability.DIRECT,
      sizingPolicy: SizingPolicy.ALL,
    );
    when(client.setGuidedStorageV2(choice))
        .thenAnswer((_) async => fakeGuidedStorageResponse(configured: choice));
    when(client.setStorageV2()).thenAnswer((_) async => fakeStorageResponse());
    when(client.resetStorageV2())
        .thenAnswer((_) async => fakeStorageResponse());

    final service = StorageService(client);
    expect(service.guidedTarget, isNull);

    service.guidedTarget = target;
    expect(service.guidedTarget, target);
    await service.setGuidedStorage();

    await service.resetStorage();
    expect(service.guidedTarget, isNull);
  });

  test('set security key', () async {
    final target = GuidedStorageTargetReformat(
        diskId: testDisks.first.id, allowed: [GuidedCapability.LVM_LUKS]);
    final choice = GuidedChoiceV2(
      target: target,
      password: 'foo123',
      sizingPolicy: SizingPolicy.ALL,
      capability: GuidedCapability.LVM_LUKS,
    );
    when(client.setGuidedStorageV2(choice))
        .thenAnswer((_) async => fakeGuidedStorageResponse(configured: choice));
    when(client.setStorageV2()).thenAnswer((_) async => fakeStorageResponse());

    final service = StorageService(client);
    await service.init();

    service.securityKey = 'foo123';
    expect(service.securityKey, equals('foo123'));

    service.useEncryption = true;
    service.guidedTarget = target;
    await service.setGuidedStorage();
    verify(client.setGuidedStorageV2(choice)).called(1);
    verify(client.setStorageV2()).called(1);
  });
}
