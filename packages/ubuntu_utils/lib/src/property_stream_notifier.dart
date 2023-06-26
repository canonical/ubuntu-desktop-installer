import 'dart:async';

import 'package:flutter/foundation.dart';

/// Listens and notifies a stream of property changes.
mixin PropertyStreamNotifier on ChangeNotifier {
  bool _enabled = true;
  final _callbacks = <String, VoidCallback>{};
  StreamSubscription<List<String>>? _subscription;

  /// Sets a stream of [properties].
  void setProperties(Stream<List<String>> properties) {
    _subscription?.cancel();
    _subscription = properties.listen((changedProperties) {
      if (_enabled == false) return;
      for (final property in changedProperties) {
        _callbacks[property]?.call();
      }
    });
  }

  /// Listens [property] and calls [onChanged] when it changes.
  void addPropertyListener(String property, VoidCallback onChanged) {
    _callbacks[property] = onChanged;
  }

  /// Enables all listeners and starts calling the callbacks.
  void enablePropertyListeners() => _enabled = true;

  /// Disables all listeners and stops calling the callbacks.
  void disablePropertyListeners() => _enabled = false;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
