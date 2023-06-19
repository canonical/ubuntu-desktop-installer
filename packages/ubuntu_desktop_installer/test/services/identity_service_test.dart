import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/services/identity_service.dart';

import '../identity/test_identity.dart';

void main() {
  const testIdentityData = IdentityData(
    realname: 'Arthur Dent',
    username: 'adent',
    hostname: 'heart-of-gold',
  );
  const testIdentity = Identity(
    realname: 'Arthur Dent',
    username: 'adent',
    hostname: 'heart-of-gold',
    autoLogin: true,
  );
  test('get identity', () async {
    final client = MockSubiquityClient();
    when(client.getIdentity()).thenAnswer((_) async => testIdentityData);
    final config = MockConfigService();
    when(config.get(SubiquityIdentityService.kAutoLoginUser))
        .thenAnswer((_) async => testIdentity.username);
    final service = SubiquityIdentityService(client, config);
    expect(await service.getIdentity(), equals(testIdentity));

    verify(client.getIdentity()).called(1);
    verify(config.get(SubiquityIdentityService.kAutoLoginUser)).called(1);
  });

  test('set identity', () async {
    final client = MockSubiquityClient();
    final config = MockConfigService();
    final service = SubiquityIdentityService(client, config);
    await service.setIdentity(testIdentity);

    verify(client.setIdentity(testIdentityData)).called(1);
    verify(config.set(
            SubiquityIdentityService.kAutoLoginUser, testIdentity.username))
        .called(1);
  });
}
