import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wsl_setup/app_model.dart';
import 'package:ubuntu_wsl_setup/routes.dart';

void main() {
  test('defaults', () {
    const model = AppModel();
    expect(model.variant, isNull);
    expect(model.routeFromOptions, isNull);
    expect(model.languageAlreadySet, isFalse);
    expect(model.showSplashScreen, isFalse);
    expect(model.initialRoute, Routes.selectLanguage);
  });

  test('copy with', () {
    const model1 = AppModel();
    final model2 = model1.copyWith(showSplashScreen: true);
    expect(model1.showSplashScreen, isFalse);
    expect(model2.showSplashScreen, isTrue);
  });
  test('inital route', () {
    var model = const AppModel();
    expect(model.initialRoute, Routes.selectLanguage);
    model = const AppModel(routeFromOptions: Routes.advancedSetup);
    expect(model.initialRoute, Routes.advancedSetup);
    model = const AppModel(languageAlreadySet: true);
    expect(model.initialRoute, Routes.profileSetup);
    model = const AppModel(variant: Variant.WSL_CONFIGURATION);
    expect(model.initialRoute, Routes.advancedReconfig);
    // this doesn't affect the Routes, but the optional screen shown before the wizard.
    model = const AppModel(showSplashScreen: true);
    expect(model.initialRoute, Routes.selectLanguage);
  });
}
