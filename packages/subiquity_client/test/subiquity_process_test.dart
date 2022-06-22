import 'package:subiquity_client/subiquity_server.dart';
import 'package:test/test.dart';

// Test only the command line composition. Obviously starting a process here
// Would require the underlying execution platform, which makes the test suite
// inherently not cross platform.
void main() {
  const pymodule = 'pytest';
  const distro = 'Ubuntu';
  const variable = 'TMPDIR/p';
  const user = 'ubuntu';
  const dryRunFlag = '--dry-run';
  const command = 'whoami';

  group('Python factory', () {
    test('<pymodule> is a python arg', () async {
      final process = SubiquityProcess.python(pymodule);
      // The actual command has to be wsl.exe
      expect(process.args.contains(pymodule), isTrue);
    });

    test('SNAP related is added in DRY_RUN', () async {
      final process = SubiquityProcess.python(
        pymodule,
        serverMode: ServerMode.DRY_RUN,
      );
      expect(process.environment?['SNAP_NAME'], isNotNull);
    });

    test('DRY_RUN cli flag', () async {
      final process = SubiquityProcess.python(
        pymodule,
        serverMode: ServerMode.DRY_RUN,
      );
      expect(process.args.contains(dryRunFlag), isTrue);
    });
  });
  group('WSL factory', () {
    // Test only the command line composition. Obviously starting a process here
    // Would require Windows and WSL, which makes the test not cross platform.
    test('<distroName> and <commands> are wsl.exe args', () async {
      final process = SubiquityProcess.wsl(distro, command);
      // The actual command has to be wsl.exe
      expect(process.args.contains(distro), isTrue);
      expect(process.args.contains(command), isTrue);
    });

    test('<user> is also part of wsl.exe args', () async {
      final process = SubiquityProcess.wsl(distro, command, user: user);
      expect(process.args.contains(user), isTrue);
    });

    test('WSLENV is :\$appended', () async {
      // This ensures we are not overriding any preexisting variable share.
      final process = SubiquityProcess.wsl(distro, command, wslenv: variable);
      expect(process.environment!['WSLENV']!.endsWith(':$variable'), isTrue);
    });

    test('DRY_RUN cli flag', () async {
      final process = SubiquityProcess.wsl(
        distro,
        command,
        serverMode: ServerMode.DRY_RUN,
      );
      expect(process.args.contains(dryRunFlag), isTrue);
    });
  });
}
