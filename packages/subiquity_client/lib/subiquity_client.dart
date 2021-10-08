library subiquity_client;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'src/http_unix_client.dart';
import 'src/types.dart';

export 'src/types.dart';

/// @internal
final log = Logger('subiquity_client');

const _kMaxResponseLogLength = 120;

String _formatResponseLog(String method, String response) {
  var formatted = response;
  if (response.length > _kMaxResponseLogLength) {
    formatted = '${response.substring(0, _kMaxResponseLogLength)}...';
  }
  return '==> $method $formatted';
}

class SubiquityException implements Exception {
  const SubiquityException(this.method, this.statusCode, this.message);
  final String method;
  final int statusCode;
  final String message;
  String toString() => '$method returned error $statusCode\n$message';
}

class SubiquityClient {
  late HttpUnixClient _client;
  final _isOpen = Completer<bool>();

  Future<bool> get isOpen => _isOpen.future;

  void open(String socketPath) {
    log.info('Opening socket $socketPath');
    _client = HttpUnixClient(socketPath);
    _isOpen.complete(true);
  }

  Future<void> close() {
    log.info('Closing socket ${_client.path}');
    return _client.flush().then((_) => _client.close());
  }

  Future<String> _receive(String method, StreamedResponse response) async {
    final responseStr = await response.stream.bytesToString();
    if (response.statusCode != 200) {
      throw SubiquityException(method, response.statusCode, responseStr);
    }
    log.debug(() => _formatResponseLog(method, responseStr));
    return responseStr;
  }

  Future<Map<String, dynamic>> _receiveJson(
      String method, StreamedResponse response) async {
    final responseStr = await _receive(method, response);
    return jsonDecode(responseStr) as Map<String, dynamic>;
  }

  Future<StreamedResponse> _send(Request request) {
    log.debug(request);
    return _client.send(request);
  }

  Future<void> setVariant(Variant variant) async {
    String variantString;
    switch (variant) {
      case Variant.SERVER:
        variantString = "server";
        break;
      case Variant.DESKTOP:
        variantString = "desktop";
        break;
      case Variant.WSL_SETUP:
        variantString = "wsl_setup";
        break;
      case Variant.WSL_CONFIGURATION:
        variantString = "wsl_configuration";
        break;
    }
    final request = Request(
        'POST',
        Uri.http('localhost', 'meta/client_variant',
            {'variant': '"$variantString"'}));
    final response = await _send(request);
    await _receive('setVariant("$variantString")', response);
  }

  Future<SourceSelectionAndSetting> source() async {
    final request = Request('GET', Uri.http('localhost', 'source'));
    final response = await _send(request);

    final json = await _receiveJson("source()", response);
    return SourceSelectionAndSetting.fromJson(json);
  }

  Future<void> setSource(String sourceId) async {
    final request = Request(
        'POST', Uri.http('localhost', 'source', {'source_id': '"$sourceId"'}));
    final response = await _send(request);
    await _receive('setSource("$sourceId")', response);
  }

  Future<String> locale() async {
    final request = Request('GET', Uri.http('localhost', 'locale'));
    final response = await _send(request);

    final responseStr = await _receive("locale()", response);
    return responseStr.replaceAll('"', '');
  }

  Future<void> setLocale(String locale) async {
    final request = Request('POST', Uri.http('localhost', 'locale'));
    request.body = '"$locale"';
    final response = await _send(request);
    await _receive('setLocale("$locale")', response);
  }

  Future<KeyboardSetup> keyboard() async {
    final request = Request('GET', Uri.http('localhost', 'keyboard'));
    final response = await _send(request);

    final keyboardJson = await _receiveJson("keyboard()", response);
    return KeyboardSetup.fromJson(keyboardJson);
  }

  Future<void> setKeyboard(KeyboardSetting setting) async {
    final request = Request('POST', Uri.http('localhost', 'keyboard'));
    request.body = jsonEncode(setting.toJson());
    final response = await _send(request);
    await _receive("setKeyboard(${jsonEncode(setting.toJson())})", response);
  }

  Future<String> proxy() async {
    final request = Request('GET', Uri.http('localhost', 'proxy'));
    final response = await _send(request);

    final responseStr = await _receive("proxy()", response);
    return responseStr.replaceAll('"', '');
  }

  Future<void> setProxy(String proxy) async {
    final request = Request('POST', Uri.http('localhost', 'proxy'));
    request.body = '"$proxy"';
    final response = await _send(request);
    await _receive('setProxy("$proxy")', response);
  }

  Future<String> mirror() async {
    final request = Request('GET', Uri.http('localhost', 'mirror'));
    final response = await _send(request);

    final responseStr = await _receive("mirror()", response);
    return responseStr.replaceAll('"', '');
  }

  Future<void> setMirror(String mirror) async {
    final request = Request('POST', Uri.http('localhost', 'mirror'));
    request.body = '"$mirror"';
    final response = await _send(request);
    await _receive('setMirror("$mirror")', response);
  }

