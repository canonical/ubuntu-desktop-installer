import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';

final _methodChannel = MethodChannel('ubuntu-desktop-installer');
final _eventChannel = EventChannel('ubuntu-desktop-installer/events');

void _listenEvent(String event, VoidCallback callback) {
  _eventChannel.receiveBroadcastStream().listen((ev) {
    if (event == ev) callback();
  });
}

/// Completes when the window is closed.
Future<void> onWindowClosed() {
  final completer = Completer();
  _listenEvent('deleteEvent', completer.complete);
  return completer.future;
}

/// Sets the window title.
Future<void> setWindowTitle(String title) {
  return _methodChannel.invokeMethod('setWindowTitle', [title]);
}
