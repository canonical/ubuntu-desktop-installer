import 'package:async/async.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

/// @internal
final log = Logger('updates_other_software');

class UpdateOtherSoftwareModel extends PropertyStreamNotifier {
  // ignore: public_member_api_docs
  UpdateOtherSoftwareModel(
      {required SubiquityClient client,
      required PowerService power,
      required NetworkService network,
      bool installDrivers = false,
      bool installCodecs = false})
      : _client = client,
        _power = power,
        _network = network,
        _installDrivers = installDrivers,
        _installCodecs = installCodecs {
    addPropertyListener('OnBattery', notifyListeners);
    addPropertyListener('Connectivity', notifyListeners);
  }

  final SubiquityClient _client;
  final PowerService _power;
  final NetworkService _network;

  String? _sourceId;
  String? get sourceId => _sourceId;

  List<SourceSelection>? _sources;
  List<SourceSelection> get sources => _sources ?? [];

  SourceSelectionAndSetting? _sourceSelectionAndSetting;
  SourceSelectionAndSetting? get sourceSelectionAndSetting =>
      _sourceSelectionAndSetting;

  bool _installDrivers;
  bool get installDrivers => _installDrivers;

  bool _installCodecs;
  bool get installCodecs => _installCodecs;

  void setSourceId(String? sourceId) {
    if (sourceId == null || _sourceId == sourceId) {
      return;
    }

    _sourceId = sourceId;
    log.info('Selected $sourceId installation source');
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
    return Future.wait([
      _client.setSource(_sourceId!),
      _client.setDrivers(install: installDrivers),
      _client.setCodecs(install: installCodecs && isOnline),
    ]);
  }

  /// Returns true if currently powered by battery.
  bool get onBattery => _power.onBattery;

  /// Returns true if there is a network connection.
  bool get isOnline => _network.isConnected;

  /// Initializes the model and connects to the power service.
  Future<void> init() {
    return Future.wait([
      _client.source().then((value) {
        const order = ['ubuntu-desktop-minimal', 'ubuntu-desktop'];
        _sources = List.of(value.sources)
          ..sort((a, b) => order.indexOf(b.id).compareTo(order.indexOf(a.id)));
        _sourceId = value.currentId;
      }),
      _client.getDrivers().then((response) {
        _installDrivers = response.install;
      }),
      _client.getCodecs().then((data) {
        _installCodecs = data.install;
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
}
