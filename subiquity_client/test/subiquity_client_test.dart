import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';

import 'package:subiquity_client/test/test_server.dart';

void main() {
  final _test_server = TestServer();
  var _socket_path;

  setUp(() async {
    _socket_path = await _test_server.start('examples/simple.json');
  });

  tearDown(() async {
    _test_server.stop();
  });

  test('simple server requests', () async {
    final client = SubiquityClient(_socket_path);
    expect(await client.status(), contains('"state": "INTERACTIVE"'));
    expect(await client.keyboard(),
        '{"layout": "us", "variant": "", "toggle": null}');
    // expect(await client.locale(), '"en_US"');
    client.close();
  });
}
