import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_model.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_page.dart';

import 'test_welcome.mocks.dart';
export '../test_utils.dart';
export 'test_welcome.mocks.dart';

const kTestReleastNoteUrl = 'https://wiki.ubuntu.com/foo/ReleaseNotes';

@GenerateMocks([WelcomeModel])
WelcomeModel buildWelcomeModel({bool? isConnected, Option? option}) {
  final model = MockWelcomeModel();
  when(model.isConnected).thenReturn(isConnected ?? false);
  when(model.option).thenReturn(option ?? Option.none);
  when(model.releaseNotesURL(any)).thenReturn(kTestReleastNoteUrl);
  return model;
}

Widget buildWelcomePage(WelcomeModel model) {
  return ProviderScope(
    overrides: [
      welcomeModelProvider.overrideWith((_) => model),
    ],
    child: const WelcomePage(),
  );
}
