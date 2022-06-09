import 'dart:io';

import 'package:subiquity_client/src/endpoint.dart';
import 'package:test/test.dart';

void main() {
  test('endpoint authority tcp', () {
    final ep = Endpoint(
        InternetAddress('8.8.8.8', type: InternetAddressType.IPv4),
        port: 80);
    expect(ep.authority, '8.8.8.8:80');
  });

  test('endpoint authority tcp localhost', () {
    final ep = Endpoint.localhost(3344);
    expect(ep.authority, '127.0.0.1:3344');
  });

  test('endpoint authority unix', () {
    final ep = Endpoint.unix('/tmp/socket');
    expect(ep.authority, 'localhost');
  });
}
