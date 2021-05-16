/// {@template udev}
/// Provides APIs to introspect and enumerate devices on the local system.
///
/// ```dart
/// void main() async {
///   final client = NetworkManagerClient();
///   await client.connect();
///
///   final udev = Udev();
///
///   print('Wired devices:');
///   for (final wired in client.devices.where((d) => d.wired != null)) {
///     final device = udev.device(syspath: wired.udi);
///     print('\t${device?.vendor} ${device?.model}');
///   }
///
///   print('Wireless devices:');
///   for (final wireless in client.devices.where((d) => d.wireless != null)) {
///     final device = udev.device(syspath: wireless.udi);
///     print('\t${device?.vendor} ${device?.model}');
///   }
///
///   udev.dispose();
///
///   await client.close();
/// }
/// ```
/// {@endtemplate}
library udev;

export 'src/udev.dart';
