import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/locale/locale_model.dart';

final localeProvider =
    Provider((ref) => ref.watch(localeModelProvider).selectedLocale);
