import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_flavor/ubuntu_flavor.dart';

final flavorProvider =
    Provider((_) => UbuntuFlavor.detect() ?? UbuntuFlavor.ubuntu);
