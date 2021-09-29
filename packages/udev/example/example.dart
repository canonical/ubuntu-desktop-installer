import 'package:nm/nm.dart';
import 'package:udev/udev.dart';

void main() async {
  final client = NetworkManagerClient();
  await client.connect();

  final udev = Udev();

  print('Wired devices:');
  for (final wired in client.devices.where((d) => d.wired != null)) {
    final device = UdevDevice.fromSyspath(udev, syspath: wired.udi);
    print('\t${device?.vendor} ${device?.model}');
  }

  print('Wireless devices:');
  for (final wireless in client.devices.where((d) => d.wireless != null)) {
    final device = UdevDevice.fromSyspath(udev, syspath: wireless.udi);
    print('\t${device?.vendor} ${device?.model}');
  }

  udev.dispose();

  await client.close();
}
