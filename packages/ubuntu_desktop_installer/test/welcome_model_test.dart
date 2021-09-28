import 'dart:ui';

import 'package:diacritic/diacritic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import 'welcome_model_test.mocks.dart';

@GenerateMocks([KeyboardService])
void main() {
  test('load keyboard model', () async {
    final client = MockSubiquityClient();
    final keyboard = MockKeyboardService();
    when(keyboard.load(client)).thenAnswer((_) async => null);
    when(keyboard.layouts).thenReturn([]);

    final model = WelcomeModel(client: client, keyboardService: keyboard);
    await model.loadKeyboards();
    verify(keyboard.load(client)).called(1);
  });

  test('load languages', () async {
    final client = MockSubiquityClient();
    final keyboard = MockKeyboardService();

    final model = WelcomeModel(client: client, keyboardService: keyboard);
    await model.loadLanguages();
    expect(model.languageCount, greaterThan(1));
  });

  test('sort languages', () async {
    final client = MockSubiquityClient();
    final keyboard = MockKeyboardService();

    final model = WelcomeModel(client: client, keyboardService: keyboard);
    await model.loadLanguages();

    final languages = List.generate(model.languageCount, model.language);
    expect(languages.length, greaterThan(1));

    final sortedLanguages = List.of(languages)
      ..sort((a, b) => removeDiacritics(a).compareTo(removeDiacritics(b)));
    expect(languages, equals(sortedLanguages));
  });

  test('select locale', () async {
    final client = MockSubiquityClient();
    final keyboard = MockKeyboardService();

    final model = WelcomeModel(client: client, keyboardService: keyboard);
    await model.loadLanguages();
    expect(model.languageCount, greaterThan(1));
    expect(model.selectedLanguageIndex, equals(0));

    model.selectLocale(Locale('foo'));
    expect(model.selectedLanguageIndex, equals(0));

    final firstLocale = model.locale(0);
    final lastLocale = model.locale(model.languageCount - 1);
    expect(firstLocale, isNot(equals(lastLocale)));

    model.selectLocale(Locale.fromSubtags(
        languageCode: lastLocale.languageCode,
        countryCode: lastLocale.countryCode,
        scriptCode: 'bar'));
    expect(model.selectedLanguageIndex, equals(model.languageCount - 1));
  });

  test('set locale', () {
    final client = MockSubiquityClient();
    when(client.setLocale('fr_CA.UTF-8')).thenAnswer((_) async => null);

    final model = WelcomeModel(
      client: client,
      keyboardService: MockKeyboardService(),
    );
    model.applyLocale(Locale('fr', 'CA'));
    verify(client.setLocale('fr_CA.UTF-8')).called(1);
  });

  test('selected language', () {
    final model = WelcomeModel(
      client: MockSubiquityClient(),
      keyboardService: MockKeyboardService(),
    );

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    expect(model.selectedLanguageIndex, isZero);
    model.selectedLanguageIndex = 0;
    expect(model.selectedLanguageIndex, isZero);
    expect(wasNotified, isFalse);

    model.selectedLanguageIndex = 1;
    expect(model.selectedLanguageIndex, equals(1));
    expect(wasNotified, isTrue);
  });
}
