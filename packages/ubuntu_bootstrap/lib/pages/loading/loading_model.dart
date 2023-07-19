import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_bootstrap/services.dart';

final loadingModelProvider = Provider.autoDispose(
  (_) => LoadingModel(getService<InstallerService>()),
);

class LoadingModel {
  LoadingModel(this._service);

  final InstallerService _service;

  Future<void> init() => _service.load();
}
