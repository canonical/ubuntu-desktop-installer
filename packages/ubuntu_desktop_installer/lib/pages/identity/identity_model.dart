import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_wizard/utils.dart';

export 'package:ubuntu_wizard/utils.dart' show PasswordStrength;

/// @internal
final log = Logger('identity');

/// The regular expression pattern for valid usernames:
/// - must start with a lowercase letter
/// - may contain lowercase letters, digits, hyphens, and underscores
const kValidUsernamePattern = r'^[a-z][a-z0-9-_]*$';

/// The regular expression pattern for valid hostnames:
/// - must start and end with a letter or digit
/// - may contain letters, digits, hyphens, and dots
const kValidHostnamePattern = r'^[a-zA-Z0-9]([a-zA-Z0-9.-]*[a-zA-Z0-9])*$';

/// The maximum length for valid real names
const kMaxRealNameLength = 160;

/// The maximum length for valid hostnames
const kMaxHostnameLength = 64;

/// The maximum length for valid usernames
const kMaxUsernameLength = 32;

final identityModelProvider = ChangeNotifierProvider(
  (_) => IdentityModel(
    client: getService<SubiquityClient>(),
    activeDirectory: getService<ActiveDirectoryService>(),
    config: getService<ConfigService>(),
    network: getService<NetworkService>(),
    telemetry: getService<TelemetryService>(),
  ),
);

/// [IdentityPage]'s view model.
class IdentityModel extends PropertyStreamNotifier {
  /// Creates the model with the given client.
  IdentityModel({
    required SubiquityClient client,
    required ActiveDirectoryService activeDirectory,
    required ConfigService config,
    required NetworkService network,
    required TelemetryService telemetry,
  })  : _client = client,
        _activeDirectory = activeDirectory,
        _config = config,
        _network = network,
        _telemetry = telemetry {
    Listenable.merge([
      _realName,
      _hostname,
      _username,
      _usernameValidation,
      _password,
      _confirmedPassword,
      _autoLogin,
      _productName,
      _showPassword,
      _hasActiveDirectorySupport,
      _useActiveDirectory,
    ]).addListener(notifyListeners);

    addPropertyListener('State', notifyListeners);
    setProperties(_network.propertiesChanged);
  }

  final SubiquityClient _client;
  final ActiveDirectoryService _activeDirectory;
  final ConfigService _config;
  final NetworkService _network;
  final TelemetryService _telemetry;

  final _realName = ValueNotifier<String?>(null);
  final _username = ValueNotifier<String?>(null);
  final _usernameValidation =
      ValueNotifier<UsernameValidation>(UsernameValidation.OK);
  final _hostname = ValueNotifier<String?>(null);
  final _password = ValueNotifier<String?>(null);
  final _confirmedPassword = ValueNotifier<String?>(null);
  final _autoLogin = ValueNotifier<bool>(false);
  final _productName = ValueNotifier<String>('');
  final _showPassword = ValueNotifier<bool>(false);
  final _hasActiveDirectorySupport = ValueNotifier<bool?>(null);
  final _useActiveDirectory = ValueNotifier<bool>(false);

  /// The current real name.
  String get realName => _realName.value ?? '';
  set realName(String value) => _realName.value = value;

  /// The current hostname or generates one if not set.
  String get hostname => _hostname.value ?? _generateHostname();
  set hostname(String value) => _hostname.value = value;

  // Generates a hostname `<username>-<system hostname>`.
  String _generateHostname() {
    if (username.isEmpty || _productName.value.isEmpty) return '';
    return '$username-${_productName.value}'.truncate(kMaxHostnameLength);
  }

  /// The current username or a sanitized real name if not set.
  String get username =>
      _username.value ??
      realName.sanitize().toLowerCase().truncate(kMaxUsernameLength);
  set username(String value) => _username.value = value;

  /// The current password.
  String get password => _password.value ?? '';
  set password(String value) => _password.value = value;

  /// The confirmed password for validation.
  String get confirmedPassword => _confirmedPassword.value ?? '';
  set confirmedPassword(String value) => _confirmedPassword.value = value;

