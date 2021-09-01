library subiquity_client;

import 'dart:convert';
import 'package:http/http.dart';
import 'src/http_unix_client.dart';
import 'src/types.dart';

export 'src/types.dart';

class SubiquityClient {
  late HttpUnixClient _client;

  void open(String socketPath) {
    _client = HttpUnixClient(socketPath);
  }

  Future<void> close() {
    return _client.flush().then((_) => _client.close());
  }

  Future<void> checkStatus(String method, StreamedResponse response) async {
    if (response.statusCode != 200) {
      final responseStr = await response.stream.bytesToString();
      throw ("$method returned error ${response.statusCode}\n$responseStr");
    }
  }

  Future<String> locale() async {
    final request = Request('GET', Uri.http('localhost', 'locale'));
    final response = await _client.send(request);
    await checkStatus("locale()", response);

    final responseStr = await response.stream.bytesToString();
    return responseStr.replaceAll('"', '');
  }

  Future<void> setLocale(String locale) async {
    final request = Request('POST', Uri.http('localhost', 'locale'));
    request.body = '"$locale"';
    final response = await _client.send(request);
    await checkStatus('setLocale("$locale")', response);
  }

  Future<KeyboardSetup> keyboard() async {
    final request = Request('GET', Uri.http('localhost', 'keyboard'));
    final response = await _client.send(request);
    await checkStatus("keyboard()", response);

    final keyboardJson = jsonDecode(await response.stream.bytesToString());
    return KeyboardSetup.fromJson(keyboardJson);
  }

  Future<void> setKeyboard(KeyboardSetting setting) async {
    final request = Request('POST', Uri.http('localhost', 'keyboard'));
    request.body = jsonEncode(setting.toJson());
    final response = await _client.send(request);
    await checkStatus("setKeyboard(${jsonEncode(setting.toJson())})", response);
  }

  Future<String> proxy() async {
    final request = Request('GET', Uri.http('localhost', 'proxy'));
    final response = await _client.send(request);
    await checkStatus("proxy()", response);

    final responseStr = await response.stream.bytesToString();
    return responseStr.replaceAll('"', '');
  }

  Future<void> setProxy(String proxy) async {
    final request = Request('POST', Uri.http('localhost', 'proxy'));
    request.body = '"$proxy"';
    final response = await _client.send(request);
    await checkStatus('setProxy("$proxy")', response);
  }

  Future<String> mirror() async {
    final request = Request('GET', Uri.http('localhost', 'mirror'));
    final response = await _client.send(request);
    await checkStatus("mirror()", response);

    final responseStr = await response.stream.bytesToString();
    return responseStr.replaceAll('"', '');
  }

  Future<void> setMirror(String mirror) async {
    final request = Request('POST', Uri.http('localhost', 'mirror'));
    request.body = '"$mirror"';
    final response = await _client.send(request);
    await checkStatus('setMirror("$mirror")', response);
  }

  Future<IdentityData> identity() async {
    final request = Request('GET', Uri.http('localhost', 'identity'));
    final response = await _client.send(request);
    await checkStatus("identity()", response);

    final identityJson = jsonDecode(await response.stream.bytesToString());
    return IdentityData.fromJson(identityJson);
  }

  Future<void> setIdentity(IdentityData identity) async {
    final request = Request('POST', Uri.http('localhost', 'identity'));
    request.body = jsonEncode(identity.toJson());
    final response = await _client.send(request);
    await checkStatus(
        "setIdentity(${jsonEncode(identity.toJson())})", response);
  }

  Future<TimezoneData> timezone() async {
    final request = Request('GET', Uri.http('localhost', 'timezone'));
    final response = await _client.send(request);
    await checkStatus("timezone()", response);

    final timezoneJson = jsonDecode(await response.stream.bytesToString());
    return TimezoneData.fromJson(timezoneJson);
  }

  Future<void> setTimezone(String timezone) async {
    final request = Request(
        'POST', Uri.http('localhost', 'timezone', {'tz': '"$timezone"'}));
    final response = await _client.send(request);
    await checkStatus('setTimezone("$timezone")', response);
  }

  Future<SSHData> ssh() async {
    final request = Request('GET', Uri.http('localhost', 'ssh'));
    final response = await _client.send(request);
    await checkStatus("ssh()", response);

    final sshJson = jsonDecode(await response.stream.bytesToString());
    return SSHData.fromJson(sshJson);
  }

  Future<void> setSsh(SSHData ssh) async {
    final request = Request('POST', Uri.http('localhost', 'ssh'));
    request.body = jsonEncode(ssh.toJson());
    final response = await _client.send(request);
    await checkStatus("setSsh(${jsonEncode(ssh.toJson())})", response);
  }

  /// Get the installer state.
  Future<ApplicationStatus> status({ApplicationState? current}) async {
    var response;

    if (current != null) {
      final currentState = current.toString().split('.').last;
      final request = Request('GET',
          Uri.http('localhost', 'meta/status', {'cur': '"$currentState"'}));
      response = await _client.send(request);
      await checkStatus('status("$currentState")', response);
    } else {
      final request = Request('GET', Uri.http('localhost', 'meta/status'));
      response = await _client.send(request);
      await checkStatus("status()", response);
    }

    final statusJson = jsonDecode(await response.stream.bytesToString());
    return ApplicationStatus.fromJson(statusJson);
  }