  Future<IdentityData> identity() async {
    final request = Request('GET', Uri.http('localhost', 'identity'));
    final response = await _send(request);

    final identityJson = await _receiveJson("identity()", response);
    return IdentityData.fromJson(identityJson);
  }

  Future<void> setIdentity(IdentityData identity) async {
    final request = Request('POST', Uri.http('localhost', 'identity'));
    request.body = jsonEncode(identity.toJson());
    final response = await _send(request);
    await _receive("setIdentity(${jsonEncode(identity.toJson())})", response);
  }

  Future<TimezoneData> timezone() async {
    final request = Request('GET', Uri.http('localhost', 'timezone'));
    final response = await _send(request);

    final timezoneJson = await _receiveJson("timezone()", response);
    return TimezoneData.fromJson(timezoneJson);
  }

  Future<void> setTimezone(String timezone) async {
    final request = Request(
        'POST', Uri.http('localhost', 'timezone', {'tz': '"$timezone"'}));
    final response = await _send(request);
    await _receive('setTimezone("$timezone")', response);
  }

  Future<SSHData> ssh() async {
    final request = Request('GET', Uri.http('localhost', 'ssh'));
    final response = await _send(request);

    final sshJson = await _receiveJson("ssh()", response);
    return SSHData.fromJson(sshJson);
  }

  Future<void> setSsh(SSHData ssh) async {
    final request = Request('POST', Uri.http('localhost', 'ssh'));
    request.body = jsonEncode(ssh.toJson());
    final response = await _send(request);
    await _receive("setSsh(${jsonEncode(ssh.toJson())})", response);
  }

  String _formatState(ApplicationState? state) =>
      state?.toString().split('.').last ?? 'null';

  /// Get the installer state.
  Future<ApplicationStatus> status({ApplicationState? current}) async {
    late Map<String, dynamic> statusJson;
    final currentState = _formatState(current);

    if (current != null) {
      final request = Request('GET',
          Uri.http('localhost', 'meta/status', {'cur': '"$currentState"'}));
      final response = await _send(request);
      statusJson = await _receiveJson('status("$currentState")', response);
    } else {
      final request = Request('GET', Uri.http('localhost', 'meta/status'));
      final response = await _send(request);
      statusJson = await _receiveJson("status()", response);
    }

    final result = ApplicationStatus.fromJson(statusJson);
    log.info('state: $currentState => ${_formatState(result.state)}');

    return result;
  }

  /// Mark the controllers for endpoint_names as configured.
  Future<void> markConfigured(List<String> endpointNames) async {
    final request = Request(
        'POST',
        Uri.http('localhost', 'meta/mark_configured',
            {'endpoint_names': jsonEncode(endpointNames)}));
    final response = await _send(request);
    await _receive("markConfigured(${jsonEncode(endpointNames)})", response);
  }

  /// Confirm that the installation should proceed.
  Future<void> confirm(String tty) async {
    final request = Request(
        'POST', Uri.http('localhost', 'meta/confirm', {'tty': '"$tty"'}));
    final response = await _send(request);
    await _receive('confirm("$tty")', response);
  }

  /// Returns whether RST is turned on.
  Future<bool> hasRst() async {
    final request = Request('GET', Uri.http('localhost', 'storage/has_rst'));
    final response = await _send(request);

    final responseBool = await _receive("hasRst()", response);
    return responseBool == 'true';
  }

  /// Returns whether any disks contain BitLocker partitions.
  Future<bool> hasBitLocker() async {
    final request =
        Request('GET', Uri.http('localhost', 'storage/has_bitlocker'));
    final response = await _send(request);

    final responseStr = await _receive("hasBitLocker()", response);
    return (jsonDecode(responseStr) as List).isNotEmpty;
  }

  /// Get guided disk options.
  Future<GuidedStorageResponse> getGuidedStorage(bool wait) async {
    final request = Request(
        'GET', Uri.http('localhost', 'storage/guided', {'wait': '$wait'}));
    final response = await _send(request);

    final responseJson =
        await _receiveJson("getGuidedStorage('$wait')", response);
    return GuidedStorageResponse.fromJson(responseJson);
  }

  /// Set guided disk option.
  Future<StorageResponse> setGuidedStorage(GuidedChoice choice) async {
    final request = Request(
        'POST',
        Uri.http('localhost', 'storage/guided',
            {'choice': jsonEncode(choice.toJson())}));
    final response = await _send(request);

    final responseJson = await _receiveJson(
        "setGuidedStorage(${jsonEncode(choice.toJson())})", response);
    return StorageResponse.fromJson(responseJson);
  }

