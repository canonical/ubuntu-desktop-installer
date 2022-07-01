import 'dart:io';

import 'package:args/args.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import '../routes.dart';
import 'journal.dart';
import 'tcp_socket.dart';

/// Groups all the results of decisions that would otherwise be a clause
/// of type: `if(Plaform.isXyz) {` spread everywhere in the code base
/// so that WSL Setup wizard can run either on Linux (inside the WSL distro)
/// or on the Windows host.
abstract class PlatformCapabilities {
  factory PlatformCapabilities({ArgResults? options}) => Platform.isWindows
      ? WinCapabilities(options: options)
      : LinuxCapabilities(options: options);

  /// Whether this platform and setup requires displaying a slide show.
  bool get requireSlides;

  /// The appropriate default wizard route for this platform and setup.
  String get defaultRoute;

  /// A server factory which takes into account the platform requirements for
  /// endpoint and process startup.
  Future<SubiquityServer?> subiquityServer(ServerMode serverMode);

  /// Registers the specific services required to support the wizard running on
  /// this target platform.
  void registerPlatformServices();

  /// A map of language names and display names for which the platform may lack
  /// support (possibly due fonts, language packs and other locale sensitive
  /// requirements)
  Map<String, String> get languagesLackingSupport;
}

class WinCapabilities implements PlatformCapabilities {
  // No options mean WSL setup. Splash is considered only for configuration at
  // this point.
  WinCapabilities({ArgResults? options}) {
    _distroName = options?['distro-name'];
    _requireSlides = options?['reconfigure'] == null;
  }
  @override
  String get defaultRoute => Routes.installationSlides;

  @override

  /// No language support restrictions are known on this platform so far.
  Map<String, String> get languagesLackingSupport => {};

  @override
  void registerPlatformServices() {
    registerService(() => JournalService(source: decode(stdin)));
    registerServiceInstance<PlatformCapabilities>(this);
  }

  @override
  bool get requireSlides => _requireSlides;

  @override
  Future<SubiquityServer?> subiquityServer(ServerMode serverMode) async {
    final service = TcpSocketService();
    _socketHolder = await service.getRandomPortSocket(maxAttempts: 5);
    if (_socketHolder == null) return null;

    final endpoint = Endpoint.localhost(_socketHolder!.port);
    final process = SubiquityProcess.wsl(
      _distroName ?? defaultDistroName,
      'sudo',
      user: 'root',
      wslenv: 'DRYRUN_RECONFIG',
      serverMode: serverMode,
      args: ['/usr/libexec/wsl-setup', '--tcp-port=${_socketHolder!.port}'],
      // TODO: Replace by a real future completed when distro is registered.
      defer: Future.delayed(const Duration(seconds: 80)),
      onProcessStart: _socketHolder!.close,
    );
    return SubiquityServer(endpoint: endpoint, process: process);
  }

  late final bool _requireSlides;
  ServerSocket? _socketHolder;
  String? _distroName;
  static const defaultDistroName = 'Ubuntu-22.04';
}

class LinuxCapabilities implements PlatformCapabilities {
  LinuxCapabilities({ArgResults? options});
  @override
  String get defaultRoute => Routes.selectLanguage;

  @override
// Languages Ubuntu WSL rootfs lack fonts for.
  Map<String, String> get languagesLackingSupport => {
        'am': 'Amharic',
        'ar': 'Arabic',
        'bn': 'Bangla',
        'bo': 'Tibetan',
        'dz': 'Dzongkha',
        'fa': 'Persian',
        'gu': 'Gujarati',
        'he': 'Hebrew',
        'hi': 'Hindi',
        'ja': 'Japanese',
        'ka': 'Georgian',
        'km': 'Khmer',
        'kn': 'Kannada',
        'ko': 'Korean',
        'lo': 'Lao',
        'ml': 'Malayalam',
        'mr': 'Marathi',
        'my': 'Burmese',
        'ne': 'Nepali',
        'pa': 'Punjabi',
        'si': 'Sinhala',
        'ta': 'Tamil',
        'te': 'Telugu',
        'th': 'Thai',
        'ug': 'Uyghur',
        'vi': 'Vietnamese',
        'zh': 'Chinese',
      };

  @override
  bool get requireSlides => false;

  @override
  void registerPlatformServices() {
    registerServiceInstance<PlatformCapabilities>(this);
  }

  @override
  Future<SubiquityServer?> subiquityServer(ServerMode serverMode) async {
    subiquityPath = await getSubiquityPath()
        .then((dir) => Directory(dir).existsSync() ? dir : null);
    final endpoint = await defaultEndpoint(serverMode);
    final process = SubiquityProcess.python(
      pythonModule,
      serverMode: serverMode,
      subiquityPath: subiquityPath,
    );
    return SubiquityServer(endpoint: endpoint, process: process);
  }

  String? subiquityPath;
  static const pythonModule = 'system_setup.cmd.server';
}