  /// Estimates the strength of the password.
  PasswordStrength get passwordStrength => estimatePasswordStrength(password);

  /// Whether to enable automatic login, or require password.
  bool get autoLogin => _autoLogin.value;
  set autoLogin(bool value) => _autoLogin.value = value;

  /// Returns true if there is at least site-wide connectivity.
  bool get isConnected => _network.isConnected || _network.isConnectedSite;

  /// Whether Active Directory support is available or null when unknown.
  bool? get hasActiveDirectorySupport => _hasActiveDirectorySupport.value;

  /// Whether to use Active Directory.
  bool get useActiveDirectory => _useActiveDirectory.value;
  set useActiveDirectory(bool value) => _useActiveDirectory.value = value;

  /// Whether the current input is valid.
  bool get isValid {
    return realName.isNotEmpty &&
        realName.length <= kMaxRealNameLength &&
        hostname.isNotEmpty &&
        hostname.length <= kMaxHostnameLength &&
        username.isNotEmpty &&
        username.length <= kMaxUsernameLength &&
        usernameOk &&
        password.isNotEmpty &&
        password == confirmedPassword &&
        RegExp(kValidUsernamePattern).hasMatch(username) &&
        RegExp(kValidHostnamePattern).hasMatch(hostname);
  }

  /// The server response on whether the desired username is available.
  UsernameValidation get usernameValidation => _usernameValidation.value;
  bool get usernameOk => _usernameValidation.value == UsernameValidation.OK;

  Future<void> validate() async {
    if (username.isNotEmpty &&
        RegExp(kValidUsernamePattern).hasMatch(username)) {
      _usernameValidation.value = await _client.validateUsername(username);
    }
  }

  /// Loads the identity data from the server, and resolves the system hostname.
  Future<void> init() async {
    final identity = await _client.getIdentity();
    _realName.value ??= identity.realname.orIfEmpty(null);
    _hostname.value ??= identity.hostname.orIfEmpty(null);
    _username.value ??= identity.username.orIfEmpty(null);
    log.info('Loaded identity: ${identity.description}');
    _productName.value = await _readProductName();
    log.info('Read product name: ${_productName.value}');

    _autoLogin.value = await _config.get(kAutoLoginUser) != null;
    _hasActiveDirectorySupport.value = await _activeDirectory.hasSupport();
  }

  /// The auto-login user config key for testing purposes.
  @visibleForTesting
  static const kAutoLoginUser = 'AutoLoginUser';

  /// Saves the identity data to the server.
  Future<void> save({@visibleForTesting String? salt}) async {
    final identity = IdentityData(
      realname: realName,
      hostname: hostname,
      username: username,
      cryptedPassword: encryptPassword(password, salt: salt),
    );
    log.info('Saved identity: ${identity.description}');

    if (autoLogin) {
      log.info('Enabled auto-login');
      await _config.set(kAutoLoginUser, username);
    } else {
      log.info('Disabled auto-login');
      await _config.set(kAutoLoginUser, null);
    }

    _telemetry.addMetric('UseActiveDirectory', useActiveDirectory);
    if (!useActiveDirectory) {
      // the active directory endpoint is not optional so we need to explicitly
      // mark it as configured even if not used to avoid subiquity getting stuck
      // at waiting for it to be configured.
      await _activeDirectory.markConfigured();
    }

    return _client.setIdentity(identity);
  }

  /// Defines if the password is shown or obscured.
  bool get showPassword => _showPassword.value;
  set showPassword(bool value) => _showPassword.value = value;
}

/// The DMI product name file. Available for testing.
@visibleForTesting
const kDMIProductNameFile = '/sys/devices/virtual/dmi/id/product_name';

Future<String> _readProductName() {
  return File(kDMIProductNameFile)
      .readAsString()
      .then((value) => value.trim().sanitize())
      .catchError((_) => '');
}

extension _IdentityDescription on IdentityData {
  String get description {
    return 'realname: "$realname", hostname: "$hostname", username: "$username"';
  }
}

extension _StringTruncate on String {
  String truncate(int length) =>
      this.length > length ? substring(0, length) : this;
}
