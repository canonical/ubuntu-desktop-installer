import 'package:flutter_test/flutter_test.dart';
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
    // expect(await _client.locale(), 'en_US');

    var kb = await _client.keyboard();
    expect(kb.layout, 'us');
    expect(kb.variant, '');
    expect(kb.toggle, null);

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

    print(await _client.markConfigured(['1']));
    print(await _client.confirm('a'));
  });
}
