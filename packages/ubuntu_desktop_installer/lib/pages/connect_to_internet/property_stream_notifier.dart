import 'dart:async';

import 'package:flutter/foundation.dart';

/// Listens and notifies a stream of property changes.
class PropertyStreamNotifier extends ChangeNotifier {
  final _callbacks = <String, VoidCallback>{};
  final _subscriptions = <StreamSubscription<List<String>>>[];

  /// Adds a stream of [properties].
  void addProperties(Stream<List<String>> properties) {
    _subscriptions.add(properties.listen((changedProperties) {
      for (final property in changedProperties) {
        _callbacks[property]?.call();
      }
    }));
  }

  /// Listens [property] and calls [onChanged] when it changes.
  void addPropertyListener(String property, VoidCallback onChanged) {
    _callbacks[property] = onChanged;
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
  }
}
