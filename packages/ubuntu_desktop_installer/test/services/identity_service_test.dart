import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/services/identity_service.dart';

void main() {
  const testIdentity = IdentityData(
    realname: 'Arthur Dent',
    username: 'adent',
    hostname: 'heart-of-gold',
  );
  test('get identity', () async {
    final client = MockSubiquityClient();
    when(client.getIdentity()).thenAnswer((_) async => testIdentity);
    final service = SubiquityIdentityService(client);
    expect(await service.getIdentity(), equals(testIdentity));

    verify(client.getIdentity()).called(1);
  });

  test('set identity', () async {
    final client = MockSubiquityClient();
    final service = SubiquityIdentityService(client);
    await service.setIdentity(testIdentity);

    verify(client.setIdentity(testIdentity)).called(1);
  });
}
