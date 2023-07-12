import 'package:dartx/dartx.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_provision/services.dart';

class InstallerService {
  InstallerService(this._client, {ConfigService? config, List<String>? routes})
      : _config = config,
        _routes = routes?.map((r) => r.removePrefix('/')).toList();

  List<String>? _routes;
  final SubiquityClient _client;
  final ConfigService? _config;

  Future<void> init() async {
    await _client.setVariant(Variant.DESKTOP);
    final status =
        await monitorStatus().firstWhere((s) => s?.isLoading == false);
    if (status?.interactive == true) {
      // Use the default values for a number of endpoints
      // for which a UI page isn't implemented yet.
      await _client.markConfigured([
        'mirror',
        'proxy',
        'ssh',
        'snaplist',
        'ubuntu_pro',
      ]);
    }
  }

  Future<void> load() async {
    await monitorStatus().firstWhere((s) => s?.isLoading == false);
    _routes ??=
        await _client.getInteractiveSections() ?? await _config?.getRoutes();
  }

  Future<void> start() => _client.confirm('/dev/tty1');

  Stream<ApplicationStatus?> monitorStatus() => _client.monitorStatus();

  bool hasRoute(String route) {
    return _routes?.contains(route.removePrefix('/')) ?? true;
  }
}

extension ApplicationStatusX on ApplicationStatus {
  bool get isLoading => isStartingUp || isWaitingAutoinstall;
  bool get isStartingUp => state.index <= ApplicationState.EARLY_COMMANDS.index;
  bool get isWaitingAutoinstall =>
      interactive == false && state == ApplicationState.WAITING;
  bool get isInstalling =>
      state.index >= ApplicationState.RUNNING.index &&
      state.index < ApplicationState.DONE.index;
}

extension on ConfigService {
  Future<List<String>?> getRoutes() {
    return get<List>('routes').then((value) => value?.cast());
  }
}
