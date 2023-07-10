import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_model.dart';
import 'package:ubuntu_provision/src/services/active_directory_service.dart';

import 'test_active_directory.dart';

void main() {
  const info = AdConnectionInfo(
    domainName: 'ubuntu.com',
    adminName: 'admin',
    password: 'password',
  );

  test('load AD connection info', () async {
    final service = MockActiveDirectoryService();
    when(service.isUsed()).thenAnswer((_) async => true);
    when(service.getConnectionInfo()).thenAnswer((_) async => info);
    when(service.checkDomainName(info.domainName))
        .thenAnswer((_) async => [AdDomainNameValidation.OK]);
    when(service.checkAdminName(info.adminName))
        .thenAnswer((_) async => AdAdminNameValidation.OK);
    when(service.checkPassword(info.password))
        .thenAnswer((_) async => AdPasswordValidation.OK);

    final model = ActiveDirectoryModel(service);

    expect(await model.init(), isTrue);
    verify(service.isUsed()).called(1);
    verify(service.getConnectionInfo()).called(1);
    verify(service.checkDomainName(info.domainName)).called(1);
    verify(service.checkAdminName(info.adminName)).called(1);
    verify(service.checkPassword(info.password)).called(1);

    expect(model.adminName, info.adminName);
    expect(model.domainName, info.domainName);
    expect(model.password, info.password);
  });

  test('not used', () async {
    final service = MockActiveDirectoryService();
    when(service.isUsed()).thenAnswer((_) async => false);
    when(service.getConnectionInfo()).thenAnswer((_) async => info);

    final model = ActiveDirectoryModel(service);

    expect(await model.init(), isFalse);

    verify(service.isUsed()).called(1);
    verifyNever(service.getConnectionInfo());
  });

  test('domain name', () async {
    final service = MockActiveDirectoryService();
    when(service.checkDomainName('.com'))
        .thenAnswer((_) async => [AdDomainNameValidation.START_DOT]);

    final model = ActiveDirectoryModel(service);
    await model.setDomainName('.com');
    expect(model.domainName, '.com');
    expect(model.domainNameValidation, [AdDomainNameValidation.START_DOT]);
    verify(service.checkDomainName('.com')).called(1);
  });

  test('admin name', () async {
    final service = MockActiveDirectoryService();
    when(service.checkAdminName('@dmin'))
        .thenAnswer((_) async => AdAdminNameValidation.INVALID_CHARS);

    final model = ActiveDirectoryModel(service);
    await model.setAdminName('@dmin');
    expect(model.adminName, '@dmin');
    expect(model.adminNameValidation, AdAdminNameValidation.INVALID_CHARS);
    verify(service.checkAdminName('@dmin')).called(1);
  });

  test('password', () async {
    final service = MockActiveDirectoryService();
    when(service.checkPassword(''))
        .thenAnswer((_) async => AdPasswordValidation.EMPTY);

    final model = ActiveDirectoryModel(service);
    await model.setPassword('');
    expect(model.password, '');
    expect(model.passwordValidation, AdPasswordValidation.EMPTY);
    verify(service.checkPassword('')).called(1);
  });

  test('save AD connection info', () async {
    const info = AdConnectionInfo(
      domainName: 'ubuntu.com',
      adminName: 'admin',
      password: 'password',
    );

    final service = MockActiveDirectoryService();
    when(service.checkDomainName(info.domainName))
        .thenAnswer((_) async => [AdDomainNameValidation.OK]);
    when(service.checkAdminName(info.adminName))
        .thenAnswer((_) async => AdAdminNameValidation.OK);
    when(service.checkPassword(info.password))
        .thenAnswer((_) async => AdPasswordValidation.OK);

    final model = ActiveDirectoryModel(service);
    await model.setDomainName(info.domainName);
    verify(service.checkDomainName(info.domainName)).called(1);
    await model.setAdminName(info.adminName);
    verify(service.checkAdminName(info.adminName)).called(1);
    await model.setPassword(info.password);
    verify(service.checkPassword(info.password)).called(1);

    await model.save();
    verify(service.setConnectionInfo(info)).called(1);
  });

  test('notify changes', () async {
    final service = MockActiveDirectoryService();
    when(service.checkDomainName(any))
        .thenAnswer((_) async => [AdDomainNameValidation.OK]);
    when(service.checkAdminName(any))
        .thenAnswer((_) async => AdAdminNameValidation.OK);
    when(service.checkPassword(any))
        .thenAnswer((_) async => AdPasswordValidation.OK);

    final model = ActiveDirectoryModel(service);

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
    final service = MockActiveDirectoryService();
    when(service.checkDomainName(any))
        .thenAnswer((_) async => [AdDomainNameValidation.OK]);
    when(service.checkAdminName(any))
        .thenAnswer((_) async => AdAdminNameValidation.OK);
    when(service.checkPassword(any))
        .thenAnswer((_) async => AdPasswordValidation.OK);

    final model = ActiveDirectoryModel(service);

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
    final service = MockActiveDirectoryService();
    when(service.getJoinResult())
        .thenAnswer((_) async => AdJoinResult.JOIN_ERROR);

    final model = ActiveDirectoryModel(service);
    expect(await model.getJoinResult(), AdJoinResult.JOIN_ERROR);

    when(service.getJoinResult()).thenAnswer((_) async => AdJoinResult.OK);
    expect(await model.getJoinResult(), AdJoinResult.OK);
  });
}
