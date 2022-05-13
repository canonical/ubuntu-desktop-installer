import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dartx/dartx.dart';
import 'package:path/path.dart' as p;
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'types.dart';

/// @internal
final log = Logger('subiquity_client');

const _kMaxResponseLogLength = 1200;

String _formatResponseLog(String method, String response) {
  var formatted = response;
  if (response.length > _kMaxResponseLogLength) {
    formatted = '${response.substring(0, _kMaxResponseLogLength)}...';
  }
  return '==> $method $formatted';
}

enum Variant { SERVER, DESKTOP, WSL_SETUP, WSL_CONFIGURATION }

extension VariantString on Variant {
  static Variant fromString(String value) {
    return Variant.values.firstWhere((v) => value == v.toVariantString());
  }

  String toVariantString() => name.toLowerCase();
}

class SubiquityException implements Exception {
  const SubiquityException(this.method, this.statusCode, this.message);
  final String method;
  final int statusCode;
  final String message;

  @override
  String toString() => '$method returned error $statusCode\n$message';
}

class SubiquityClient {
  final _client = HttpClient();
  late String _socketPath;
  final _isOpen = Completer<bool>();

  Future<bool> get isOpen => _isOpen.future;

  void open(String socketPath) {
    log.info('Opening socket ${p.absolute(socketPath)}');
    _socketPath = socketPath;
    _client.connectionFactory = (uri, proxyHost, proxyPort) async {
      var address = InternetAddress(socketPath, type: InternetAddressType.unix);
      return Socket.startConnect(address, 0);
    };
    _isOpen.complete(true);
  }

  Future<void> close() async {
    log.info('Closing socket ${p.absolute(_socketPath)}');
    _client.close();
  }

  Future<String> _receive(String method, HttpClientResponse response) async {
    final responseStr = await response.transform(utf8.decoder).join();
    if (response.statusCode != 200) {
      throw SubiquityException(method, response.statusCode, responseStr);
    }
    log.debug(() => _formatResponseLog(method, responseStr));
    return responseStr;
  }

  Future<Map<String, dynamic>> _receiveJson(
      String method, HttpClientResponse response) async {
    final responseStr = await _receive(method, response);
    return jsonDecode(responseStr) as Map<String, dynamic>;
  }

  Future<HttpClientRequest> _openUrl(String method, Uri url) {
    log.debug('$method $url');
    return _client.openUrl(method, url);
  }

  Future<Variant> variant() async {
    final request =
        await _openUrl('GET', Uri.http('localhost', 'meta/client_variant'));
    await request.close();
    final response = await request.done;

    final responseStr = await _receive("variant()", response);
    return VariantString.fromString(
        responseStr.removePrefix('"').removeSuffix('"'));
  }

  Future<void> setVariant(Variant variant) async {
    final variantString = variant.toVariantString();
    final request = await _openUrl(
        'POST',
        Uri.http('localhost', 'meta/client_variant',
            {'variant': '"$variantString"'}));
    await request.close();
    final response = await request.done;
    await _receive('setVariant("$variantString")', response);
  }

  Future<SourceSelectionAndSetting> source() async {
    final request = await _openUrl('GET', Uri.http('localhost', 'source'));
    await request.close();
    final response = await request.done;

    final json = await _receiveJson("source()", response);
    return SourceSelectionAndSetting.fromJson(json);
  }

  Future<void> setSource(String sourceId) async {
    final request = await _openUrl(
        'POST', Uri.http('localhost', 'source', {'source_id': '"$sourceId"'}));
    await request.close();
    final response = await request.done;
    await _receive('setSource("$sourceId")', response);
  }

  Future<String> locale() async {
    final request = await _openUrl('GET', Uri.http('localhost', 'locale'));
    await request.close();
    final response = await request.done;

    final responseStr = await _receive("locale()", response);
    return responseStr.replaceAll('"', '');
  }

  Future<void> setLocale(String locale) async {
    final request = await _openUrl('POST', Uri.http('localhost', 'locale'));
    request.write('"$locale"');
    await request.close();
    final response = await request.done;
    await _receive('setLocale("$locale")', response);
  }

