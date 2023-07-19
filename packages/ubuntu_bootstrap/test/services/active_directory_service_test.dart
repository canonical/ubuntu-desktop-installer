import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/services/active_directory_service.dart';
import 'package:ubuntu_provision/src/services/active_directory_service.dart';

void main() {
  group('subiquity', () {
    test('has support', () async {
      final client = MockSubiquityClient();
      when(client.hasActiveDirectorySupport()).thenAnswer((_) async => true);

      final service = SubiquityActiveDirectoryService(client);

      final hasSupport = await service.hasSupport();
      expect(hasSupport, isTrue);

      verify(client.hasActiveDirectorySupport()).called(1);
    });

    test('connection info', () async {
      const ad = AdConnectionInfo(
        adminName: 'admin',
        domainName: 'domain',
        password: 'password',
      );

      final client = MockSubiquityClient();
      when(client.getActiveDirectory()).thenAnswer((_) async => ad);
      when(client.setActiveDirectory(ad)).thenAnswer((_) async {});

      final service = SubiquityActiveDirectoryService(client);

      expect(await service.getConnectionInfo(), equals(ad));

      await service.setConnectionInfo(ad);
      verify(client.setActiveDirectory(ad)).called(1);
    });

    test('validate input', () async {
      final client = MockSubiquityClient();
      when(client.checkActiveDirectoryDomainName('domain'))
          .thenAnswer((_) async => [AdDomainNameValidation.OK]);
      when(client.checkActiveDirectoryAdminName('admin'))
          .thenAnswer((_) async => AdAdminNameValidation.OK);
      when(client.checkActiveDirectoryPassword('password'))
          .thenAnswer((_) async => AdPasswordValidation.OK);

      final service = SubiquityActiveDirectoryService(client);

      expect(
        await service.checkDomainName('domain'),
        equals([AdDomainNameValidation.OK]),
      );
      verify(client.checkActiveDirectoryDomainName('domain')).called(1);

      expect(
        await service.checkAdminName('admin'),
        equals(AdAdminNameValidation.OK),
      );
      verify(client.checkActiveDirectoryAdminName('admin')).called(1);

      expect(
        await service.checkPassword('password'),
        equals(AdPasswordValidation.OK),
      );
      verify(client.checkActiveDirectoryPassword('password')).called(1);
    });

    test('ping domain controller', () async {
      final client = MockSubiquityClient();
      when(client.pingActiveDirectoryDomainController('domain'))
          .thenAnswer((_) async => AdDomainNameValidation.OK);

      final service = SubiquityActiveDirectoryService(client);

      expect(
        await service.pingDomainController('domain'),
        equals(AdDomainNameValidation.OK),
      );
      verify(client.pingActiveDirectoryDomainController('domain')).called(1);
    });

    test('join result', () async {
      final client = MockSubiquityClient();
      when(client.getActiveDirectoryJoinResult())
          .thenAnswer((_) async => AdJoinResult.OK);

      final service = SubiquityActiveDirectoryService(client);

      expect(
        await service.getJoinResult(),
        equals(AdJoinResult.OK),
      );
      verify(client.getActiveDirectoryJoinResult()).called(1);
    });

    test('is used', () async {
      final client = MockSubiquityClient();
      when(client.markConfigured(['active_directory']))
          .thenAnswer((_) async {});

      final service = SubiquityActiveDirectoryService(client);

      expect(await service.isUsed(), isFalse);

      await service.setUsed(true);
      verifyNever(client.markConfigured(['active_directory']));

      expect(await service.isUsed(), isTrue);

      await service.setUsed(false);
      verify(client.markConfigured(['active_directory'])).called(1);

      expect(await service.isUsed(), isFalse);
    });
  });
}
