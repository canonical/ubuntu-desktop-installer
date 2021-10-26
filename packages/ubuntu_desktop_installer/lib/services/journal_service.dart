import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Provides `journalctl` output.
class JournalService {
  /// Creates the service. Optionally, the output can be limited to a specific
  /// systemd unit.
  JournalService(this._unit);

  Process? _process;
  final _controller = StreamController<String>.broadcast();
  final String? _unit;

  /// The output stream of lines from the `journalctl` command.
  Stream<String> get stream => _controller.stream;

  /// Starts a `journalctl` process.
  Future<void> start() async {
    if (_process != null) return;
    _process = await Process.start(
      'journalctl',
      [
        '--follow',
        '--no-pager',
        if (_unit != null) ...['--no-tail', '--unit', _unit!],
      ],
      environment: {'SYSTEMD_COLORS': '0'},
    );
    _process!.stdout
        .transform<String>(utf8.decoder)
        .transform<String>(const LineSplitter())
        .listen(_controller.add);
    _process!.stderr
        .transform<String>(utf8.decoder)
        .transform<String>(const LineSplitter())
        .listen(_controller.add);
  }

  /// Kills the `journalctl` process.
  void stop() {
    _controller.close();
    _process?.kill();
    _process = null;
  }
}
