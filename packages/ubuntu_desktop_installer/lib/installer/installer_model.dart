import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services.dart';

final installerModelProvider = ChangeNotifierProvider(
  (_) => InstallerModel(getService<SubiquityClient>()),
);

class InstallerModel extends SafeChangeNotifier {
  InstallerModel(this._client);

  final SubiquityClient _client;

  ApplicationStatus? _status;
  StreamSubscription<ApplicationStatus?>? _statusChange;

  ApplicationStatus? get status => _status;
  bool get isInstalling => status?.isInstalling == true;

  Future<void> init() async {
    _statusChange = _client.monitorStatus().listen((status) {
      _status = status;
      notifyListeners();
    });
  }

  @override
  Future<void> dispose() async {
    await _statusChange?.cancel();
    _statusChange = null;
    super.dispose();
  }
}
