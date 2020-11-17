import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/src/types.dart';
import 'package:subiquity_client/test/test_server.dart';

void main() {
  final _test_server = TestServer();
  final _client = SubiquityClient();
  var _socket_path;

  setUp(() async {
    _socket_path = await _test_server.start('examples/simple.json');
    _client.open(_socket_path);
  });

  tearDown(() async {
    _client.close();
    _test_server.stop();
  });

  test('simple server requests', () async {
    // expect(await _client.locale(), 'en_US');

    var kb = await _client.keyboard();
    expect(kb.layout, 'us');
    expect(kb.variant, '');
    expect(kb.toggle, null);

    expect(await _client.proxy(), '');
    expect(await _client.mirror(), endsWith('.archive.ubuntu.com/ubuntu'));

    var id = await _client.identity();
    expect(id.realname, '');
    expect(id.username, '');
    expect(id.crypted_password, '');
    expect(id.hostname, '');

    var ssh = await _client.ssh();
    expect(ssh.install_server, false);
    expect(ssh.allow_pw, true);
    expect(ssh.authorized_keys, []);

    var status = await _client.status();
    expect(status.state, ApplicationState.INTERACTIVE);
    expect(status.early_commands_syslog_id, startsWith('subiquity_commands.'));
    expect(status.log_syslog_id, startsWith('subiquity_log.'));
    expect(status.event_syslog_id, startsWith('subiquity_event.'));

    print(await _client.mark_configured(['1']));
    print(await _client.confirm('a'));
  });
}
