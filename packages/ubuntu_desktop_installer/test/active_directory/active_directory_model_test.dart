import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_model.dart';

void main() {
  test('load AD connection info', () async {
    const info = AdConnectionInfo(
      domainName: 'ubuntu.com',
      adminName: 'admin',
      password: 'password',
    );

    final client = MockSubiquityClient();
    when(client.getActiveDirectory()).thenAnswer((_) async => info);
    when(client.checkActiveDirectoryDomainName(info.domainName))
        .thenAnswer((_) async => [AdDomainNameValidation.OK]);
    when(client.checkActiveDirectoryAdminName(info.adminName))
        .thenAnswer((_) async => AdAdminNameValidation.OK);
    when(client.checkActiveDirectoryPassword(info.password))
        .thenAnswer((_) async => AdPasswordValidation.OK);

    final model = ActiveDirectoryModel(client);

    await model.init();
    verify(client.getActiveDirectory()).called(1);
    verify(client.checkActiveDirectoryDomainName(info.domainName)).called(1);
    verify(client.checkActiveDirectoryAdminName(info.adminName)).called(1);
    verify(client.checkActiveDirectoryPassword(info.password)).called(1);

    expect(model.adminName, info.adminName);
    expect(model.domainName, info.domainName);
    expect(model.password, info.password);
  });

  test('domain name', () async {
    final client = MockSubiquityClient();
    when(client.checkActiveDirectoryDomainName('.com'))
        .thenAnswer((_) async => [AdDomainNameValidation.START_DOT]);

    final model = ActiveDirectoryModel(client);
    await model.setDomainName('.com');
    expect(model.domainName, '.com');
    expect(model.domainNameValidation, [AdDomainNameValidation.START_DOT]);
    verify(client.checkActiveDirectoryDomainName('.com')).called(1);
  });

  test('admin name', () async {
    final client = MockSubiquityClient();
    when(client.checkActiveDirectoryAdminName('@dmin'))
        .thenAnswer((_) async => AdAdminNameValidation.INVALID_CHARS);

    final model = ActiveDirectoryModel(client);
    await model.setAdminName('@dmin');
    expect(model.adminName, '@dmin');
    expect(model.adminNameValidation, AdAdminNameValidation.INVALID_CHARS);
    verify(client.checkActiveDirectoryAdminName('@dmin')).called(1);
  });

  test('password', () async {
    final client = MockSubiquityClient();
    when(client.checkActiveDirectoryPassword(''))
        .thenAnswer((_) async => AdPasswordValidation.EMPTY);

    final model = ActiveDirectoryModel(client);
    await model.setPassword('');
    expect(model.password, '');
    expect(model.passwordValidation, AdPasswordValidation.EMPTY);
    verify(client.checkActiveDirectoryPassword('')).called(1);
  });

  test('save AD connection info', () async {
    const info = AdConnectionInfo(
      domainName: 'ubuntu.com',
      adminName: 'admin',
      password: 'password',
    );

    final client = MockSubiquityClient();
    when(client.checkActiveDirectoryDomainName(info.domainName))
        .thenAnswer((_) async => [AdDomainNameValidation.OK]);
    when(client.checkActiveDirectoryAdminName(info.adminName))
        .thenAnswer((_) async => AdAdminNameValidation.OK);
    when(client.checkActiveDirectoryPassword(info.password))
        .thenAnswer((_) async => AdPasswordValidation.OK);

    final model = ActiveDirectoryModel(client);
    await model.setDomainName(info.domainName);
    verify(client.checkActiveDirectoryDomainName(info.domainName)).called(1);
    await model.setAdminName(info.adminName);
    verify(client.checkActiveDirectoryAdminName(info.adminName)).called(1);
    await model.setPassword(info.password);
    verify(client.checkActiveDirectoryPassword(info.password)).called(1);

    await model.save();
    verify(client.setActiveDirectory(info)).called(1);
  });

  test('notify changes', () async {
    final client = MockSubiquityClient();
    when(client.checkActiveDirectoryDomainName(any))
        .thenAnswer((_) async => [AdDomainNameValidation.OK]);
    when(client.checkActiveDirectoryAdminName(any))
        .thenAnswer((_) async => AdAdminNameValidation.OK);
    when(client.checkActiveDirectoryPassword(any))
        .thenAnswer((_) async => AdPasswordValidation.OK);

    final model = ActiveDirectoryModel(client);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    await model.setDomainName('ubuntu.com');
    expect(wasNotified, isTrue);

    wasNotified = false;
    await model.setAdminName('admin');
    expect(wasNotified, isTrue);

    wasNotified = false;
    await model.setPassword('password');
    expect(wasNotified, isTrue);
  });

  test('validation', () async {
    final client = MockSubiquityClient();
    when(client.checkActiveDirectoryDomainName(any))
        .thenAnswer((_) async => [AdDomainNameValidation.OK]);
    when(client.checkActiveDirectoryAdminName(any))
        .thenAnswer((_) async => AdAdminNameValidation.OK);
    when(client.checkActiveDirectoryPassword(any))
        .thenAnswer((_) async => AdPasswordValidation.OK);

    final model = ActiveDirectoryModel(client);

    expect(model.isValid, isFalse);
    expect(model.isDomainNameValid, isFalse);
    expect(model.isAdminNameValid, isFalse);
    expect(model.isPasswordValid, isFalse);

    await model.setDomainName('ubuntu.com');
    expect(model.isDomainNameValid, isTrue);
    expect(model.isValid, isFalse);

    await model.setAdminName('admin');
    expect(model.isAdminNameValid, isTrue);
    expect(model.isValid, isFalse);

    await model.setPassword('password');
    expect(model.isPasswordValid, isTrue);
    expect(model.isValid, isTrue);
  });

  test('join result', () async {
    final client = MockSubiquityClient();
    when(client.getActiveDirectoryJoinResult())
        .thenAnswer((_) async => AdJoinResult.JOIN_ERROR);

    final model = ActiveDirectoryModel(client);
    expect(await model.getJoinResult(), AdJoinResult.JOIN_ERROR);

    when(client.getActiveDirectoryJoinResult())
        .thenAnswer((_) async => AdJoinResult.OK);
    expect(await model.getJoinResult(), AdJoinResult.OK);
  });
}
