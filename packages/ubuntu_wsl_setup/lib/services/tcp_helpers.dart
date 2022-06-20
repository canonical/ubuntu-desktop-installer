import 'dart:async';
import 'dart:io';

// This is inherently a race condition on its own, because in between finding an
// available port and using it, the system may have binded other socket.
FutureOr<RawServerSocket?> _tryBindUnsafe({
  required int lower,
  required int higher,
}) async {
  final socket = await RawServerSocket.bind(InternetAddress.loopbackIPv4, 0);
  final port = socket.port;
  if (port > lower && port < higher) {
    return socket;
  }
  socket.close();
  return null;
}

/// Returns a RawServerSocket already binded to a port in the open interval
/// [lower]-[higher] of the loopback interface where the referred range is
/// a subset of the platform ephemeral port range.
/// On failure returns null. [maxAttempts] limits the amount of asynchronous
/// iterations performed.
Future<RawServerSocket?> getSocketHolder({
  required int lower,
  required int higher,
  int maxAttempts = 10,
}) async {
  assert(maxAttempts > 0, 'At least one attempt will be done anyway.');
  RawServerSocket? value;
  int attemptsCount = 0;
  await Future.doWhile(() async {
    attemptsCount++;
    value = await _tryBindUnsafe(lower: lower, higher: higher);
    return value == null && attemptsCount <= maxAttempts;
  });
  return value;
}
