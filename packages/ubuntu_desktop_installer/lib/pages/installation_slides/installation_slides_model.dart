import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

export 'package:subiquity_client/subiquity_client.dart' show ApplicationState;

/// View model for [InstallationSlidesPage].
class InstallationSlidesModel extends SafeChangeNotifier with SystemShutdown {
  /// Creates an instance with the given client.
  InstallationSlidesModel(this.client, this._journal);

  @override
  final SubiquityClient client;
  final JournalService _journal;

  ApplicationStatus? _status;

  /// The current installation state.
  ApplicationState? get state => _status?.state;

  /// Whether the installation state is DONE.
  bool get isDone => state == ApplicationState.DONE;

  /// Whether the installation state is ERROR.
  bool get hasError => state == ApplicationState.ERROR;

  /// Whether the installation process is being prepared [STARTING_UP,RUNNING).
  bool get isPreparing =>
      state != null &&
      state!.index >= ApplicationState.STARTING_UP.index &&
      state!.index < ApplicationState.RUNNING.index;

  /// Whether the installation process is active [RUNNING,DONE).
  bool get isInstalling =>
      state != null &&
      state!.index >= ApplicationState.RUNNING.index &&
      state!.index < ApplicationState.DONE.index;

  /// The current installation step between [RUNNING,DONE], or -1 if the
  /// installation process is not active.
  int get installationStep =>
      isInstalling ? state!.index - ApplicationState.RUNNING.index : -1;

  /// The total number of installation steps between [RUNNING,DONE].
  int get installationStepCount =>
      ApplicationState.DONE.index - ApplicationState.RUNNING.index;

  void _updateStatus(ApplicationStatus? status) {
    if (state == status?.state) return;
    _status = status;
    notifyListeners();
  }

  /// A stream of journal lines.
  Stream<String> get journal => _journal.stream;

  var _logVisible = false;

  /// Whether the log is visible.
  bool get isLogVisible => _logVisible;

  /// Toggle the log visibility.
  void toggleLogVisibility() {
    _logVisible = !_logVisible;
    notifyListeners();
  }

  /// Initializes and starts monitoring the status of the installation.
  Future<void> init() {
    _journal.start();
    return client.status().then((status) {
      _updateStatus(status);
      _monitorStatus();
    });
  }

  // Resolves the path to the assets in the app bundle so that it works in the
  // snap and development environments.
  String _resolveAssetsDirectory() {
    final appdir = p.dirname(Platform.resolvedExecutable);
    return p.join(appdir, 'data', 'flutter_assets');
  }

  /// Prefetches slide images into the image cache to avoid flicker while
  /// loading slide images
  Future<void> precacheSlideImages(BuildContext context) {
    final assets = _resolveAssetsDirectory();
    return Directory('$assets/assets/installation_slides')
        .list(recursive: true)
        .forEach((slide) {
      if (slide is File) {
        final path = p.relative(slide.path, from: assets);
        precacheImage(AssetImage(path), context);
      }
    });
  }

  Future<void> _monitorStatus() async {
    while (!isDone && !hasError) {
      await client.status(current: state).then(_updateStatus);
    }
  }

  /// Requests an immediate system reboot.
  @override
  Future<void> reboot({bool immediate = true}) {
    return super.reboot(immediate: immediate);
  }
}
