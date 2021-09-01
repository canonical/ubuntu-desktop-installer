import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wsl_setup/pages/configuration_ui/configuration_ui_model.dart';

void main() {
  test('load UI configuration', () async {
    const conf = WSLConfiguration2Data(
      legacyGui: true,
      legacyAudio: true,
      advIpDetect: true,
      wslMotdNews: false,
      automount: false,
      mountfstab: false,
    );

    final client = MockSubiquityClient();
    when(client.wslConfiguration2()).thenAnswer((_) async => conf);

    final model = ConfigurationUIModel(client);
    await model.loadConfiguration();
    verify(client.wslConfiguration2()).called(1);

    expect(model.legacyGUI, equals(conf.legacyGui));
    expect(model.legacyAudio, equals(conf.legacyAudio));
    expect(model.advancedIPDetection, equals(conf.advIpDetect));
    expect(model.wslMotdNews, equals(conf.wslMotdNews));
  });

  test('save UI configuration', () async {
    final client = MockSubiquityClient();

    final model = ConfigurationUIModel(client);
    model.legacyGUI = true;
    model.legacyAudio = true;
    model.advancedIPDetection = true;
    model.wslMotdNews = false;
    model.automount = false;
    model.mountFstab = false;

    final conf = WSLConfiguration2Data(
      legacyGui: true,
      legacyAudio: true,
      advIpDetect: true,
      wslMotdNews: false,
      automount: false,
      mountfstab: false,
    );

    await model.saveConfiguration();
    verify(client.setWslConfiguration2(conf)).called(1);
  });

  test('notify changes', () {
    final model = ConfigurationUIModel(MockSubiquityClient());

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.legacyGUI, isFalse);
    model.legacyGUI = true;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.legacyAudio, isFalse);
    model.legacyAudio = true;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.advancedIPDetection, isFalse);
    model.advancedIPDetection = true;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.wslMotdNews, isTrue);
    model.wslMotdNews = false;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.automount, isTrue);
    model.automount = false;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.mountFstab, isTrue);
    model.mountFstab = false;
    expect(wasNotified, isTrue);
  });

  test('validation', () {
    final model = ConfigurationUIModel(MockSubiquityClient());
    expect(model.isValid, isTrue);
  });
}
