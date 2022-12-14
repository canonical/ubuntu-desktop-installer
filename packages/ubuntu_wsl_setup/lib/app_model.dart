import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wsl_setup/routes.dart';

class AppModel {
  final Variant? variant;
  final bool languageAlreadySet;
  final bool showSplashScreen;
  final String? routeFromOptions;

  AppModel copyWith({
    Variant? variant,
    bool? languageAlreadySet,
    bool? showSplashScreen,
    String? routeFromOptions,
  }) {
    return AppModel(
      variant: variant ?? this.variant,
      languageAlreadySet: languageAlreadySet ?? this.languageAlreadySet,
      showSplashScreen: showSplashScreen ?? this.showSplashScreen,
      routeFromOptions: routeFromOptions ?? this.routeFromOptions,
    );
  }

  const AppModel({
    this.variant,
    this.languageAlreadySet = false,
    this.showSplashScreen = false,
    this.routeFromOptions,
  });

  String get initialRoute {
    if (routeFromOptions != null) {
      return routeFromOptions!;
    }
    switch (variant) {
      case null:
      case Variant.WSL_SETUP:
        return languageAlreadySet ? Routes.profileSetup : Routes.selectLanguage;
      case Variant.WSL_CONFIGURATION:
        return Routes.advancedReconfig;
      default:
        throw UnsupportedError('Unsupported WSL variant: $variant');
    }
  }
}
