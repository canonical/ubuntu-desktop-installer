import 'package:test/test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/src/types.dart';
import 'package:subiquity_client/test/test_server.dart';

void main() {
  final _testServer = TestServer();
  final _client = SubiquityClient();
  var _socketPath;

  setUp(() async {
    _socketPath = await _testServer.start('examples/simple.json');
    _client.open(_socketPath);
  });

  tearDown(() async {
    _client.close();
    _testServer.stop();
  });

  test('simple server requests', () async {
    await _client.switchLanguage('en_US');
    expect(await _client.locale(), 'en_US');

    var kb = await _client.keyboard();
    expect(kb.setting?.layout, 'us');
    expect(kb.setting?.variant, '');
    expect(kb.setting?.toggle, null);
    expect(kb.layouts, isNotEmpty);

    var gs = await _client.getGuidedStorage(0, true);
    expect(gs.disks, isNotEmpty);
    expect(gs.disks?[0].size, isNot(0));

    var gc = GuidedChoice(
      diskId: gs.disks?[0].id,
      useLvm: false,
      password: '',
    );

    var sr = await _client.setGuidedStorage(gc);

    expect(await _client.proxy(), '');
    expect(await _client.mirror(), endsWith('archive.ubuntu.com/ubuntu'));

    var id = await _client.identity();
    expect(id.realname, '');
    expect(id.username, '');
    expect(id.cryptedPassword, '');
    expect(id.hostname, '');

    var ssh = await _client.ssh();
    expect(ssh.installServer, false);
    expect(ssh.allowPw, true);
    expect(ssh.authorizedKeys, []);

    var status = await _client.status();
    expect(status.state, ApplicationState.WAITING);
    expect(status.confirmingTty, '');
    expect(status.cloudInitOk, true);
    expect(status.interactive, true);
    expect(status.echoSyslogId, startsWith('subiquity_echo.'));
    expect(status.logSyslogId, startsWith('subiquity_log.'));
    expect(status.eventSyslogId, startsWith('subiquity_event.'));

    await _client.markConfigured(['keyboard']);
    await _client.confirm('1');
  });
}
