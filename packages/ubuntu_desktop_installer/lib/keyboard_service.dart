import 'package:subiquity_client/subiquity_client.dart';

/// A service that caches and exposes a localized list
/// of keyboard layouts and their variants returned by Subiquity.
class KeyboardService {
  /// A sorted list of keyboard layouts for the current locale.
  /// Each layout has a code, a localized name and a list of variants.
  List<KeyboardLayout> layouts = [];

  /// Reload the list of layouts for the current locale.
  /// Call this when the locale has changed
  /// (typically after calling SubiquityClient.setLocale(…)).
  Future<void> load(SubiquityClient client) {
    layouts.clear();
    return client.keyboard().then((keyboardSetup) {
      layouts = keyboardSetup.layouts!;
    });
  }
}
