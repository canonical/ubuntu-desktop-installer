import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/services/network_service.dart';

void main() {
  test('mark network configured', () async {
    final client = MockSubiquityClient();
    final service = SubiquityNetworkService(client);
    await service.markConfigured();
    verify(client.markConfigured(['network'])).called(1);
  });
}
