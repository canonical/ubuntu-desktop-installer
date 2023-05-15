import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/services.dart';

final loadingModelProvider = Provider(
  (_) => LoadingModel(getService<AppService>()),
);

class LoadingModel {
  LoadingModel(this._service);

  final AppService _service;

  Future<void> init() => _service.load();
}
