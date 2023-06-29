import 'dart:async';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/services.dart';

final themeModelProvider = Provider(
  (ref) => ThemeModel(getService<ThemeService>()),
);

class ThemeModel {
  ThemeModel(this._service);

  final ThemeService _service;

  Future<bool> init() async => true;

  Future<void> setBrightness(Brightness value) => _service.setBrightness(value);
  Future<void> setAccent(String value) => _service.setAccent(value);
}
