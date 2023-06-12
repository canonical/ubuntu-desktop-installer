import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services.dart';

final installerModelProvider = ChangeNotifierProvider(
  (_) => InstallerModel(getService<InstallerService>()),
);

class InstallerModel extends SafeChangeNotifier {
  InstallerModel(this._service);

  final InstallerService _service;

  ApplicationStatus? _status;
  StreamSubscription<ApplicationStatus?>? _statusChange;

  ApplicationStatus? get status => _status;
  bool get isInstalling => status?.isInstalling == true;

  Future<void> init() async {
    _statusChange = _service.monitorStatus().listen((status) {
      _status = status;
      notifyListeners();
    });
  }

  bool hasRoute(String route) => _service.hasRoute(route);

  @override
  Future<void> dispose() async {
    await _statusChange?.cancel();
    _statusChange = null;
    super.dispose();
  }
}
