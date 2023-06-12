import 'package:subiquity_client/subiquity_client.dart';

abstract class AppService {
  Future<void> init();
  Future<void> load();
}

class InstallerAppService extends AppService {
  InstallerAppService(this._client);

  final SubiquityClient _client;

  @override
  Future<void> init() async {
    await _client.setVariant(Variant.DESKTOP);
    final status =
        await _client.monitorStatus().firstWhere((s) => s?.isLoading == false);
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

  @override
  Future<void> load() {
    return _client.monitorStatus().firstWhere((s) => s?.isLoading == false);
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