  /// Mark the controllers for endpoint_names as configured.
  Future<void> markConfigured(List<String> endpointNames) async {
    final request = Request(
        'POST',
        Uri.http('localhost', 'meta/mark_configured',
            {'endpoint_names': jsonEncode(endpointNames)}));
    final response = await _client.send(request);
    await checkStatus("markConfigured(${jsonEncode(endpointNames)})", response);
  }

  /// Confirm that the installation should proceed.
  Future<void> confirm(String tty) async {
    final request = Request(
        'POST', Uri.http('localhost', 'meta/confirm', {'tty': '"$tty"'}));
    final response = await _client.send(request);
    await checkStatus('confirm("$tty")', response);
  }

  /// Returns whether RST is turned on.
  Future<bool> hasRst() async {
    final request = Request('GET', Uri.http('localhost', 'storage/has_rst'));
    final response = await _client.send(request);
    await checkStatus("hasRst()", response);

    final responseBool = await response.stream.bytesToString();
    return responseBool == 'true';
  }

  /// Returns whether any disks contain BitLocker partitions.
  Future<bool> hasBitLocker() async {
    final request =
        Request('GET', Uri.http('localhost', 'storage/has_bitlocker'));
    final response = await _client.send(request);
    await checkStatus("hasBitLocker()", response);

    final responseJson = jsonDecode(await response.stream.bytesToString());
    return (responseJson as List).isNotEmpty;
  }

  /// Get guided disk options.
  Future<GuidedStorageResponse> getGuidedStorage(int minSize, bool wait) async {
    final request = Request(
        'GET',
        Uri.http('localhost', 'storage/guided',
            {'min_size': '$minSize', 'wait': '$wait'}));
    final response = await _client.send(request);
    await checkStatus("getGuidedStorage('$minSize', '$wait')", response);

    final responseJson = jsonDecode(await response.stream.bytesToString());
    return GuidedStorageResponse.fromJson(responseJson);
  }

  /// Set guided disk option.
  Future<StorageResponse> setGuidedStorage(GuidedChoice choice) async {
    final request = Request(
        'POST',
        Uri.http('localhost', 'storage/guided',
            {'choice': jsonEncode(choice.toJson())}));
    final response = await _client.send(request);
    await checkStatus(
        "setGuidedStorage(${jsonEncode(choice.toJson())})", response);

    final responseJson = jsonDecode(await response.stream.bytesToString());
    return StorageResponse.fromJson(responseJson);
  }

  Future<void> setStorage(List<dynamic> config) async {
    final request = Request('POST', Uri.http('localhost', 'storage'));
    request.body = jsonEncode(config);
    final response = await _client.send(request);
    await checkStatus("setStorage(${jsonEncode(config)})", response);
  }

  Future<void> reboot({bool immediate = false}) async {
    final request = Request(
        'POST',
        Uri.http('localhost', 'shutdown',
            {'mode': '"REBOOT"', 'immediate': '$immediate'}));
    await _client.write(request);
  }

  Future<void> shutdown({bool immediate = false}) async {
    final request = Request(
        'POST',
        Uri.http('localhost', 'shutdown',
            {'mode': '"POWEROFF"', 'immediate': '$immediate'}));
    await _client.write(request);
  }

  Future<WSLConfiguration1Data> wslConfiguration1() async {
    final request = Request('GET', Uri.http('localhost', 'wslconf1'));
    final response = await _client.send(request);
    await checkStatus("wslconf1()", response);

    final json = jsonDecode(await response.stream.bytesToString());
    return WSLConfiguration1Data.fromJson(json);
  }

  Future<void> setWslConfiguration1(WSLConfiguration1Data conf) async {
    final request = Request('POST', Uri.http('localhost', 'wslconf1'));
    request.body = jsonEncode(conf.toJson());
    final response = await _client.send(request);
    await checkStatus("setWslconf1(${jsonEncode(conf.toJson())})", response);
  }

  Future<WSLConfiguration2Data> wslConfiguration2() async {
    final request = Request('GET', Uri.http('localhost', 'wslconf2'));
    final response = await _client.send(request);
    await checkStatus("wslconf2()", response);

    final json = jsonDecode(await response.stream.bytesToString());
    return WSLConfiguration2Data.fromJson(json);
  }

  Future<void> setWslConfiguration2(WSLConfiguration2Data conf) async {
    final request = Request('POST', Uri.http('localhost', 'wslconf2'));
    request.body = jsonEncode(conf.toJson());
    final response = await _client.send(request);
    await checkStatus("setWslconf2(${jsonEncode(conf.toJson())})", response);
  }

  Future<KeyboardStep> getKeyboardStep([String? step = '0']) async {
    final request = Request('GET',
        Uri.http('localhost', 'keyboard/steps', {'index': '"${step ?? 0}"'}));
    final response = await _client.send(request);
    await checkStatus("getKeyboardStep($step)", response);

    final json = jsonDecode(await response.stream.bytesToString());
    return KeyboardStep.fromJson(json);
  }
}
