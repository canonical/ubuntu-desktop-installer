import 'package:subiquity_client/src/types.dart';
import 'package:test/test.dart';

void main() {
  test('keyboard setting', () {
    const keyboard = KeyboardSetting(
      layout: 'us',
      variant: 'intl',
      toggle: 'null',
    );
    const json = <String, dynamic>{
      'layout': 'us',
      'variant': 'intl',
      'toggle': 'null',
    };
    expect(keyboard.toJson(), equals(json));
    expect(KeyboardSetting.fromJson(json), keyboard);
  });

  test('identity data', () {
    const identity = IdentityData(
      realname: 'Groovy Gorilla',
      username: 'ubuntu',
      cryptedPassword: '1d41c853af58d3a7ae54990ce29417d8',
      hostname: 'localhost',
    );
    const json = <String, dynamic>{
      'realname': 'Groovy Gorilla',
      'username': 'ubuntu',
      'crypted_password': '1d41c853af58d3a7ae54990ce29417d8',
      'hostname': 'localhost',
    };
    expect(identity.toJson(), equals(json));
    expect(IdentityData.fromJson(json), identity);
  });

  test('timezone data', () {
    const tzdata = TimezoneData(timezone: 'Europe/Paris', fromGeoIP: false);
    const json = <String, dynamic>{
      'timezone': 'Europe/Paris',
      'from_geoip': false,
    };
    expect(tzdata.toJson(), equals(json));
    expect(TimezoneData.fromJson(json), tzdata);
  });

  test('ssh data', () {
    const ssh = SSHData(
      installServer: false,
      allowPw: true,
      authorizedKeys: <String>['k', 'e', 'y', 's'],
    );
    const json = <String, dynamic>{
      'install_server': false,
      'allow_pw': true,
      'authorized_keys': ['k', 'e', 'y', 's'],
    };
    expect(ssh.toJson(), equals(json));
    expect(SSHData.fromJson(json), ssh);
  });

  test('error report ref', () {
    const error = ErrorReportRef(
      state: ErrorReportState.DONE,
      base: 'esab',
      kind: ErrorReportKind.UNKNOWN,
      seen: true,
      oopsId: '123',
    );
    const json = <String, dynamic>{
      'state': 'DONE',
      'base': 'esab',
      'kind': 'UNKNOWN',
      'seen': true,
      'oops_id': '123'
    };
    expect(error.toJson(), equals(json));
    expect(ErrorReportRef.fromJson(json), error);
  });

  test('application status', () {
    const status = ApplicationStatus(
      state: ApplicationState.ERROR,
      confirmingTty: 'tty',
      error: ErrorReportRef(
        state: ErrorReportState.DONE,
        base: 'esab',
        kind: ErrorReportKind.UNKNOWN,
        seen: true,
        oopsId: '123',
      ),
      cloudInitOk: true,
      interactive: false,
      echoSyslogId: '123',
      logSyslogId: '456',
      eventSyslogId: '789',
    );
    const json = <String, dynamic>{
      'state': 'ERROR',
      'confirming_tty': 'tty',
      'error': <String, dynamic>{
        'state': 'DONE',
        'base': 'esab',
        'kind': 'UNKNOWN',
        'seen': true,
        'oops_id': '123'
      },
      'cloud_init_ok': true,
      'interactive': false,
      'echo_syslog_id': '123',
      'log_syslog_id': '456',
      'event_syslog_id': '789',
    };
    expect(status.toJson(), equals(json));
    expect(ApplicationStatus.fromJson(json), status);
  });

  test('partition', () {
    const keyboard = Partition(
      size: 1,
      number: 2,
      preserve: false,
      wipe: true,
      annotations: ['3', '4', '5'],
      mount: '/foo',
      format: 'bar',
      grubDevice: false,
    );
    const json = <String, dynamic>{
      'size': 1,
      'number': 2,
      'preserve': false,
      'wipe': 'superblock',
      'annotations': ['3', '4', '5'],
      'mount': '/foo',
      'format': 'bar',
      'grub_device': false,
    };
    expect(keyboard.toJson(), equals(json));
    expect(Partition.fromJson(json), keyboard);
  });

  test('guided choice', () {
    const keyboard = GuidedChoice(
      diskId: '0',
      useLvm: true,
      password: '2',
    );
    const json = <String, dynamic>{
      'disk_id': '0',
      'use_lvm': true,
      'password': '2',
    };
    expect(keyboard.toJson(), equals(json));
    expect(GuidedChoice.fromJson(json), keyboard);
  });

  test('wsl configuration base data', () {
    const conf = WSLConfigurationBase(
      automountRoot: '/mnt/',
      automountOptions: '',
      networkGeneratehosts: true,
      networkGenerateresolvconf: true,
    );
    const json = <String, dynamic>{
      'automount_root': '/mnt/',
      'automount_options': '',
      'network_generatehosts': true,
      'network_generateresolvconf': true,
    };
    expect(conf.toJson(), equals(json));
    expect(WSLConfigurationBase.fromJson(json), conf);
  });

  test('wsl configuration advanced', () {
    const conf = WSLConfigurationAdvanced(
      guiTheme: 'default',
      guiFollowwintheme: true,
      interopGuiintegration: false,
      interopAudiointegration: false,
      interopAdvancedipdetection: false,
      motdWSLnewsenabled: true,
      automountEnabled: true,
      automountMountfstab: true,
      interopEnabled: true,
      interopAppendwindowspath: true,
    );
    const json = <String, dynamic>{
      'gui_theme': 'default',
      'gui_followwintheme': true,
      'interop_guiintegration': false,
      'interop_audiointegration': false,
      'interop_advancedipdetection': false,
      'motd_wslnewsenabled': true,
      'automount_enabled': true,
      'automount_mountfstab': true,
      'interop_enabled': true,
      'interop_appendwindowspath': true,
    };
    expect(conf.toJson(), equals(json));
    expect(WSLConfigurationAdvanced.fromJson(json), conf);
  });

  test('keyboard layout key press step', () {
    const step = StepPressKey(
      symbols: ['z'],
      keycodes: [
        [21, '2'],
        [44, '3']
      ],
    );
    final json = <String, dynamic>{
      'symbols': ['z'],
      'keycodes': [
        [21, '2'],
        [44, '3']
      ],
      '\$type': 'StepPressKey',
    };
    expect(step.toJson(), equals(json));
    expect(StepPressKey.fromJson(json), step);
  });

  test('keyboard layout key present step', () {
    const step = KeyboardStep.keyPresent(
      symbol: 'ö',
      yes: '9',
      no: '4',
    );
    final json = <String, dynamic>{
      'symbol': 'ö',
      'yes': '9',
      'no': '4',
      '\$type': 'StepKeyPresent',
    };
    expect(step.toJson(), equals(json));
    expect(KeyboardStep.fromJson(json), step);
  });

  test('keyboard layout result step', () {
    const step = StepResult(
      layout: 'de',
      variant: 'nodeadkeys',
    );
    final json = <String, dynamic>{
      'layout': 'de',
      'variant': 'nodeadkeys',
      '\$type': 'StepResult',
    };
    expect(step.toJson(), equals(json));
    expect(StepResult.fromJson(json), step);
  });
}
