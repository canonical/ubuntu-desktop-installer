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

class TcpSocketService {
  /// Ephemeral port ranges (* chart is not on scale)
  ///
  /// ```
  /// <Linux 2.4+>           <Windows 8+>           </Linux 2.4+> </Windows 8+>
  ///       |----------------------|--------------------|-------------|
  ///     32768                  49152                60999         65535
  ///                        [kMinPortNo]           [kMaxPortNo]
  /// ```
  static const kMinPortNo = 49152;
  static const kMaxPortNo = 60999;

  /// Returns a ServerSocket already binded to a randomly-selected port in the
  /// open interval [lower]-[higher] of the loopback interface where the range
  /// is a subset of the platform ephemeral port range, limited by [kMinPortNo]
  /// and [kMaxPortNo]. [maxAttempts] limits the amount of asynchronous
  /// iterations performed. On failure returns null.
  Future<ServerSocket?> getRandomPortSocket({
    int lower = kMinPortNo,
    int higher = kMaxPortNo,
    int maxAttempts = 10,
  }) async {
    assert(maxAttempts > 0, 'At least one attempt will be done anyway.');
    assert(higher > lower, '$higher must be greater than $lower.');
    assert(lower > 0, 'Port numbers must be positive.');
    assert(
      lower >= kMinPortNo && higher <= kMaxPortNo,
      'Ports must be in between $kMinPortNo and $kMaxPortNo',
    );
    ServerSocket? value;
    int attemptsCount = 0;
    await Future.doWhile(() async {
      attemptsCount++;
      value = await _tryBindUnsafe(lower: lower, higher: higher);
      return value == null && attemptsCount <= maxAttempts;
    });
    return value;
  }
}
