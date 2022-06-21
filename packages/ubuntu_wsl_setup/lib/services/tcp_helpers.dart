import 'dart:async';
import 'dart:io';
import 'dart:math';

// This is inherently a race condition on its own, because in between finding an
// available port and using it, the system may have binded other socket.
// Thus, the solution is to hold the socket binded.
FutureOr<ServerSocket?> _tryBindUnsafe({
  required int lower,
  required int higher,
}) async {
  var rand = Random.secure();
  var port = lower + rand.nextInt(higher - lower);
  try {
    final socket = await ServerSocket.bind(InternetAddress.loopbackIPv4, port);
    return socket;
  } on SocketException {
    return null;
  }
}

/// Returns a ServerSocket already binded to a randomly-selected port in the
/// open interval [lower]-[higher] of the loopback interface where the referred
/// range is a subset of the platform ephemeral port range.
/// On failure returns null. [maxAttempts] limits the amount of asynchronous
/// iterations performed.
Future<ServerSocket?> getRandomPortSocket({
  required int lower,
  required int higher,
  int maxAttempts = 10,
}) async {
  assert(maxAttempts > 0, 'At least one attempt will be done anyway.');
  ServerSocket? value;
  int attemptsCount = 0;
  await Future.doWhile(() async {
    attemptsCount++;
    value = await _tryBindUnsafe(lower: lower, higher: higher);
    return value == null && attemptsCount <= maxAttempts;
  });
  return value;
}
