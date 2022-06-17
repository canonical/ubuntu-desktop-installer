@TestOn('windows')
// The tests below require a Windows host with WSL 2 enabled and some Linux
// distribution already installed (by default Ubuntu-22.04 but can be overriden
// by a --dart-define=DISTRONAME=<your-distro-name>)

import 'dart:io';

import 'package:subiquity_client/subiquity_server.dart';
import 'package:test/test.dart';

void main() {
  const distroName = String.fromEnvironment(
    'DISTRONAME',
    defaultValue: 'Ubuntu-22.04',
  );

  group('run in WSL:', () {
    test('Linux exit code is process.exitCode', () async {
      const foo = '42';
      final process = SubiquityProcess.wsl(
        distroName,
        'bash',
        args: ['-c', 'exit $foo'],
      );
      await process.start();
      addTearDown(process.stop);
      expect(await process.exitCode, int.parse(foo));
    });

    test('share env vars', () async {
      const foo = '42';
      // This environment is on the host side.
      final env = {'TEST_VAR': foo};
      final process = SubiquityProcess.wsl(
        distroName,
        'bash',
        // This must exit $foo if the env var is correcly passed.
        args: ['-c', 'exit \$TEST_VAR'],
        env: env,
        // This exposes TEST_VAR to the WSL instance.
        wslenv: 'TEST_VAR',
      );
      await process.start();
      addTearDown(process.stop);
      expect(await process.exitCode, int.parse(foo));
    });

    test('late passing env vars', () async {
      const foo = '42';
      // This environment is on the host side.
      final env = {'TEST_VAR': foo};
      final process = SubiquityProcess.wsl(
        distroName,
        'bash',
        // This must exit $foo if the env var is correcly passed.
        args: ['-c', 'exit \$TEST_VAR'],
        // This exposes TEST_VAR to the WSL instance.
        wslenv: 'TEST_VAR',
      );
      await process.start(additionalEnv: env);
      addTearDown(process.stop);
      expect(await process.exitCode, int.parse(foo));
    });

    test('WSL path translation is respected', () async {
      // This environment is on the host side.
      final env = {'PLACE': Platform.environment['USERPROFILE'] ?? 'C:\\Users'};
      final process = SubiquityProcess.wsl(
        distroName,
        'ls',
        args: ['-l', '\$PLACE', '>', '/dev/null'],
        // If the path was not translated, ls would exit 2.
        wslenv: 'PLACE/p',
      );
      await process.start(additionalEnv: env);
      addTearDown(process.stop);
      expect(await process.exitCode, 0);
    });

    test('as <user>', () async {
      // This environment is on the host side.
      const user = 'root';
      const uid = 0;
      final process = SubiquityProcess.wsl(
        distroName,
        'bash',
        user: user,
        args: ['-c', '[ \$(id -u) -eq $uid ]'],
      );
      await process.start();
      addTearDown(process.stop);
      expect(await process.exitCode, uid);
    });
  });
}
