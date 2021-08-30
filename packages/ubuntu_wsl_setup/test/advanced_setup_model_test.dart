import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wsl_setup/pages/advanced_setup/advanced_setup_model.dart';

void main() {
  test('load advanced setup', () async {
    const conf = WSLConfiguration1Data(
      customPath: 'path',
      customMountOpt: 'opt',
      genHost: false,
      genResolvconf: false,
    );

    final client = MockSubiquityClient();
    when(client.wslConfiguration1()).thenAnswer((_) async => conf);

    final model = AdvancedSetupModel(client);
    await model.loadAdvancedSetup();
    verify(client.wslConfiguration1()).called(1);

    expect(model.mountLocation, equals(conf.customPath));
    expect(model.mountOption, equals(conf.customMountOpt));
    expect(model.enableHostGeneration, equals(conf.genHost));
    expect(model.enableResolvConfGeneration, equals(conf.genResolvconf));
  });

  test('save advanced setup', () async {
    final client = MockSubiquityClient();

    final model = AdvancedSetupModel(client);
    model.mountLocation = 'path';
    model.mountOption = 'opt';
    model.enableHostGeneration = false;
    model.enableResolvConfGeneration = false;

    final conf = WSLConfiguration1Data(
      customPath: 'path',
      customMountOpt: 'opt',
      genHost: false,
      genResolvconf: false,
    );

    await model.saveAdvancedSetup();
    verify(client.setWslConfiguration1(conf)).called(1);
  });

  test('notify changes', () {
    final model = AdvancedSetupModel(MockSubiquityClient());

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.mountLocation, isEmpty);
    model.mountLocation = 'path';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.mountOption, isEmpty);
    model.mountOption = 'opt';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.enableHostGeneration, isTrue);
    model.enableHostGeneration = false;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.enableResolvConfGeneration, isTrue);
    model.enableResolvConfGeneration = false;
    expect(wasNotified, isTrue);
  });

  test('validation', () {
    final model = AdvancedSetupModel(MockSubiquityClient());
    expect(model.isValid, isTrue);

    void testValid(
      String mountLocation,
      Matcher matcher,
    ) {
      model.mountLocation = mountLocation;
      expect(model.isValid, matcher);
    }

    testValid('', isTrue);
    testValid('/', isFalse);
    testValid('/absolute/dir/', isFalse);
    testValid('/absolute/file', isTrue);
    testValid('relative/dir/', isFalse);
    testValid('relative/file', isFalse);
  });
}
