import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/locale/locale_model.dart';

export 'src/locale/locale_l10n.dart';
export 'src/locale/locale_model.dart' hide log;
export 'src/locale/locale_page.dart';

final localeProvider =
    Provider((ref) => ref.watch(localeModelProvider).selectedLocale);
