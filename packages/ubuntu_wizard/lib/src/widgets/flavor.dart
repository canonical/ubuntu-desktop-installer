import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// Defines the configuration of a flavor.
@immutable
class FlavorData {
  /// Creates a flavor data with the specified attributes.
  const FlavorData({
    required this.name,
    this.theme,
    this.darkTheme,
    this.localizationsDelegates,
    this.package = '',
  });

  /// The name of the flavor.
  final String name;

  /// The light theme of the application.
  final ThemeData? theme;

  /// The dark theme of the application.
  final ThemeData? darkTheme;

  /// A list of additional flavor-specific localization delegates.
  final List<LocalizationsDelegate>? localizationsDelegates;

  /// The package name of the application. This is used to determine the
  /// fallback package for assets. This is set by the application - specifying
  /// one in a flavor has no effect.
  final String package;

  /// Copies the flavor data with the specified attributes.
  FlavorData copyWith({
    String? name,
    ThemeData? theme,
    ThemeData? darkTheme,
    List<LocalizationsDelegate>? localizationsDelegates,
    String? package,
  }) {
    return FlavorData(
      name: name ?? this.name,
      theme: theme ?? this.theme,
      darkTheme: darkTheme ?? this.darkTheme,
      localizationsDelegates:
          localizationsDelegates ?? this.localizationsDelegates,
      package: package ?? this.package,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const ListEquality().equals;
    return other is FlavorData &&
        other.name == name &&
        other.theme == theme &&
        other.darkTheme == darkTheme &&
        listEquals(other.localizationsDelegates, localizationsDelegates) &&
        other.package == package;
  }

  @override
  int get hashCode =>
      Object.hash(name, theme, darkTheme, localizationsDelegates, package);

  @override
  String toString() =>
      'FlavorData(name: $name, theme: $theme, darkTheme: $darkTheme, appName: $package)';
}

/// Provides access to the flavor data in the current context.
class Flavor extends InheritedWidget {
  /// Creates an inherited flavor widget with the specified flavor data.
  Flavor({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// The flavor configuration.
  final FlavorData data;

  /// Returns the flavor data for the given context.
  static FlavorData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Flavor>()!.data;
  }

  @override
  bool updateShouldNotify(Flavor oldWidget) => data != oldWidget.data;
}

/// An [Image] widget that looks up assets in the flavor and falls back to the
/// vanilla application package.
class FlavorImage extends StatelessWidget {
  /// Creates an image widget for the specified asset.
  const FlavorImage.asset(this.assetName, {Key? key}) : super(key: key);

  /// The name of the asset to load.
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(assetName, package: Flavor.of(context).package);
      },
    );
  }
}