  Future<KeyboardSetup> keyboard() async {
    final request = await _openUrl('GET', Uri.http('localhost', 'keyboard'));
    await request.close();
    final response = await request.done;

    final keyboardJson = await _receiveJson("keyboard()", response);
    return KeyboardSetup.fromJson(keyboardJson);
  }

  Future<void> setKeyboard(KeyboardSetting setting) async {
    final request = await _openUrl('POST', Uri.http('localhost', 'keyboard'));
    request.write(jsonEncode(setting.toJson()));
    await request.close();
    final response = await request.done;
    await _receive("setKeyboard(${jsonEncode(setting.toJson())})", response);
  }

  Future<String> proxy() async {
    final request = await _openUrl('GET', Uri.http('localhost', 'proxy'));
    await request.close();
    final response = await request.done;

    final responseStr = await _receive("proxy()", response);
    return responseStr.replaceAll('"', '');
  }

  Future<void> setProxy(String proxy) async {
    final request = await _openUrl('POST', Uri.http('localhost', 'proxy'));
    request.write('"$proxy"');
    await request.close();
    final response = await request.done;
    await _receive('setProxy("$proxy")', response);
  }

  Future<String> mirror() async {
    final request = await _openUrl('GET', Uri.http('localhost', 'mirror'));
    await request.close();
    final response = await request.done;

    final responseStr = await _receive("mirror()", response);
    return responseStr.replaceAll('"', '');
  }

  Future<void> setMirror(String mirror) async {
    final request = await _openUrl('POST', Uri.http('localhost', 'mirror'));
    request.write('"$mirror"');
    await request.close();
    final response = await request.done;
    await _receive('setMirror("$mirror")', response);
  }

