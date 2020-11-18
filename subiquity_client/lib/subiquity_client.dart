library subiquity_client;

import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:subiquity_client/src/http_unix_client.dart';
import 'package:subiquity_client/src/types.dart';
import 'package:tuple/tuple.dart';

class SubiquityClient {
  HttpUnixClient _client;

  void open(String socket_path) {
    _client = HttpUnixClient(socket_path);
  }

  void close() {
    _client.close();
  }

  Future<String> locale() async {
    var request = Request('GET', Uri.http('localhost', 'locale'));
    var response = await _client.send(request);
    var response_str = await response.stream.bytesToString();
    return response_str.replaceAll('"', '');
  }

  Future<KeyboardSetting> keyboard() async {
    var request = Request('GET', Uri.http('localhost', 'keyboard'));
    var response = await _client.send(request);

    var keyboard_json = jsonDecode(await response.stream.bytesToString());
    var keyboard = KeyboardSetting();
    keyboard.layout = keyboard_json['layout'];
    keyboard.variant = keyboard_json['variant'];
    keyboard.toggle = keyboard_json['toggle'];

    return keyboard;
  }

  Future<String> proxy() async {
    var request = Request('GET', Uri.http('localhost', 'proxy'));
    var response = await _client.send(request);
    var response_str = await response.stream.bytesToString();
    return response_str.replaceAll('"', '');
  }

  Future<String> mirror() async {
    var request = Request('GET', Uri.http('localhost', 'mirror'));
    var response = await _client.send(request);
    var response_str = await response.stream.bytesToString();
    return response_str.replaceAll('"', '');
  }

  Future<IdentityData> identity() async {
    var request = Request('GET', Uri.http('localhost', 'identity'));
    var response = await _client.send(request);

    var identity_json = jsonDecode(await response.stream.bytesToString());
    var identity = IdentityData();
    identity.realname = identity_json['realname'];
    identity.username = identity_json['username'];
    identity.crypted_password = identity_json['crypted_password'];
    identity.hostname = identity_json['hostname'];

    return identity;
  }

  Future<SSHData> ssh() async {
    var request = Request('GET', Uri.http('localhost', 'ssh'));
    var response = await _client.send(request);

    var ssh_json = jsonDecode(await response.stream.bytesToString());
    var ssh = SSHData();
    ssh.install_server = ssh_json['install_server'];
    ssh.allow_pw = ssh_json['allow_pw'];
    ssh.authorized_keys = ssh_json['authorized_keys'];

    return ssh;
  }

  /// Get the installer state.
  Future<ApplicationStatus> status() async {
    var request = Request('GET', Uri.http('localhost', 'meta/status'));
    var response = await _client.send(request);

    var status_json = jsonDecode(await response.stream.bytesToString());
    var status = ApplicationStatus();

    switch (status_json['state']) {
      case 'STARTING':
        {
          status.state = ApplicationState.STARTING;
        }
        break;
      case 'EARLY_COMMANDS':
        {
          status.state = ApplicationState.EARLY_COMMANDS;
        }
        break;
      case 'INTERACTIVE':
        {
          status.state = ApplicationState.INTERACTIVE;
        }
        break;
      case 'NON_INTERACTIVE':
        {
          status.state = ApplicationState.NON_INTERACTIVE;
        }
        break;
      default:
        {
          status.state = ApplicationState.UNKNOWN;
        }
        break;
    }

    status.early_commands_syslog_id = status_json['early_commands_syslog_id'];
    status.log_syslog_id = status_json['log_syslog_id'];
    status.event_syslog_id = status_json['event_syslog_id'];

    return status;
  }

  /// Mark the controllers for endpoint_names as configured.
  Future<String> mark_configured(List<String> endpoint_names) async {
    var request = Request(
        'POST',
        Uri.http('localhost', 'meta/mark_configured',
            {'endpoint_names': endpoint_names.toString()}));
    var response = await _client.send(request);
    return response.stream.bytesToString();
  }

  /// Confirm that the installation should proceed.
  Future<String> confirm(String tty) async {
    var request =
        Request('POST', Uri.http('localhost', 'meta/confirm', {'tty': tty}));
    var response = await _client.send(request);
    return response.stream.bytesToString();
  }

  // TODO: parse languagelist instead of a hardcoded list
  final languagelist = [
    Tuple2<Locale, String>(const Locale('en', 'US'), 'English'),
    Tuple2<Locale, String>(const Locale('en', 'GB'), 'English (UK)'),
    Tuple2<Locale, String>(const Locale('kab'), 'Tamaziɣt Taqbaylit'),
    Tuple2<Locale, String>(const Locale('ca'), 'Català'),
    Tuple2<Locale, String>(
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        '中文(简体)'),
    Tuple2<Locale, String>(const Locale('hr'), 'Hrvatski'),
    Tuple2<Locale, String>(const Locale('cs'), 'Čeština'),
    Tuple2<Locale, String>(const Locale('ast'), 'Asturianu'),
    Tuple2<Locale, String>(const Locale('be'), 'Беларуская'),
    Tuple2<Locale, String>(const Locale('nl'), 'Nederlands'),
    Tuple2<Locale, String>(const Locale('fi'), 'Suomi'),
    Tuple2<Locale, String>(const Locale('fr'), 'Français'),
    Tuple2<Locale, String>(const Locale('de'), 'Deutsch'),
    Tuple2<Locale, String>(const Locale('el'), 'Ελληνικά'),
    Tuple2<Locale, String>(const Locale('he'), 'עברית'),
    Tuple2<Locale, String>(const Locale('hu'), 'Magyar'),
    Tuple2<Locale, String>(const Locale('id'), 'Bahasa Indonesia'),
    Tuple2<Locale, String>(const Locale('lv'), 'Latviski'),
    Tuple2<Locale, String>(const Locale('lt'), 'Lietuviškai'),
    Tuple2<Locale, String>(const Locale('pl'), 'Polski'),
    Tuple2<Locale, String>(const Locale('ru'), 'Русский'),
    Tuple2<Locale, String>(const Locale('sr'), 'Српски'),
    Tuple2<Locale, String>(const Locale('es'), 'Español'),
    Tuple2<Locale, String>(const Locale('sv'), 'Svenska'),
    Tuple2<Locale, String>(const Locale('bo'), 'བོད་ཡིག'),
    Tuple2<Locale, String>(const Locale('uk'), 'Українська'),
    Tuple2<Locale, String>(const Locale('nb'), 'Norsk bokmål'),
    Tuple2<Locale, String>(const Locale('oc'), 'Galés'),
  ];

  // TODO: un-hardcode
  final releaseNotesURL = 'https://wiki.ubuntu.com/GroovyGorilla/ReleaseNotes';
}
