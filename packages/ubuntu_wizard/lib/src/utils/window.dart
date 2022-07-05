import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:window_manager/window_manager.dart';

/// @internal
final log = Logger('window');

class _WindowCloseCompleter extends WindowListener {
  final Completer<void> _completer = Completer<void>();
  Future<void> get future => _completer.future;
  @override
  void onWindowClose() => _completer.complete();
}

/// Requests that the window is closed.
Future<void> closeWindow() {
  log.info('request window close');
  return windowManager.close();
}

/// Destroys the window after closing.
Future<void> destroyWindow() {
  log.info('window closed');
  return windowManager.destroy();
}

/// Completes when the window is closed.
Future<void> onWindowClosed() async {
  final completer = _WindowCloseCompleter();
  windowManager.setPreventClose(true);
  windowManager.addListener(completer);
  return completer.future.then((_) => windowManager.removeListener(completer));
}

/// Sets the window title.
Future<void> setWindowTitle(String title) {
  return windowManager.setTitle(title);
}

/// Sets whether the window can be closed.
// ignore: avoid_positional_boolean_parameters
Future<void> setWindowClosable(bool closable) {
  return windowManager.setClosable(closable);
}

/// Ensures initialization of the plugin(s) related to managing windows.
Future<void> ensureInitialized() {
  WidgetsFlutterBinding.ensureInitialized();
  return windowManager.ensureInitialized();
}
