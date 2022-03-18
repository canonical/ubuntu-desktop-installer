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
    const tzdata = TimezoneData(timezone: 'Europe/Paris', fromGeoip: false);
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

  test('os prober', () {
    const os = OsProber(
      long: 'Windows Boot Manager',
      label: 'Windows',
      type: 'efi',
      subpath: '/efi/Microsoft/Boot/bootmgfw.efi',
      version: '11',
    );
    final json = <String, dynamic>{
      'long': 'Windows Boot Manager',
      'label': 'Windows',
      'type': 'efi',
      'subpath': '/efi/Microsoft/Boot/bootmgfw.efi',
      'version': '11',
    };
    expect(os.toJson(), equals(json));
    expect(OsProber.fromJson(json), os);
  });

  test('partition', () {
    const partition = Partition(
      offset: 678,
      size: 1,
      number: 2,
      preserve: false,
      wipe: true,
      annotations: ['3', '4', '5'],
      mount: '/foo',
      format: 'bar',
      grubDevice: false,
      os: OsProber(
        long: 'Windows Boot Manager',
        label: 'Windows',
        type: 'efi',
        subpath: '/efi/Microsoft/Boot/bootmgfw.efi',
        version: '11',
      ),
    );
    const json = <String, dynamic>{
      'offset': 678,
      'size': 1,
      'number': 2,
      'preserve': false,
      'wipe': 'superblock',
      'annotations': ['3', '4', '5'],
      'mount': '/foo',
      'format': 'bar',
      'grub_device': false,
      'os': {
        'long': 'Windows Boot Manager',
        'label': 'Windows',
        'type': 'efi',
        'subpath': '/efi/Microsoft/Boot/bootmgfw.efi',
        'version': '11',
      },
      '\$type': 'Partition',
    };
    expect(partition.toJson(), equals(json));
    expect(Partition.fromJson(json), partition);
  });

  test('gap', () {
    const gap = Gap(offset: 123, size: 456);
    const json = <String, dynamic>{
      'offset': 123,
      'size': 456,
      '\$type': 'Gap',
    };
    expect(gap.toJson(), equals(json));
    expect(Gap.fromJson(json), gap);
  });

  test('disk', () {
    const p1 = Partition(number: 1);
    const p2 = Partition(number: 2);
    const disk = Disk(
      id: 'test-id',
      label: 'test-label',
      path: '/test/path',
      type: 'test-type',
      size: 123,
      usageLabels: ['test', 'usage', 'label'],
      objects: [p1, p2],
      freeForPartitions: 456,
      okForGuided: true,
      ptable: 'tst',
      preserve: true,
      bootDevice: true,
      model: 'QEMU',
      vendor: 'ATA',
    );

    final json = <String, dynamic>{
      'id': 'test-id',
      'label': 'test-label',
      'path': '/test/path',
      'type': 'test-type',
      'size': 123,
      'usage_labels': ['test', 'usage', 'label'],
      'partitions': [
        p1.toJson(),
        p2.toJson(),
      ],
      'free_for_partitions': 456,
      'ok_for_guided': true,
      'ptable': 'tst',
      'preserve': true,
      'boot_device': true,
      'model': 'QEMU',
      'vendor': 'ATA',
    };

    expect(disk.toJson(), equals(json));
    expect(Disk.fromJson(json), disk);
  });

  test('guided choice', () {
    const choice = GuidedChoice(
      diskId: '0',
      useLvm: true,
      password: '2',
    );
    const json = <String, dynamic>{
      'disk_id': '0',
      'use_lvm': true,
      'password': '2',
    };
    expect(choice.toJson(), equals(json));
    expect(GuidedChoice.fromJson(json), choice);
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
      automountEnabled: true,
      automountMountfstab: true,
      interopEnabled: true,
      interopAppendwindowspath: true,
      systemdEnabled: false,
    );
    const json = <String, dynamic>{
      'automount_enabled': true,
      'automount_mountfstab': true,
      'interop_enabled': true,
      'interop_appendwindowspath': true,
      'systemd_enabled': false,
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
