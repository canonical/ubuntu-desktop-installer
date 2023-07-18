import 'package:meta/meta.dart';
import 'package:ubuntu_provision/services.dart';
import 'package:ubuntu_session/ubuntu_session.dart';

class XdgSessionService implements SessionService {
  XdgSessionService([@visibleForTesting UbuntuSession? session])
      : _session = session ?? UbuntuSession();

  final UbuntuSession _session;
  @override
  Future<void> reboot({bool immediate = false}) {
    return _session.reboot();
  }

  @override
  Future<void> shutdown({bool immediate = false}) {
    return _session.shutdown();
  }
}
