import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// The signature of the builder callback with access to localized strings.
typedef LocalizedViewBuilder = Widget Function(
    BuildContext context, AppLocalizations lang);

/// A view that provides access to localized strings.
///
/// Example:
/// ```dart
/// LocalizedView(
///   builder: (context, lang) => Text(lang.appName),
/// )
/// ```
class LocalizedView extends StatelessWidget {
  /// A builder callback that provides access to localized strings.
  final LocalizedViewBuilder builder;

  /// Creates a localized view instance with the given `builder` callback.
  LocalizedView({required this.builder});

  @override
  Widget build(BuildContext context) =>
      builder(context, AppLocalizations.of(context)!);
}
