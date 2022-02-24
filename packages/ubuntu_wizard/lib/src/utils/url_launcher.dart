import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services.dart';

final log = Logger('url_launcher');

Future<bool> launchUrl(String url) {
  return getService<UrlLauncher>().launchUrl(url);
}

class UrlLauncher {
  Future<bool> launchUrl(String url) async {
    if (!await canLaunch(url)) {
      log.error('Unable to launch $url');
      return false;
    }
    return launch(url);
  }
}
