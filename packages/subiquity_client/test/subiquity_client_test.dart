import 'dart:io';

import 'package:subiquity_client/src/types.dart';
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
        '../test/install-sources.yaml'
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

      try {
        await _client.setGuidedStorage(gc); // should throw
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        expect(
            e,
            startsWith(
                'setGuidedStorage({"disk_id":"invalid","use_lvm":false,"password":""}) returned error 500'));
      }

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

      newId = IdentityData(
        realname: '',
        username: '',
        cryptedPassword: '',
        hostname: '',
      );

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

    test('wslconfbase', () async {
      var newConf = WSLConfigurationBase(
        customPath: '/mnt/',
        customMountOpt: '-f',
        genHost: false,
        genResolvconf: false,
      );

      await _client.setWslConfigurationBase(newConf);

      var conf = await _client.wslConfigurationBase();
      expect(conf.customPath, '/mnt/');
      expect(conf.customMountOpt, '-f');
      expect(conf.genHost, false);
      expect(conf.genResolvconf, false);

      newConf = WSLConfigurationBase(
        customPath: '',
        customMountOpt: '',
        genHost: true,
        genResolvconf: true,
      );

      await _client.setWslConfigurationBase(newConf);

      conf = await _client.wslConfigurationBase();
      expect(conf.customPath, '');
      expect(conf.customMountOpt, '');
      expect(conf.genHost, true);
      expect(conf.genResolvconf, true);
    });

    test('wslconfadvanced', () async {
      var newConf = WSLConfigurationAdvanced(
        guiTheme: 'default',
        guiFollowwintheme: true,
        legacyGui: false,
        legacyAudio: false,
        advIpDetect: false,
        wslMotdNews: true,
        automount: true,
        mountfstab: true,
        interopEnabled: true,
        interopAppendwindowspath: true,
      );

      await _client.setWslConfigurationAdvanced(newConf);

      var conf = await _client.wslConfigurationAdvanced();
      expect(conf.guiTheme, 'default');
      expect(conf.guiFollowwintheme, true);
      expect(conf.legacyGui, false);
      expect(conf.legacyAudio, false);
      expect(conf.advIpDetect, false);
      expect(conf.wslMotdNews, true);
      expect(conf.automount, true);
      expect(conf.mountfstab, true);
      expect(conf.interopEnabled, true);
      expect(conf.interopAppendwindowspath, true);

      newConf = WSLConfigurationAdvanced(
        guiTheme: '',
        guiFollowwintheme: false,
        legacyGui: true,
        legacyAudio: true,
        advIpDetect: true,
        wslMotdNews: false,
        automount: false,
        mountfstab: false,
        interopEnabled: false,
        interopAppendwindowspath: false,
      );

      await _client.setWslConfigurationAdvanced(newConf);

      conf = await _client.wslConfigurationAdvanced();
      expect(conf.guiTheme, '');
      expect(conf.guiFollowwintheme, false);
      expect(conf.legacyGui, true);
      expect(conf.legacyAudio, true);
      expect(conf.advIpDetect, true);
      expect(conf.wslMotdNews, false);
      expect(conf.automount, false);
      expect(conf.mountfstab, false);
      expect(conf.interopEnabled, false);
      expect(conf.interopAppendwindowspath, false);
    });
  });
}
