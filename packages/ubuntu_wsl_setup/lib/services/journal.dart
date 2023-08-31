import 'dart:async';
import 'dart:convert';
import 'dart:io';

Stream<String> _debugStream(Duration duration) {
  const stdoutMessages = [
    'Installing, this may take a few minutes...',
    'Installation successful!',
    'Launching the OOBE',
    'flutter: INFO ubuntu_wsl_setup: Logging to /var/log/installer/ubuntu_wsl_setup.log',
  ];

  return Stream.periodic(
    duration,
    (index) => stdoutMessages[index % stdoutMessages.length],
  );
}

Stream<String> decode(Stream<List<int>> encoded) =>
    encoded.transform(systemEncoding.decoder).transform(const LineSplitter());

class JournalService {
  JournalService({Stream<String>? source}) {
    _controller.addStream(source ?? _debugStream(const Duration(seconds: 2)));
  }
  Stream<String> get stream => _controller.stream;
  final _controller = StreamController<String>.broadcast();

  Future<void> close() => _controller.close();
}
