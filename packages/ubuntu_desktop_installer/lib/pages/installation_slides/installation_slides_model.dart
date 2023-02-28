import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../services.dart';

export 'package:subiquity_client/subiquity_client.dart' show ApplicationState;

enum InstallationAction {
  none,
  installingSystem,
  configuringSystem,
  copyingFiles;
}

class InstallationEvent {
  const InstallationEvent(this.action, {this.description});

  final InstallationAction action;
  final String? description;

  InstallationEvent copyWith(
      {InstallationAction? action, String? description}) {
    return InstallationEvent(
      action ?? this.action,
      description: description ?? this.description,
    );
  }

  factory InstallationEvent.fromString(String action, {String? description}) {
    late final InstallationAction installationAction;
    switch (action) {
      case 'installing system':
        installationAction = InstallationAction.installingSystem;
        break;
      case 'final system configuration':
        installationAction = InstallationAction.configuringSystem;
        break;
      default:
        installationAction = InstallationAction.copyingFiles;
    }
    return InstallationEvent(installationAction, description: description);
  }
}

/// View model for [InstallationSlidesPage].
class InstallationSlidesModel extends SafeChangeNotifier {
  /// Creates an instance with the given client.
  InstallationSlidesModel(this._client, this._journal);

  final SubiquityClient _client;
  final JournalService _journal;

  Stream<String>? _log;
  ApplicationStatus? _status;
  InstallationEvent _event = const InstallationEvent(InstallationAction.none);

  /// The current installation state.
  ApplicationState? get state => _status?.state;

  /// The current installation event.
  InstallationEvent get event => _event;

  /// Whether the installation state is DONE.
  bool get isDone => state == ApplicationState.DONE;

  /// Whether the installation state is ERROR.
  bool get hasError => state == ApplicationState.ERROR;

  /// Whether the installation process is active [RUNNING,DONE).
  bool get isInstalling =>
      state != null &&
      state!.index >= ApplicationState.RUNNING.index &&
      state!.index < ApplicationState.DONE.index;

  void _updateStatus(ApplicationStatus? status) {
    if (state == status?.state) return;
    _status = status;
    notifyListeners();
  }

  // Process syslog events of unindented "actions" and indented "descriptions".
  // ```
  // installing system
  //   configuring apt
  //   installing kernel
  //   ...
  // final system configuration
  //   configuring cloud-init
  //   ...
  //   downloading and installing security updates
  // ```
  // In autoinstall mode syslog events start with "subiquity" and unindented
  // entries contain no useful information.
  // ```
  // subiquity/Drivers/_list_drivers
  //   subiquity/Install/install/unmount_target: umounting /target dir
  //   subiquity/Install/install/curtin_install: installing system
  //     subiquity/Install/install/curtin_install/run: executing curtin install initial step
  //     subiquity/Install/install/curtin_install/run: executing curtin install partitioning step
  // ```
  void _processEvent(String syslog) {
    syslog = syslog.replaceFirst(RegExp(r'  subiquity/[\w/]+: '), '');
    final trimmed = syslog.trimLeft();
    if (trimmed.startsWith('subiquity')) return;
    if (trimmed == syslog) {
      _event = InstallationEvent.fromString(syslog);
    } else {
      _event = _event.copyWith(description: trimmed);
    }
    notifyListeners();
  }

  /// A stream of journal log lines.
  Stream<String> get log => _log ?? const Stream.empty();

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
    return _client.status().then((status) {
      _log = _journal.start(status.logSyslogId);
      _updateStatus(status);
      _monitorStatus(status.eventSyslogId);
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

  Future<void> _monitorStatus(String syslogId) async {
    final events = _journal.start(syslogId, output: JournalOutput.cat);
    final subscription = events.listen(_processEvent);
    while (!isDone && !hasError) {
      await _client.status(current: state).then(_updateStatus);
    }
    subscription.cancel();
  }
}
