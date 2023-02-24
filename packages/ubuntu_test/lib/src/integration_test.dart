import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_server.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'widget_testers.dart';

// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: type=lint

/// The path to the `.subiquity` directory.
Future<String> get subiquityPath async {
  return p.join(
    await getSubiquityPath(),
    '.subiquity',
  );
}

/// ".subiquity/run/subiquity/states/"
Future<String> get statePath async {
  return p.join(await subiquityPath, 'run', 'subiquity', 'states');
}

/// e.g. ".subiquity/run/subiquity/states/Locale"
Future<String> stateFile(String fileName) async {
  return p.join(await statePath, p.basename(fileName));
}

/// ".subiquity/etc/"
Future<String> get configPath async {
  return p.join(await subiquityPath, 'etc');
}

/// e.g. ".subiquity/etc/wsl.conf"
Future<String> configFile(String fileName) async {
  return p.join(await configPath, p.basename(fileName));
}

/// "integration_test/goldens/"
final String goldenPath = p.join('integration_test', 'goldens');

/// e.g. "integration_test/goldens/wsl.conf"
String goldenFile(String fileName) => p.join(goldenPath, fileName);

/// Verifies that a subiquity state file matches a golden file.
///
/// NOTE: Use `flutter test --update-goldens` to update golden files.
Future<void> verifyStateFile(String fileName) async {
  return _verifyGoldenFile(await stateFile(fileName), fileName);
}

/// Verifies that a subiquity config file matches a golden file.
///
/// NOTE: Use `flutter test --update-goldens` to update golden files.
Future<void> verifyConfigFile(String fileName) async {
  return _verifyGoldenFile(await configFile(fileName), fileName);
}

/// Waits until the specified file has been written on the disk, as in, it
/// exists and is not empty.
Future<void> waitForFile(
  String fileName, [
  Duration limit = const Duration(seconds: 10),
]) async {
  assert(limit.inMilliseconds >= 250);
  final delay = Duration(milliseconds: 250);

  await Future.doWhile(() {
    return Future.delayed(delay).then((_) {
      final file = File(fileName);
      return !file.existsSync() || file.statSync().size <= 0;
    });
  }).timeout(
    limit,
    onTimeout: () => debugPrint(
        '\nWARNING: A call to waitForFile() with file "$fileName" did not complete within the specified time limit $limit.\n${StackTrace.current}'),
  );

  expect(File(fileName).existsSync(), isTrue);
}

Future<void> _verifyGoldenFile(String fileName, String goldenName) async {
  await waitForFile(fileName);

  // https://api.flutter.dev/flutter/flutter_test/autoUpdateGoldenFiles.html
  if (autoUpdateGoldenFiles) {
    File(fileName).copySync(goldenFile(goldenName));
  }

  expect(
    File(fileName).readAsStringSync().trim(),
    equals(File(goldenFile(goldenName)).readAsStringSync().trim()),
    reason: '$configPath/$fileName does not match $goldenName',
  );
}

/// Cleans up the .subiquity directory to ensure a clean test environment for
/// integration test cases.
Future<void> cleanUpSubiquity() async {
  // Ignore errors because the directory may not exist.
  try {
    Directory(await subiquityPath).deleteSync(recursive: true);
  } on FileSystemException catch (_) {}
}

/// Waits for the application window to be closed, to allow an integration test
/// to proceed to the next test case.
Future<bool> waitForWindowClosed() {
  final completer = Completer<bool>();
  final methodChannel = MethodChannel('yaru_window');
  methodChannel.setMockMethodCallHandler((call) async {
    switch (call.method) {
      case 'close':
        await _testCloseWindow();
        completer.complete(true);
        break;
    }
  });
  return completer.future;
}

// Sends a platform message to simulate the window being closed, to trigger the
// application exit routine.
Future<void> _testCloseWindow() async {
  final call = MethodCall('onClose');
  await ServicesBinding.instance.defaultBinaryMessenger.handlePlatformMessage(
    'yaru_window',
    StandardMethodCodec().encodeMethodCall(call),
    (_) {},
  );
}

/// Helpers for interacting with widgets.
extension IntegrationTester on WidgetTester {
  /// Taps a "Go Back" button.
  Future<void> tapBack() => tapButton(ulang.backAction);

  /// Taps a "Continue" button.
  Future<void> tapContinue() => tapButton(ulang.continueAction);

  /// Taps a button specified by its [label]. The button can be any
  /// [ButtonStyleButton] subclass, such as [OutlinedButton], [ElevatedButton],
  /// or [FilledButton].
  Future<void> tapButton(String label) async {
    await tap(find.ancestor(
      of: find.text(label),
      matching: find.bySubtype<ButtonStyleButton>(),
    ));
    await pump();
  }

  /// Enters a text [value] into a form field specified by its [label], or does
  /// nothing if [value] is `null`.
  Future<void> enterTextValue({
    required String label,
    required String? value,
  }) async {
    if (value == null) return;
    await enterText(find.widgetWithText(TextField, label), value);
    await pump();
  }

  /// Toggles a checkbox specified by its [label] to ensure the given [value],
  /// or does nothing if [value] is `null`.
  Future<void> toggleCheckbox({
    required String label,
    required bool? value,
  }) async {
    if (value == null) return;
    final checkbox = find.widgetWithText(YaruCheckButton, label);
    if (widget<YaruCheckButton>(checkbox).value != value) {
      await tap(checkbox);
      await pump();
    }
  }

  /// Taps a radio button specified by its [value].
  Future<void> tapRadioButton<T>(T value) async {
    await tap(find.byWidgetPredicate((widget) {
      return widget is YaruRadioButton<T> && widget.value == value;
    }));
    await pump();
  }

  /// Pumps until the specified [finder] is satisfied. This can be used to wait
  /// until a certain page or widget becomes visible.
  Future<void> pumpUntil(
    Finder finder, [
    Duration timeout = const Duration(seconds: 10),
  ]) async {
    assert(timeout.inMilliseconds >= 250);
    final delay = Duration(milliseconds: 250);

    if (any(finder)) return;

    return Future.doWhile(() async {
      if (any(finder)) return false;
      await pump(delay);
      return true;
    }).timeout(
      timeout,
      onTimeout: () => debugPrint(
          '\nWARNING: A call to pumpUntil() with finder "$finder" did not complete within the specified timeout $timeout.\n${StackTrace.current}'),
    );
  }
}
