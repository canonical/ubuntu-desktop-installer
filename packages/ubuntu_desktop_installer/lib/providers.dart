import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_flavor/ubuntu_flavor.dart';

import 'pages/locale/locale_model.dart';

final flavorProvider =
    Provider((_) => UbuntuFlavor.detect() ?? UbuntuFlavor.ubuntu);

final localeProvider =
    Provider((ref) => ref.watch(localeModelProvider).selectedLocale);
