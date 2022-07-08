import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wsl_setup/services/named_event.dart';

void main() {
  const methodChannel = MethodChannel(NamedEventConstants.channel);
  final messenger =
      TestWidgetsFlutterBinding.ensureInitialized().defaultBinaryMessenger;

  test('cannot listen twice', () async {
    const name = 'event';
    messenger.setMockMethodCallHandler(methodChannel, (call) async {
      if (call.method == NamedEventConstants.addListenerFor) {}
      return null;
    });

    expect(() {
      // ignore: unused_local_variable
      final event1 = NamedEvent(name);
      // ignore: unused_local_variable
      final event2 = NamedEvent(name);
    }, throwsArgumentError);
  });

  test('completion', () async {
    const name = 'completion';
    messenger.setMockMethodCallHandler(methodChannel, (call) async {
      if (call.method == NamedEventConstants.addListenerFor) {}
      return null;
    });
    const call = MethodCall(NamedEventConstants.onEventSet, name);

    final event = NamedEvent(name);
    await messenger.handlePlatformMessage(
      NamedEventConstants.channel,
      const StandardMethodCodec().encodeMethodCall(call),
      (_) {},
    );

    expectLater(event.future, completes);
  });
}
