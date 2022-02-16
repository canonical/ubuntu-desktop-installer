import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('window');

const _methodChannel = MethodChannel('ubuntu_wizard');
const _eventChannel = EventChannel('ubuntu_wizard/events');

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

/// Sets whether the window can be closed.
// ignore: avoid_positional_boolean_parameters
Future<void> setWindowClosable(bool closable) {
  return _methodChannel.invokeMethod('setWindowClosable', [closable]);
}

/// Returns the default window size.
Future<Size> getDefaultWindowSize() {
  return _methodChannel.invokeMapMethod('getDefaultWindowSize').then((size) {
    final width = size?['width'] ?? 0.0;
    final height = size?['height'] ?? 0.0;
    return Size(width.toDouble(), height.toDouble());
  });
}

/// Requests that the window is resized.
Future<void> resizeWindow(Size size) {
  final args = {'width': size.width.round(), 'height': size.height.round()};
  return _methodChannel.invokeMethod('resizeWindow', args);
}
