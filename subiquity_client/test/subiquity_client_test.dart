import 'package:flutter_test/flutter_test.dart';

import 'package:subiquity_client/subiquity_client.dart';

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
    _test_server.stop();
    _client.close();
  });

  test('simple server requests', () async {
    expect(await _client.status(), contains('"state": "INTERACTIVE"'));
    expect(await _client.keyboard(),
        '{"layout": "us", "variant": "", "toggle": null}');
    // expect(await client.locale(), '"en_US"');
  });
}
