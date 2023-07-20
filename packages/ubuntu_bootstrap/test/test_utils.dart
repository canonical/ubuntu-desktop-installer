import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/services.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru/yaru.dart';

export '../../ubuntu_provision/test/test_utils.mocks.dart';
export 'test_utils.mocks.dart';

extension InstallerTester on WidgetTester {
  Widget buildApp(WidgetBuilder builder) {
    view.devicePixelRatio = 1;
    view.physicalSize = const Size(960, 680);
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      theme: yaruLight,
      home: Wizard(
        routes: {
          '/': WizardRoute(
            builder: builder,
            onNext: (settings) => '/next',
          ),
          '/next': WizardRoute(
            builder: (_) => const Text('Next page'),
          ),
        },
      ),
    );
  }
}

@GenerateMocks([
  InstallerService,
  PostInstallService,
  ProductService,
  StorageService,
])
class _Dummy {} // ignore: unused_element
