import 'dart:async';

import 'package:dartx/dartx.dart';
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

  List<String>? _interactiveSections;
  ApplicationStatus? _status;
  StreamSubscription<ApplicationStatus?>? _statusChange;

  ApplicationStatus? get status => _status;
  bool get isInstalling => status?.isInstalling == true;

  Future<void> init() async {
    _interactiveSections = await _client.getInteractiveSections();
    _statusChange = _client.monitorStatus().listen((status) {
      _status = status;
      notifyListeners();
    });
  }

  bool hasRoute(String route) {
    return _interactiveSections?.contains(route.removePrefix('/')) != false;
  }

  @override
  Future<void> dispose() async {
    await _statusChange?.cancel();
    _statusChange = null;
    super.dispose();
  }
}
