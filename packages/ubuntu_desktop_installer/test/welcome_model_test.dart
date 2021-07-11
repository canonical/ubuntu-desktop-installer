import 'dart:ui';

import 'package:diacritic/diacritic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/keyboard_model.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_model.dart';

import 'welcome_model_test.mocks.dart';

@GenerateMocks([KeyboardModel, SubiquityClient])
void main() {
  test('load keyboard model', () async {
    final client = MockSubiquityClient();
    final keyboard = MockKeyboardModel();
    when(keyboard.load(client)).thenAnswer((_) async => null);

    final model = WelcomeModel(client: client, keyboardModel: keyboard);
    await model.loadKeyboardModel();
    verify(keyboard.load(client)).called(1);
  });

  test('load languages', () async {
    final client = MockSubiquityClient();
    final keyboard = MockKeyboardModel();

    final model = WelcomeModel(client: client, keyboardModel: keyboard);
    await model.loadLanguages();
    expect(model.languageCount, greaterThan(1));
  });

  test('sort languages', () async {
    final client = MockSubiquityClient();
    final keyboard = MockKeyboardModel();

    final model = WelcomeModel(client: client, keyboardModel: keyboard);
    await model.loadLanguages();

    final languages = List.generate(model.languageCount, model.language);
    expect(languages.length, greaterThan(1));

    final sortedLanguages = List.of(languages)
      ..sort((a, b) => removeDiacritics(a).compareTo(removeDiacritics(b)));
    expect(languages, equals(sortedLanguages));
  });

  test('select locale', () async {
    final client = MockSubiquityClient();
    final keyboard = MockKeyboardModel();

    final model = WelcomeModel(client: client, keyboardModel: keyboard);
    await model.loadLanguages();
    expect(model.languageCount, greaterThan(1));
    expect(model.selectedLanguageIndex, equals(0));

    model.selectLocale('foo');
    expect(model.selectedLanguageIndex, equals(0));

    final firstLocale = model.locale(0);
    final lastLocale = model.locale(model.languageCount - 1);
    expect(firstLocale, isNot(equals(lastLocale)));

    model.selectLocale('$lastLocale.UTF-8');
    expect(model.selectedLanguageIndex, equals(model.languageCount - 1));
  });

  test('set locale', () {
    final client = MockSubiquityClient();
    when(client.setLocale('fr')).thenAnswer((_) async => null);

    final model = WelcomeModel(
      client: client,
      keyboardModel: MockKeyboardModel(),
    );
    model.applyLocale(Locale('fr', 'CA'));
    verify(client.setLocale('fr')).called(1);
  });

  test('selected language', () {
    final model = WelcomeModel(
      client: MockSubiquityClient(),
      keyboardModel: MockKeyboardModel(),
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
