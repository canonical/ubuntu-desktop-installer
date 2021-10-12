import 'dart:io';

import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:test/test.dart';

void main() {
  late SubiquityServer _testServer;
  late SubiquityClient _client;
  var _socketPath;

  test('initialization', () async {
    final client = SubiquityClient();
    final isOpen = client.isOpen;
    Future.delayed(Duration(milliseconds: 1)).then((_) => client.open(''));
    await expectLater(isOpen, completes);
    expect(await isOpen, isTrue);
  });

  group('subiquity', () {
    setUpAll(() async {
      _testServer = SubiquityServer();
      _client = SubiquityClient();
      _socketPath = await _testServer.start(ServerMode.DRY_RUN, [
        '--machine-config',
        'examples/simple.json',
        '--source-catalog',
        '../test/install-sources.yaml',
        '--bootloader',
        'uefi',
      ]);
      _client.open(_socketPath);
    });

    tearDownAll(() async {
      await _client.close();
      await _testServer.stop();
    });

    test('variant', () async {
      // Subiquity doesn't have an API to get the variant, only to set it
      await _client.setVariant(Variant.SERVER);
      await _client.setVariant(Variant.DESKTOP);
    });

    test('source', () async {
      final expected = SourceSelectionAndSetting(sources: <SourceSelection>[
        SourceSelection(
            id: 'ubuntu-desktop',
            name: 'Ubuntu Desktop',
            description: 'Standard Ubuntu Desktop image',
            size: 10,
            variant: 'desktop',
            isDefault: true),
        SourceSelection(
            id: 'ubuntu-desktop-minimal',
            name: 'Ubuntu Desktop (minimized)',
            description: 'Minimized Ubuntu Desktop image',
            size: 5,
            variant: 'desktop',
            isDefault: false)
      ], currentId: 'ubuntu-desktop');

      await _client.setVariant(Variant.DESKTOP);
      var actual = await _client.source();
      expect(actual.sources, unorderedEquals(expected.sources!));
      expect(actual.currentId, 'synthesized');

      await _client.setSource('ubuntu-desktop-minimal');
      actual = await _client.source();
      expect(actual.currentId, 'ubuntu-desktop-minimal');

      await _client.setSource('ubuntu-desktop');
      actual = await _client.source();
      expect(actual.currentId, 'ubuntu-desktop');

      await _client.setVariant(Variant.SERVER);
      actual = await _client.source();
      expect(actual.currentId, 'synthesized');
    });

    test('locale', () async {
      await _client.setLocale('en_US.UTF-8');
      expect(await _client.locale(), 'en_US.UTF-8');
    });

    test('keyboard', () async {
      var ks = KeyboardSetting(
        layout: 'us',
        variant: '',
        toggle: null,
      );

      await _client.setKeyboard(ks);

      var kb = await _client.keyboard();
      expect(kb.setting?.layout, 'us');
      expect(kb.setting?.variant, '');
      expect(kb.setting?.toggle, null);
      expect(kb.layouts, isNotEmpty);
    });

    test('has rst', () async {
      var rst = await _client.hasRst();
      expect(rst, isFalse);
    });

    test('has bitlocker', () async {
      var bitLocker = await _client.hasBitLocker();
      expect(bitLocker, isFalse);
    });

    test('guided storage', () async {
      var gs = await _client.getGuidedStorage(true);
      expect(gs.disks, isNotEmpty);
      expect(gs.disks?[0].size, isNot(0));

      var gc = GuidedChoice(
        diskId: 'invalid',
        useLvm: false,
        password: '',
      );

      await expectLater(() => _client.setGuidedStorage(gc),
          throwsA(predicate((e) {
        return e is SubiquityException &&
            e.method.startsWith('setGuidedStorage(') &&
            e.statusCode == 500;
      })));

      gc = GuidedChoice(
        diskId: gs.disks?[0].id,
        useLvm: false,
        password: '',
      );

      var sr = await _client.setGuidedStorage(gc);
      expect(sr.status, ProbeStatus.DONE);

      await _client.setStorage(sr.config!);
    });

    test('reset storage', () async {
      final response = await _client.resetStorage();
      expect(response.status, ProbeStatus.DONE);
      expect(response.origConfig, isNotNull);
    });

    test('set guided storage v2', () async {
      final guided = await _client.getGuidedStorage(true);
      expect(guided.disks, isNotEmpty);

      final choice = GuidedChoice(
        diskId: guided.disks!.first.id,
        useLvm: false,
      );
      final response = await _client.setGuidedStorageV2(choice);
      expect(response.disks, isNotNull);
      expect(response.disks, isNotEmpty);
    });

    test('get storage v2', () async {
      final response = await _client.getStorageV2();
      expect(response.disks, isNotNull);
      expect(response.disks, isNotEmpty);
    });

    test('set storage v2', () async {
      final response = await _client.setStorageV2();
      expect(response.disks, isNotNull);
      expect(response.disks, isNotEmpty);
    });

    test('reset storage v2', () async {
      final response = await _client.resetStorageV2();
      expect(response.disks, isNotNull);
      expect(response.disks, isNotEmpty);
    });

    test('add/edit/delete partition v2', () async {
      final disks = await _client.resetStorageV2().then((r) => r.disks);
      expect(disks, isNotNull);
      expect(disks, isNotEmpty);

      // add
      var response = await _client.addPartitionV2(
        disks!.first,
        Partition(mount: '/foo', format: 'ext2'),
      );
      expect(response.disks, isNotNull);
      expect(response.disks, hasLength(disks.length));

      final added = response.disks!.last.partitions;
      expect(added, isNotNull);
      expect(added, isNotEmpty);

      expect(added!.last.mount, equals('/foo'));
      expect(added.last.format, equals('ext2'));

      // edit
      response = await _client.editPartitionV2(
        disks.first,
        added.last.copyWith(mount: '/bar', format: 'ext3'),
      );
      expect(response.disks, isNotNull);
      expect(response.disks, hasLength(disks.length));

      final edited = response.disks!.last.partitions;
      expect(edited, isNotNull);
      expect(edited, hasLength(added.length));

      expect(edited!.last.mount, equals('/bar'));
      expect(edited.last.format, equals('ext3'));

      // delete
      response = await _client.deletePartitionV2(
        disks.first,
        edited.last,
      );
      expect(response.disks, isNotNull);
      expect(response.disks, hasLength(disks.length));

      final deleted = response.disks!.last.partitions;
      expect(deleted, isNotNull);
      expect(deleted, hasLength(added.length - 1));
    });

    test('add swap', () async {
      final disks = await _client.resetStorageV2().then((r) => r.disks);
      expect(disks, isNotNull);
      expect(disks, isNotEmpty);

      // add
      var response = await _client.addPartitionV2(
        disks!.first,
        Partition(format: 'swap'),
      );
      expect(response.disks, isNotNull);
      expect(response.disks, hasLength(disks.length));

      final added = response.disks!.last.partitions;
      expect(added, isNotNull);
      expect(added, isNotEmpty);

      expect(added!.last.mount, anyOf(isNull, isEmpty));
      expect(added.last.format, equals('swap'));
    });

    test('add boot partition v2', () async {
      final disks = await _client.resetStorageV2().then((r) => r.disks);
      expect(disks, isNotNull);
      expect(disks, isNotEmpty);

      final response = await _client.addBootPartitionV2(disks!.first);
      expect(response.disks, isNotNull);
      expect(response.disks, hasLength(disks.length));

      final partitions = response.disks!.first.partitions;
      expect(partitions, isNotNull);
      expect(partitions, isNotEmpty);

      expect(partitions!.last.grubDevice, isNotNull);
      expect(partitions.last.grubDevice, isTrue);
    });

    test('reformat disk v2', () async {
      final disks = await _client.resetStorageV2().then((r) => r.disks);
      expect(disks, isNotNull);
      expect(disks, isNotEmpty);

      expect(disks!.first.partitions, isNotNull);
      expect(disks.first.partitions, isEmpty);

      var response = await _client.addPartitionV2(
        disks.first,
        Partition(mount: '/foo', format: 'ext2'),
      );
      expect(response.disks, isNotNull);
      expect(response.disks, hasLength(disks.length));

      expect(response.disks!.first.partitions, isNotNull);
      expect(response.disks!.first.partitions, isNotEmpty);

      response = await _client.reformatDiskV2(disks.first);

      expect(response.disks, isNotNull);
      expect(response.disks, hasLength(disks.length));

      expect(response.disks!.first.partitions, isNotNull);
      expect(response.disks!.first.partitions, isEmpty);
    });

    test('needs root/boot', () async {
      final response = await _client.getStorageV2();
      expect(response.needRoot, isNotNull);
      expect(response.needBoot, isNotNull);
    });

    test('proxy', () async {
      await _client.setProxy('test');
      expect(await _client.proxy(), 'test');
      await _client.setProxy('');
      expect(await _client.proxy(), '');
    });

    test('mirror', () async {
      await _client.setMirror('test');
      expect(await _client.mirror(), endsWith('test'));
      await _client.setMirror('archive.ubuntu.com/ubuntu');
      expect(await _client.mirror(), endsWith('archive.ubuntu.com/ubuntu'));
    });

    test('identity', () async {
      var newId = IdentityData(
        realname: 'ubuntu',
        username: 'ubuntu',
        cryptedPassword:
            r'$6$exDY1mhS4KUYCE/2$zmn9ToZwTKLhCw.b4/b.ZRTIZM30JZ4QrOQ2aOXJ8yk96xpcCof0kxKwuX1kqLG/ygbJ1f8wxED22bTL4F46P0',
        hostname: 'ubuntu-desktop',
      );

      await _client.setIdentity(newId);

      var id = await _client.identity();
      expect(id.realname, 'ubuntu');
      expect(id.username, 'ubuntu');
      expect(id.cryptedPassword, '');
      expect(id.hostname, 'ubuntu-desktop');

      // empty defaults for null values
      newId = IdentityData();

      await _client.setIdentity(newId);

      id = await _client.identity();
      expect(id.realname, '');
      expect(id.username, '');
      expect(id.cryptedPassword, '');
      expect(id.hostname, '');
    });

    test('timezone', () async {
      final systemTimezone =
          Process.runSync('timedatectl', ['show', '-p', 'Timezone', '--value'])
              .stdout
              .toString()
              .trim();
      var tzdata = await _client.timezone();
      expect(tzdata.timezone, systemTimezone);

      try {
        await _client.setTimezone('Pacific/Guam');
        tzdata = await _client.timezone();
        expect(tzdata.timezone, 'Pacific/Guam');
        expect(tzdata.fromGeoIP, isFalse);
      } finally {
        // Restore initial timezone to leave the test system in a clean state
        await _client.setTimezone(systemTimezone);
      }
    },
        skip:
            'fails on headless test systems (CI) because subiquity calls `timedatectl set-timezone`, which requires sudo');

    test('ssh', () async {
      var newSsh = SSHData(
        installServer: true,
        allowPw: false,
        authorizedKeys: [],
      );

      await _client.setSsh(newSsh);

      var ssh = await _client.ssh();
      expect(ssh.installServer, true);
      expect(ssh.allowPw, false);
      expect(ssh.authorizedKeys, []);

      newSsh = SSHData(
        installServer: false,
        allowPw: true,
        authorizedKeys: [],
      );

      await _client.setSsh(newSsh);

      ssh = await _client.ssh();
      expect(ssh.installServer, false);
      expect(ssh.allowPw, true);
      expect(ssh.authorizedKeys, []);
    });

    test('status', () async {
      var status = await _client.status();
      expect(status.state, ApplicationState.WAITING);
      expect(status.confirmingTty, '');
      expect(status.cloudInitOk, true);
      expect(status.interactive, true);
      expect(status.echoSyslogId, startsWith('subiquity_echo.'));
      expect(status.logSyslogId, startsWith('subiquity_log.'));
      expect(status.eventSyslogId, startsWith('subiquity_event.'));

      // Should not block as the status is currently WAITING
      status = await _client.status(current: ApplicationState.RUNNING);
    });

    test('markConfigured', () async {
      await _client.markConfigured(['keyboard']);
    });

    test('confirm', () async {
      await _client.confirm('1');
    });

    test('keyboard detection steps', () async {
      // This test is trying to avoid making too many assumptions on the test
      // data, but a few steps are assumed to be of certain types to be able to
      // test all three step types.

      // assumes that step 0 is a key press step
      final step0 = await _client.getKeyboardStep();
      expect(step0, isA<StepPressKey>());
      final stepPressKey = step0 as StepPressKey;
      expect(stepPressKey.symbols, isNotEmpty);
      expect(stepPressKey.keycodes, isNotEmpty);
      expect(stepPressKey.keycodes!.first, hasLength(2));
      expect(stepPressKey.keycodes!.first.first, isA<int>());
      expect(stepPressKey.keycodes!.first.last, isA<String>());

      // assumes that step 2 is a result step
      final step2 = await _client.getKeyboardStep('2');
      expect(step2, isA<StepResult>());
      final stepResult = step2 as StepResult;
      expect(stepResult.layout, isNotEmpty);
      expect(stepResult.variant, isNotEmpty);

      // assumes that step 3 is a result step
      final step3 = await _client.getKeyboardStep('3');
      expect(step3, isA<StepKeyPresent>());
      final stepKeyPresent = step3 as StepKeyPresent;
      expect(stepKeyPresent.symbol, isNotEmpty);
      expect(stepKeyPresent.yes, isNotEmpty);
      expect(stepKeyPresent.no, isNotEmpty);
    });
  });

  group('wsl', () {
    setUpAll(() async {
      _testServer = SubiquityServer.wsl();
      _client = SubiquityClient();
      _socketPath = await _testServer.start(ServerMode.DRY_RUN);
      _client.open(_socketPath);
    });

    tearDownAll(() async {
      await _client.close();
      await _testServer.stop();
    });

    test('variant', () async {
      // Subiquity doesn't have an API to get the variant, only to set it
      await _client.setVariant(Variant.WSL_SETUP);
      await _client.setVariant(Variant.WSL_CONFIGURATION);
    });

    test('wslconfbase', () async {
      var newConf = WSLConfigurationBase(
        automountRoot: '/mnt/',
        automountOptions: '-f',
        networkGeneratehosts: false,
        networkGenerateresolvconf: false,
      );

      await _client.setWslConfigurationBase(newConf);

      var conf = await _client.wslConfigurationBase();
      expect(conf.automountRoot, '/mnt/');
      expect(conf.automountOptions, '-f');
      expect(conf.networkGeneratehosts, false);
      expect(conf.networkGenerateresolvconf, false);

      newConf = WSLConfigurationBase(
        automountRoot: '',
        automountOptions: '',
        networkGeneratehosts: true,
        networkGenerateresolvconf: true,
      );

      await _client.setWslConfigurationBase(newConf);

      conf = await _client.wslConfigurationBase();
      expect(conf.automountRoot, '');
      expect(conf.automountOptions, '');
      expect(conf.networkGeneratehosts, true);
      expect(conf.networkGenerateresolvconf, true);
    });

    test('wslconfadvanced', () async {
      var newConf = WSLConfigurationAdvanced(
        guiTheme: 'default',
        guiFollowwintheme: true,
        interopGuiintegration: false,
        interopAudiointegration: false,
        interopAdvancedipdetection: false,
        motdWSLnewsenabled: true,
        automountEnabled: true,
        automountMountfstab: true,
        interopEnabled: true,
        interopAppendwindowspath: true,
      );

      await _client.setWslConfigurationAdvanced(newConf);

      var conf = await _client.wslConfigurationAdvanced();
      expect(conf.guiTheme, 'default');
      expect(conf.guiFollowwintheme, true);
      expect(conf.interopGuiintegration, false);
      expect(conf.interopAudiointegration, false);
      expect(conf.interopAdvancedipdetection, false);
      expect(conf.motdWSLnewsenabled, true);
      expect(conf.automountEnabled, true);
      expect(conf.automountMountfstab, true);
      expect(conf.interopEnabled, true);
      expect(conf.interopAppendwindowspath, true);

      newConf = WSLConfigurationAdvanced(
        guiTheme: '',
        guiFollowwintheme: false,
        interopGuiintegration: true,
        interopAudiointegration: true,
        interopAdvancedipdetection: true,
        motdWSLnewsenabled: false,
        automountEnabled: false,
        automountMountfstab: false,
        interopEnabled: false,
        interopAppendwindowspath: false,
      );

      await _client.setWslConfigurationAdvanced(newConf);

      conf = await _client.wslConfigurationAdvanced();
      expect(conf.guiTheme, '');
      expect(conf.guiFollowwintheme, false);
      expect(conf.interopGuiintegration, true);
      expect(conf.interopAudiointegration, true);
      expect(conf.interopAdvancedipdetection, true);
      expect(conf.motdWSLnewsenabled, false);
      expect(conf.automountEnabled, false);
      expect(conf.automountMountfstab, false);
      expect(conf.interopEnabled, false);
      expect(conf.interopAppendwindowspath, false);
    });
  });
}
