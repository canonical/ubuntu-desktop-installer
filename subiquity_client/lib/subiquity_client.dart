library subiquity_client;

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart' show rootBundle;
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
      case 'STARTING_UP':
        {
          status.state = ApplicationState.STARTING_UP;
        }
        break;
      case 'WAITING':
        {
          status.state = ApplicationState.WAITING;
        }
        break;
      case 'NEEDS_CONFIRMATION':
        {
          status.state = ApplicationState.NEEDS_CONFIRMATION;
        }
        break;
      case 'RUNNING':
        {
          status.state = ApplicationState.RUNNING;
        }
        break;
      case 'POST_WAIT':
        {
          status.state = ApplicationState.POST_WAIT;
        }
        break;
      case 'POST_RUNNING':
        {
          status.state = ApplicationState.POST_RUNNING;
        }
        break;
      case 'UU_RUNNING':
        {
          status.state = ApplicationState.UU_RUNNING;
        }
        break;
      case 'UU_CANCELLING':
        {
          status.state = ApplicationState.UU_CANCELLING;
        }
        break;
      case 'DONE':
        {
          status.state = ApplicationState.DONE;
        }
        break;
      case 'ERROR':
        {
          status.state = ApplicationState.ERROR;
        }
        break;
      default:
        {
          status.state = ApplicationState.UNKNOWN;
        }
        break;
    }

    status.confirming_tty = status_json['confirming_tty'];
    status.cloud_init_ok = status_json['cloud_init_ok'];
    status.interactive = status_json['interactive'];
    status.echo_syslog_id = status_json['echo_syslog_id'];
    status.log_syslog_id = status_json['log_syslog_id'];
    status.event_syslog_id = status_json['event_syslog_id'];

    ///! status.error =

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

  List<Tuple2<Locale, String>> languagelist = [];

  Future<void> fetchLanguageList(String assetName) async {
    languagelist.clear();
    return rootBundle.loadStructuredData(assetName, (String data) async {
      return data;
    }).then((String data) {
      LineSplitter.split(data).forEach((line) {
        final tokens = line.split(':');
        final codes = tokens[1].split('_');
        languagelist.add(Tuple2(
            codes.length == 1 ? Locale(codes[0]) : Locale(codes[0], codes[1]),
            tokens[2]));
      });
      languagelist.sort((a, b) => a.item2.compareTo(b.item2));
    });
  }

  // TODO: un-hardcode
  final releaseNotesURL = 'https://wiki.ubuntu.com/GroovyGorilla/ReleaseNotes';

  Set<String> keyboardlangs = {};
  var keyboardlayoutlist = [];
  Map<String, List<Tuple2<String, String>>> keyboardvariantlist = {};

  Future<void> fetchKeyboardLayouts(String assetName, Locale locale) async {
    final langtag = locale.toLanguageTag().replaceAll('-', '_');
    print('fetching keyboard layouts for ' + langtag);
    final firstpass = keyboardlangs.isEmpty;
    var matchinglang = 'C';
    keyboardlayoutlist.clear();
    keyboardvariantlist.clear();
    // Copied from subiquity's KeyboardList class
    return rootBundle.loadStructuredData(assetName, (String data) async {
      return LineSplitter.split(data);
    }).then((Iterable<String> lines) {
      if (firstpass) {
        lines.forEach((line) {
          keyboardlangs.add(line.split('*')[0]);
        });
      }
      if (keyboardlangs.contains(langtag)) {
        matchinglang = langtag;
      } else {
        final langonlytag = langtag.split('_')[0];
        if (keyboardlangs.contains(langonlytag)) {
          matchinglang = langonlytag;
        }
      }
      return lines;
    }).then((Iterable<String> lines) {
      lines.forEach((line) {
        final tokens = line.split('*');
        if (tokens[0] == matchinglang) {
          var element = tokens[1];
          var name = tokens[2];
          if (element == 'layout') {
            keyboardlayoutlist.add(Tuple2(name, tokens[3]));
          } else if (element == 'variant') {
            final value = Tuple2<String, String>(tokens[3], tokens[4]);
            if (keyboardvariantlist.containsKey(name)) {
              keyboardvariantlist[name].add(value);
            } else {
              keyboardvariantlist[name] = [value];
            }
          }
        }
      });
      keyboardlayoutlist.sort((a, b) => a.item2.compareTo(b.item2));
      keyboardvariantlist.forEach((key, value) {
        value.sort((a, b) => a.item2.compareTo(b.item2));
      });
    });
  }
}
