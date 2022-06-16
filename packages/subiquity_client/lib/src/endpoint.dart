import 'dart:io';

/// Vocabulary type that combines an [InternetAddress] and a [port] number
class Endpoint {
  final InternetAddress address;
  final int port;

  /// Creates an Unix domain socket endpoint.
  factory Endpoint.unix(String socketPath) => Endpoint(
        InternetAddress(socketPath, type: InternetAddressType.unix),
        port: 0,
      );

  /// Creates a localhost TCP endpoint on port number [port].
  factory Endpoint.localhost(int port) => Endpoint(
        InternetAddress('127.0.0.1', type: InternetAddressType.IPv4),
        port: port,
      );

  Endpoint(this.address, {required this.port});

  @override
  String toString() =>
      'Endpoint(${address.address} ${port != 0 ? ', port: $port' : ''})';

  String get authority => address.type == InternetAddressType.unix
      ? 'localhost'
      : '${address.host}${port != 0 ? ':$port' : ''}';
}
