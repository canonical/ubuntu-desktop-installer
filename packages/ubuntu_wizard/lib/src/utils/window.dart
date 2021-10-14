import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

/// @internal
final log = Logger('window');

final _methodChannel = MethodChannel('ubuntu_wizard');
final _eventChannel = EventChannel('ubuntu_wizard/events');

void _listenEvent(String event, VoidCallback callback) {
  _eventChannel.receiveBroadcastStream().listen((ev) {
    if (event == ev) callback();
  });
}

/// Requests that the window is closed.
Future<void> closeWindow() {
  log.info('request window close');
  return _methodChannel.invokeMethod('closeWindow');
}

/// Completes when the window is closed.
Future<void> onWindowClosed() {
  final completer = Completer();
  _listenEvent('deleteEvent', () {
    log.info('window closed');
    completer.complete();
  });
  return completer.future;
}

/// Sets the window title.
Future<void> setWindowTitle(String title) {
  return _methodChannel.invokeMethod('setWindowTitle', [title]);
}
