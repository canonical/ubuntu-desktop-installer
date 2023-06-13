import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/services.dart';

final loadingModelProvider = Provider(
  (_) => LoadingModel(getService<InstallerService>()),
);

class LoadingModel {
  LoadingModel(this._service);

  final InstallerService _service;

  Future<void> init() => _service.load();
}
