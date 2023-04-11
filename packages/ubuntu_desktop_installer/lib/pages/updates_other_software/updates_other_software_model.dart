import 'dart:async';

import 'package:async/async.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

/// @internal
final log = Logger('updates_other_software');

enum InstallationMode { normal, minimal }

const _kConnectivityInterval = Duration(seconds: 1);

extension InstallationSource on InstallationMode {
  String get source {
    switch (this) {
      case InstallationMode.normal:
        return 'ubuntu-desktop';
      case InstallationMode.minimal:
        return 'ubuntu-desktop-minimal';
    }
  }
}

class UpdateOtherSoftwareModel extends PropertyStreamNotifier {
  // ignore: public_member_api_docs
  UpdateOtherSoftwareModel(
      {required SubiquityClient client,
      required PowerService power,
      required NetworkService network,
      required InstallationMode installationMode,
      bool installDrivers = false,
      bool installCodecs = false,
      bool isOnline = false})
      : _client = client,
        _power = power,
        _network = network,
        _mode = installationMode,
        _installDrivers = installDrivers,
        _installCodecs = installCodecs,
        _isOnline = isOnline {
    addPropertyListener('OnBattery', notifyListeners);
    addPropertyListener('Connectivity', _updateConnectivity);
  }

  final SubiquityClient _client;
  final PowerService _power;
  final NetworkService _network;

  bool _isOnline = false;
  Timer? _connectivityTimer;

  InstallationMode _mode;
  InstallationMode get installationMode => _mode;

  bool _installDrivers;
  bool get installDrivers => _installDrivers;

  bool _installCodecs;
  bool get installCodecs => _installCodecs;

  void setInstallationMode(InstallationMode? mode) {
    if (mode == null || _mode == mode) {
      return;
    }

    _mode = mode;
    log.info('Selected ${mode.name} installation mode');
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  void setInstallDrivers(bool? installDrivers) {
    if (installDrivers == null || _installDrivers == installDrivers) {
      return;
    }

    _installDrivers = installDrivers;
    log.info('Install drivers: $installDrivers');
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  void setInstallCodecs(bool? installCodecs) {
    if (installCodecs == null || _installCodecs == installCodecs) {
      return;
    }

    _installCodecs = installCodecs;
    log.info('Install codecs: $installCodecs');
    notifyListeners();
  }

  /// Select the source corresponding to the selected installation mode, and
  /// save the selected installation options.
  Future<void> save() {
    disablePropertyListeners();
    _connectivityTimer?.cancel();
    _connectivityTimer = null;
    return Future.wait([
      _client.setSource(installationMode.source),
      _client.setDrivers(install: installDrivers),
      _client.setCodecs(install: installCodecs && isOnline),
    ]);
  }

  /// Returns true if currently powered by battery.
  bool get onBattery => _power.onBattery;

  /// Returns true if there is a network connection.
  bool get isOnline => _isOnline;

  /// Initializes the model and connects to the power service.
  Future<void> init() {
    enablePropertyListeners();
    return Future.wait([
      _client.getDrivers().then((response) {
        _installDrivers = response.install;
      }),
      _client.getCodecs().then((data) {
        _installCodecs = data.install;
      }),
      _client.hasNetwork().then((hasNetwork) {
        _isOnline = hasNetwork;
      }),
      _power.connect(),
      _network.connect(),
    ]).then((_) {
      setProperties(StreamGroup.merge(
        [_power.propertiesChanged, _network.propertiesChanged],
      ));
      notifyListeners();
    });
  }

  Future<void> _updateConnectivity() async {
    _connectivityTimer?.cancel();
    _connectivityTimer = null;

    // force subiquity to refresh its network status
    await _client.markConfigured(['network']);
    final isOnline = await _client.hasNetwork();

    if (isOnline != _network.isConnected) {
      // subiquity and NM disagree on the network status. try refreshing...
      _connectivityTimer = Timer(_kConnectivityInterval, _updateConnectivity);
    }

    if (_isOnline != isOnline) {
      _isOnline = isOnline;
      notifyListeners();
    }
  }
}
