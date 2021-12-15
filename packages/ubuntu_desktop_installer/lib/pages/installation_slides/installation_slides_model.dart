import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

export 'package:subiquity_client/subiquity_client.dart' show ApplicationState;

/// View model for [InstallationSlidesPage].
class InstallationSlidesModel extends ChangeNotifier with SystemShutdown {
  /// Creates an instance with the given client.
  InstallationSlidesModel(this.client, this._journal);

  @override
  final SubiquityClient client;
  final JournalService _journal;

  ApplicationStatus? _status;

  /// The current installation state.
  ApplicationState get state => _status?.state ?? ApplicationState.UNKNOWN;

  /// Whether the installation state is DONE.
  bool get isDone => state == ApplicationState.DONE;

  /// Whether the installation state is ERROR.
  bool get hasError => state == ApplicationState.ERROR;

  /// Whether the installation process is being prepared [STARTING_UP,RUNNING).
  bool get isPreparing =>
      state.index >= ApplicationState.STARTING_UP.index &&
      state.index < ApplicationState.RUNNING.index;

  /// Whether the installation process is active [RUNNING,DONE).
  bool get isInstalling =>
      state.index >= ApplicationState.RUNNING.index &&
      state.index < ApplicationState.DONE.index;

  /// The current installation step between [RUNNING,DONE], or -1 if the
  /// installation process is not active.
  int get installationStep =>
      isInstalling ? state.index - ApplicationState.RUNNING.index : -1;

  /// The total number of installation steps between [RUNNING,DONE].
  int get installationStepCount =>
      ApplicationState.DONE.index - ApplicationState.RUNNING.index;

  void _updateStatus(ApplicationStatus? status) {
    if (state == status?.state) return;
    _status = status;
    setWindowClosable(isDone || hasError);
    notifyListeners();
  }

  /// A stream of journal lines.
  Stream<String> get journal => _journal.stream;

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
  String _resolveSlideDirectory() {
    final appdir = p.dirname(Platform.resolvedExecutable);
    return p.join(appdir, 'data', 'flutter_assets', 'assets', 'slides');
  }

  File _resolveSlideFile(String name) {
    return File(p.join(_resolveSlideDirectory(), '$name.png'));
  }

  /// Returns the image for the given slide name.
  ImageProvider slideImage(String name) => FileImage(_resolveSlideFile(name));

  /// Prefetches slide images into the image cache to avoid white screen while
  /// loading slide images
  ///
  /// It's well noticeable that each slide is white when sliding in for the first time until it gets loaded. I think we can resolve the asset path relative to Platform.resolvedExecutable but I'm still testing to make sure it works in snaps and dev env.
  ///
  Future<void> precacheSlideImages(BuildContext context) {
    return Directory(_resolveSlideDirectory()).list().forEach((slide) {
      precacheImage(FileImage(File(slide.path)), context);
    });
  }

  Future<void> _monitorStatus() async {
    while (!isDone && !hasError) {
      await client.status(current: state).then(_updateStatus);
    }
  }

  /// Requests an immediate system reboot.
  Future<void> reboot({bool immediate = true}) {
    return super.reboot(immediate: immediate);
  }
}