  Future<bool> freeOnly() async {
    final request =
        await _openUrl('GET', Uri.http('localhost', 'meta/free_only'));
    await request.close();
    final response = await request.done;

    final responseBool = await _receive("freeOnly()", response);
    return responseBool == 'true';
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setFreeOnly(bool enable) async {
    final request = await _openUrl(
        'POST', Uri.http('localhost', 'meta/free_only', {'enable': '$enable'}));
    await request.close();
    final response = await request.done;
    await _receive('setFreeOnly("$freeOnly")', response);
  }

  Future<IdentityData> identity() async {
    final request = await _openUrl('GET', Uri.http('localhost', 'identity'));
    await request.close();
    final response = await request.done;

    final identityJson = await _receiveJson("identity()", response);
    return IdentityData.fromJson(identityJson);
  }

  Future<void> setIdentity(IdentityData identity) async {
    final request = await _openUrl('POST', Uri.http('localhost', 'identity'));
    request.write(jsonEncode(identity.toJson()));
    await request.close();
    final response = await request.done;
    await _receive("setIdentity(${jsonEncode(identity.toJson())})", response);
  }

  Future<TimezoneInfo> timezone() async {
    final request = await _openUrl('GET', Uri.http('localhost', 'timezone'));
    await request.close();
    final response = await request.done;

    final timezoneJson = await _receiveJson("timezone()", response);
    return TimezoneInfo.fromJson(timezoneJson);
  }

  Future<void> setTimezone(String timezone) async {
    final request = await _openUrl(
        'POST', Uri.http('localhost', 'timezone', {'tz': '"$timezone"'}));
    await request.close();
    final response = await request.done;
    await _receive('setTimezone("$timezone")', response);
  }

  Future<SSHData> ssh() async {
    final request = await _openUrl('GET', Uri.http('localhost', 'ssh'));
    await request.close();
    final response = await request.done;

    final sshJson = await _receiveJson("ssh()", response);
    return SSHData.fromJson(sshJson);
  }

  Future<void> setSsh(SSHData ssh) async {
    final request = await _openUrl('POST', Uri.http('localhost', 'ssh'));
    request.write(jsonEncode(ssh.toJson()));
    await request.close();
    final response = await request.done;
    await _receive("setSsh(${jsonEncode(ssh.toJson())})", response);
  }

  /// Get the installer state.
  Future<ApplicationStatus> status({ApplicationState? current}) async {
    late Map<String, dynamic> statusJson;

    if (current != null) {
      final request = await _openUrl('GET',
          Uri.http('localhost', 'meta/status', {'cur': '"${current.name}"'}));
      await request.close();
      final response = await request.done;
      statusJson = await _receiveJson('status("${current.name}")', response);
    } else {
      final request =
          await _openUrl('GET', Uri.http('localhost', 'meta/status'));
      await request.close();
      final response = await request.done;
      statusJson = await _receiveJson("status()", response);
    }

    final result = ApplicationStatus.fromJson(statusJson);
    log.info('state: ${current?.name} => ${result.state?.name}');

    return result;
  }

  /// Mark the controllers for endpoint_names as configured.
  Future<void> markConfigured(List<String> endpointNames) async {
    final request = await _openUrl(
        'POST',
        Uri.http('localhost', 'meta/mark_configured',
            {'endpoint_names': jsonEncode(endpointNames)}));
    await request.close();
    final response = await request.done;
    await _receive("markConfigured(${jsonEncode(endpointNames)})", response);
  }

  /// Confirm that the installation should proceed.
  Future<void> confirm(String tty) async {
    final request = await _openUrl(
        'POST', Uri.http('localhost', 'meta/confirm', {'tty': '"$tty"'}));
    await request.close();
    final response = await request.done;
    await _receive('confirm("$tty")', response);
  }

  /// Returns whether RST is turned on.
  Future<bool> hasRst() async {
    final request =
        await _openUrl('GET', Uri.http('localhost', 'storage/has_rst'));
    await request.close();
    final response = await request.done;

    final responseBool = await _receive("hasRst()", response);
    return responseBool == 'true';
  }

  /// Returns whether any disks contain BitLocker partitions.
  Future<bool> hasBitLocker() async {
    final request =
        await _openUrl('GET', Uri.http('localhost', 'storage/has_bitlocker'));
    await request.close();
    final response = await request.done;

    final responseStr = await _receive("hasBitLocker()", response);
    return (jsonDecode(responseStr) as List).isNotEmpty;
  }

  /// Get guided disk options.
  Future<GuidedStorageResponse> getGuidedStorage({bool wait = true}) async {
    final request = await _openUrl(
        'GET', Uri.http('localhost', 'storage/guided', {'wait': '$wait'}));
    await request.close();
    final response = await request.done;

    final responseJson =
        await _receiveJson("getGuidedStorage('$wait')", response);
    return GuidedStorageResponse.fromJson(responseJson);
  }

  Future<StorageResponseV2> setGuidedStorageV2(GuidedChoice choice) async {
    final request =
        await _openUrl('POST', Uri.http('localhost', 'storage/v2/guided'));
    request.write(jsonEncode(choice.toJson()));
    await request.close();
    final response = await request.done;

    final responseJson = await _receiveJson(
        "setGuidedStorageV2(${jsonEncode(choice.toJson())})", response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> getStorageV2() async {
    final request = await _openUrl('GET', Uri.http('localhost', 'storage/v2'));
    await request.close();
    final response = await request.done;

    final responseJson = await _receiveJson("getStorageV2()", response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> setStorageV2() async {
    final request = await _openUrl('POST', Uri.http('localhost', 'storage/v2'));
    await request.close();
    final response = await request.done;

    final responseJson = await _receiveJson("setStorageV2()", response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> resetStorageV2() async {
    final request =
        await _openUrl('POST', Uri.http('localhost', 'storage/v2/reset'));
    await request.close();
    final response = await request.done;

    final responseJson = await _receiveJson("resetStorageV2()", response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> addPartitionV2(
      Disk disk, Gap gap, Partition partition) async {
    final request = await _openUrl(
        'POST', Uri.http('localhost', 'storage/v2/add_partition'));
    request.write(jsonEncode(<String, dynamic>{
      'disk_id': disk.id,
      'gap': gap.toJson(),
      'partition': partition.toJson(),
    }));
    await request.close();
    final response = await request.done;

    final responseJson =
        await _receiveJson('addPartition(${disk.id}, $partition)', response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> editPartitionV2(
      Disk disk, Partition partition) async {
    final request = await _openUrl(
        'POST', Uri.http('localhost', 'storage/v2/edit_partition'));
    request.write(jsonEncode(<String, dynamic>{
      'disk_id': disk.id,
      'partition': partition.toJson(),
    }));
    await request.close();
    final response = await request.done;

    final responseJson =
        await _receiveJson('editPartition(${disk.id}, $partition)', response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> deletePartitionV2(
      Disk disk, Partition partition) async {
    final request = await _openUrl(
        'POST', Uri.http('localhost', 'storage/v2/delete_partition'));
    request.write(jsonEncode(<String, dynamic>{
      'disk_id': disk.id,
      'partition': partition.toJson(),
    }));
    await request.close();
    final response = await request.done;

    final responseJson =
        await _receiveJson('deletePartition(${disk.id}, $partition)', response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> addBootPartitionV2(Disk disk) async {
    final request = await _openUrl(
        'POST',
        Uri.http('localhost', 'storage/v2/add_boot_partition',
            {'disk_id': '"${disk.id}"'}));
    await request.close();
    final response = await request.done;

    final responseJson =
        await _receiveJson('addBootPartitionV2(${disk.id})', response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<StorageResponseV2> reformatDiskV2(Disk disk) async {
    final request = await _openUrl(
        'POST', Uri.http('localhost', 'storage/v2/reformat_disk'));
    request.write(jsonEncode({'disk_id': disk.id}));
    await request.close();
    final response = await request.done;

    final responseJson =
        await _receiveJson("reformatDiskV2(${disk.id})", response);
    return StorageResponseV2.fromJson(responseJson);
  }

  Future<void> reboot({bool immediate = false}) async {
    final request = await _openUrl(
        'POST',
        Uri.http('localhost', 'shutdown',
            {'mode': '"REBOOT"', 'immediate': '$immediate'}));
    await request.close();
    await request.done;
  }

  Future<void> shutdown({bool immediate = false}) async {
    final request = await _openUrl(
        'POST',
        Uri.http('localhost', 'shutdown',
            {'mode': '"POWEROFF"', 'immediate': '$immediate'}));
    await request.close();
    await request.done;
  }

  Future<WSLConfigurationBase> wslConfigurationBase() async {
    final request = await _openUrl('GET', Uri.http('localhost', 'wslconfbase'));
    await request.close();
    final response = await request.done;

    final json = await _receiveJson("wslconfbase()", response);
    return WSLConfigurationBase.fromJson(json);
  }

  Future<void> setWslConfigurationBase(WSLConfigurationBase conf) async {
    final request =
        await _openUrl('POST', Uri.http('localhost', 'wslconfbase'));
    request.write(jsonEncode(conf.toJson()));
    await request.close();
    final response = await request.done;
    await _receive("setWslconfbase(${jsonEncode(conf.toJson())})", response);
  }

  Future<WSLConfigurationAdvanced> wslConfigurationAdvanced() async {
    final request =
        await _openUrl('GET', Uri.http('localhost', 'wslconfadvanced'));
    await request.close();
    final response = await request.done;

    final json = await _receiveJson("wslconfadvanced()", response);
    return WSLConfigurationAdvanced.fromJson(json);
  }

  Future<void> setWslConfigurationAdvanced(
      WSLConfigurationAdvanced conf) async {
    final request =
        await _openUrl('POST', Uri.http('localhost', 'wslconfadvanced'));
    request.write(jsonEncode(conf.toJson()));
    await request.close();
    final response = await request.done;
    await _receive(
        "setWslconfadvanced(${jsonEncode(conf.toJson())})", response);
  }

  Future<AnyStep> getKeyboardStep([String? step = '0']) async {
    final request = await _openUrl('GET',
        Uri.http('localhost', 'keyboard/steps', {'index': '"${step ?? 0}"'}));
    await request.close();
    final response = await request.done;

    final json = await _receiveJson("getKeyboardStep($step)", response);
    return AnyStep.fromJson(json);
  }
}
