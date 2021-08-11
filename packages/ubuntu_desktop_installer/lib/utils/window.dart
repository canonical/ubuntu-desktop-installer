import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';

final _eventChannel = EventChannel('ubuntu-desktop-installer');

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
