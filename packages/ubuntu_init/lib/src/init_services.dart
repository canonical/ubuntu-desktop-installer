import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_provision/services.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'services/realmd_active_directory_service.dart';
import 'services/xdg_identity_service.dart';
import 'services/xdg_keyboard_service.dart';
import 'services/xdg_locale_service.dart';
import 'services/xdg_session_service.dart';
import 'services/xdg_timezone_service.dart';

export 'services/realmd_active_directory_service.dart';
export 'services/xdg_identity_service.dart';
export 'services/xdg_keyboard_service.dart';
export 'services/xdg_locale_service.dart';
export 'services/xdg_session_service.dart';
export 'services/xdg_timezone_service.dart';

Future<void> registerInitServices() {
  tryRegisterService<ActiveDirectoryService>(RealmdActiveDirectoryService.new);
  tryRegisterService<IdentityService>(XdgIdentityService.new);
  tryRegisterService<KeyboardService>(XdgKeyboardService.new);
  tryRegisterService<LocaleService>(XdgLocaleService.new);
  tryRegisterService<NetworkService>(NetworkService.new);
  tryRegisterService<SessionService>(XdgSessionService.new);
  tryRegisterService<TimezoneService>(XdgTimezoneService.new);

  var geo = tryGetService<GeoService>();
  if (geo == null) {
    final geodata = Geodata.asset();
    final geoname = Geoname.ubuntu(geodata: geodata);
    geo = GeoService(sources: [geodata, geoname]);
    registerServiceInstance(geo);
  }
  return geo.init();
}