  Future<StorageResponseV2> setGuidedStorageV2(GuidedChoice choice) async {
    final request = Request(
        'POST',
        Uri.http('localhost', 'storage/v2/guided',
            {'choice': jsonEncode(choice.toJson())}));
    final response = await _send(request);

    final responseJson = await _receiveJson(
        "setGuidedStorageV2(${jsonEncode(choice.toJson())})", response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<void> setStorage(List<dynamic> config) async {
    final request = Request('POST', Uri.http('localhost', 'storage'));
    request.body = jsonEncode(config);
    final response = await _send(request);
    await _receive("setStorage(${jsonEncode(config)})", response);
  }

  Future<StorageResponse> resetStorage() async {
    final request = Request('POST', Uri.http('localhost', 'storage/reset'));
    final response = await _send(request);

    final responseJson = await _receiveJson("resetStorage()", response);
    return StorageResponse.fromJson(responseJson);
  }

  Future<StorageResponseV2> getStorageV2() async {
    final request = Request('GET', Uri.http('localhost', 'storage/v2'));
    final response = await _send(request);

    final responseJson = await _receiveJson("getStorageV2()", response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> setStorageV2() async {
    final request = Request('POST', Uri.http('localhost', 'storage/v2'));
    final response = await _send(request);

    final responseJson = await _receiveJson("setStorageV2()", response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> resetStorageV2() async {
    final request = Request('POST', Uri.http('localhost', 'storage/v2/reset'));
    final response = await _send(request);

    final responseJson = await _receiveJson("resetStorageV2()", response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> addPartitionV2(
      Disk disk, Partition partition) async {
    final request =
        Request('POST', Uri.http('localhost', 'storage/v2/add_partition'));
    request.body = jsonEncode(<String, dynamic>{
      'disk_id': disk.id,
      'partition': partition.toJson(),
    });
    final response = await _send(request);

    final responseJson =
        await _receiveJson('addPartition(${disk.id}, )', response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> editPartitionV2(
      Disk disk, Partition partition) async {
    final request =
        Request('POST', Uri.http('localhost', 'storage/v2/edit_partition'));
    request.body = jsonEncode(<String, dynamic>{
      'disk_id': disk.id,
      'partition': partition.toJson(),
    });
    final response = await _send(request);

    final responseJson =
        await _receiveJson('editPartition(${disk.id}, )', response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> deletePartitionV2(
      Disk disk, Partition partition) async {
    final request =
        Request('POST', Uri.http('localhost', 'storage/v2/delete_partition'));
    request.body = jsonEncode(<String, dynamic>{
      'disk_id': disk.id,
      'partition': partition.toJson(),
    });
    final response = await _send(request);

    final responseJson =
        await _receiveJson('editPartition(${partition.number}, )', response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> addBootPartitionV2(Disk disk) async {
    final request = Request(
        'POST',
        Uri.http('localhost', 'storage/v2/add_boot_partition',
            {'disk_id': '"${disk.id}"'}));
    final response = await _send(request);

    final responseJson =
        await _receiveJson('addBootPartitionV2(${disk.id}, )', response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> reformatDiskV2(Disk disk) async {
    final request = Request(
        'POST',
        Uri.http('localhost', 'storage/v2/reformat_disk',
            {'disk_id': '"${disk.id}"'}));
    final response = await _send(request);

    final responseJson = await _receiveJson("reformatDiskV2()", response);
    return StorageResponseV2.fromJson(responseJson);
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

  Future<WSLConfigurationBase> wslConfigurationBase() async {
    final request = Request('GET', Uri.http('localhost', 'wslconfbase'));
    final response = await _send(request);

    final json = await _receiveJson("wslconfbase()", response);
    return WSLConfigurationBase.fromJson(json);
  }

  Future<void> setWslConfigurationBase(WSLConfigurationBase conf) async {
    final request = Request('POST', Uri.http('localhost', 'wslconfbase'));
    request.body = jsonEncode(conf.toJson());
    final response = await _send(request);
    await _receive("setWslconfbase(${jsonEncode(conf.toJson())})", response);
  }

  Future<WSLConfigurationAdvanced> wslConfigurationAdvanced() async {
    final request = Request('GET', Uri.http('localhost', 'wslconfadvanced'));
    final response = await _send(request);

    final json = await _receiveJson("wslconfadvanced()", response);
    return WSLConfigurationAdvanced.fromJson(json);
  }

  Future<void> setWslConfigurationAdvanced(
      WSLConfigurationAdvanced conf) async {
    final request = Request('POST', Uri.http('localhost', 'wslconfadvanced'));
    request.body = jsonEncode(conf.toJson());
    final response = await _send(request);
    await _receive(
        "setWslconfadvanced(${jsonEncode(conf.toJson())})", response);
  }

  Future<KeyboardStep> getKeyboardStep([String? step = '0']) async {
    final request = Request('GET',
        Uri.http('localhost', 'keyboard/steps', {'index': '"${step ?? 0}"'}));
    final response = await _send(request);

    final json = await _receiveJson("getKeyboardStep($step)", response);
    return KeyboardStep.fromJson(json);
  }
}
