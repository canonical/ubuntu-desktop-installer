import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/ubuntu_pro/ubuntu_pro_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'ubuntu_pro_model_test.mocks.dart';

String generateToken(int length) {
  final rnd = Random(123);
  const chars =
      '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final codes = List.generate(length, (i) => rnd.nextInt(chars.length - 1));
  return String.fromCharCodes(codes);
}

@GenerateMocks([UbuntuProClient])
void main() {
  test('init', () async {
    final client = MockUbuntuProClient();
    when(client.daemonVersion).thenReturn('');
    when(client.connect()).thenAnswer((_) async => true);

    final model = UbuntuProModel(client);
    expect(model.status, UbuntuProStatus.init);

    await model.init();

    expect(model.status, UbuntuProStatus.ready);
  });

  test('save', () async {
    final client = MockUbuntuProClient();

    final model = UbuntuProModel(client);

    await model.save();

    // TODO: check that the token was saved
  });

  test('dispose', () async {
    final client = MockUbuntuProClient();

    final model = UbuntuProModel(client);
    model.dispose();

    verify(client.close()).called(1);
  });

  test('mode', () {
    bool? wasNotified;

    final model = UbuntuProModel(MockUbuntuProClient());
    model.addListener(() => wasNotified = true);
    expect(model.mode, UbuntuProMode.skip);

    model.mode = UbuntuProMode.enable;
    expect(model.mode, UbuntuProMode.enable);
    expect(model.isEnabled, isTrue);
    expect(wasNotified, isTrue);

    wasNotified = null;

    model.mode = UbuntuProMode.skip;
    expect(model.mode, UbuntuProMode.skip);
    expect(model.isEnabled, isFalse);
    expect(wasNotified, isTrue);
  });

  test('token validation', () {
    expect(UbuntuProModel.isValidToken(generateToken(0)), isFalse);
    expect(UbuntuProModel.isValidToken(generateToken(23)), isFalse);
    expect(UbuntuProModel.isValidToken(generateToken(24)), isTrue);
    expect(UbuntuProModel.isValidToken(generateToken(32)), isTrue);
    expect(UbuntuProModel.isValidToken(generateToken(33)), isFalse);
  });

  test('token', () {
    bool? wasNotified;

    final model = UbuntuProModel(MockUbuntuProClient());
    model.addListener(() => wasNotified = true);
    expect(model.hasValidToken, isFalse);
    expect(model.token, isEmpty);

    model.token = generateToken(1);
    expect(model.hasValidToken, isFalse);
    expect(model.token, hasLength(1));
    expect(model.status, UbuntuProStatus.ready);
    expect(wasNotified, isTrue);

    wasNotified = null;

    model.token = generateToken(28);
    expect(model.hasValidToken, isTrue);
    expect(model.token, hasLength(28));
    expect(model.status, UbuntuProStatus.ready);
    expect(wasNotified, isTrue);
  });

  test('attach', () async {
    final client = MockUbuntuProClient();
    when(client.isAttached).thenReturn(false);
    when(client.attach('token1234')).thenAnswer((_) async {});

    final model = UbuntuProModel(client);
    model.token = 'token1234';

    bool? wasAttaching;
    final statusChanges = <UbuntuProStatus>[];
    model.addListener(() {
      if (model.status == UbuntuProStatus.attaching) {
        wasAttaching = model.isAttaching;
      }
      if (statusChanges.lastOrNull != model.status) {
        statusChanges.add(model.status);
      }
    });

    expect(model.isAttached, isFalse);
    expect(model.isAttaching, isFalse);

    await model.attach();

    verify(client.attach('token1234')).called(1);
    expect(statusChanges, [
      UbuntuProStatus.attaching,
      UbuntuProStatus.attached,
    ]);
    expect(model.isAttached, isTrue);
    expect(model.isAttaching, isFalse);
    expect(wasAttaching, isTrue);
  });

  test('detach', () async {
    final client = MockUbuntuProClient();
    when(client.detach()).thenAnswer((_) async {});

    final model = UbuntuProModel(client);

    final statusChanges = <UbuntuProStatus>[];
    model.addListener(() {
      if (statusChanges.lastOrNull != model.status) {
        statusChanges.add(model.status);
      }
    });

    await model.detach();

    verify(client.detach()).called(1);
    expect(statusChanges, [
      UbuntuProStatus.detaching,
      UbuntuProStatus.detached,
    ]);
  });

  test('attach failure', () async {
    final client = MockUbuntuProClient();
    when(client.isAttached).thenReturn(false);
    when(client.attach('token1234')).thenThrow(UbuntuProAuthFailedException());

    final model = UbuntuProModel(client);
    model.token = 'token1234';

    final statusChanges = <UbuntuProStatus>[];
    model.addListener(() {
      if (statusChanges.lastOrNull != model.status) {
        statusChanges.add(model.status);
      }
    });

    expect(model.hasError, isFalse);
    expect(model.error, isNull);

    await model.attach();

    verify(client.attach('token1234')).called(1);
    expect(statusChanges, [
      UbuntuProStatus.attaching,
      UbuntuProStatus.error,
    ]);
    expect(model.hasError, isTrue);
    expect(model.error, equals(UbuntuProError.authFailed));
  });

  test('detach failure', () async {
    final client = MockUbuntuProClient();
    when(client.detach()).thenThrow(UbuntuProFailedException());

    final model = UbuntuProModel(client);

    final statusChanges = <UbuntuProStatus>[];
    model.addListener(() {
      if (statusChanges.lastOrNull != model.status) {
        statusChanges.add(model.status);
      }
    });

    expect(model.hasError, isFalse);
    expect(model.error, isNull);

    await model.detach();

    verify(client.detach()).called(1);
    expect(statusChanges, [
      UbuntuProStatus.detaching,
      UbuntuProStatus.error,
    ]);
    expect(model.hasError, isTrue);
    expect(model.error, equals(UbuntuProError.failed));
  });
}
