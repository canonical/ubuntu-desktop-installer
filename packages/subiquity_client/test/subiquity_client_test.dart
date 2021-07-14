import 'dart:io';

import 'package:subiquity_client/src/types.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:test/test.dart';

void main() {
  final _testServer = SubiquityServer();
  final _client = SubiquityClient();
  var _socketPath;

  setUpAll(() async {
    _socketPath =
        await _testServer.start(ServerMode.DRY_RUN, 'examples/simple.json');
    _client.open(_socketPath);
  });

  tearDownAll(() async {
    _client.close();
    await _testServer.stop();
  });

  test('locale', () async {
    await _client.setLocale('en_US');
    expect(await _client.locale(), 'en_US');
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

  test('guided storage', () async {
    var gs = await _client.getGuidedStorage(0, true);
    expect(gs.disks, isNotEmpty);
    expect(gs.disks?[0].size, isNot(0));

    var gc = GuidedChoice(
      diskId: 'invalid',
      useLvm: false,
      password: '',
    );

    // TODO: Re-enable once we figure out why _client.send() sometimes hangs in setGuidedStorage()
    // try {
    //   await _client.setGuidedStorage(gc); // should throw
    //   // ignore: avoid_catches_without_on_clauses
    // } catch (e) {
    //   expect(
    //       e,
    //       startsWith(
    //           'setGuidedStorage({"disk_id":"invalid","use_lvm":false,"password":""}) returned error 500'));
    // }

    gc = GuidedChoice(
      diskId: gs.disks?[0].id,
      useLvm: false,
      password: '',
    );

    var sr = await _client.setGuidedStorage(gc);
    expect(sr.status, ProbeStatus.DONE);

    await _client.setStorage(sr.config!);
  });

  test('proxy', () async {
    // TODO: Re-enable once we figure out why _client.setProxy() sometimes hangs
    // await _client.setProxy('test');
    // expect(await _client.proxy(), 'test');
    // await _client.setProxy('');
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
}
