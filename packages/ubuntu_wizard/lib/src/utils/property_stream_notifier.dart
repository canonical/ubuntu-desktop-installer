import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

/// Listens and notifies a stream of property changes.
class PropertyStreamNotifier extends SafeChangeNotifier {
  final _callbacks = <String, VoidCallback>{};
  StreamSubscription<List<String>>? _subscription;

  /// Sets a stream of [properties].
  void setProperties(Stream<List<String>> properties) {
    _subscription?.cancel();
    _subscription = properties.listen((changedProperties) {
      for (final property in changedProperties) {
        _callbacks[property]?.call();
      }
    });
  }

  /// Listens [property] and calls [onChanged] when it changes.
  void addPropertyListener(String property, VoidCallback onChanged) {
    _callbacks[property] = onChanged;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
