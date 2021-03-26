![Flutter CI](https://github.com/canonical/ubuntu-desktop-installer/workflows/Flutter%20CI/badge.svg)

# ubuntu-desktop-installer

## Checkout & Run

Grab the source:
```
git clone https://github.com/canonical/ubuntu-desktop-installer.git
cd ubuntu-desktop-installer
git submodule update --init --recursive
```

Install and configure Flutter:
```
snap install flutter --classic
flutter channel dev
flutter upgrade 
flutter config --enable-linux-desktop
```

Install dependencies:
```
cd subiquity_client
flutter pub get
cd subiquity
make install_deps
cd ../../ubuntu_desktop_installer
flutter pub get
```

Run:
```
flutter run
```

## Translations

Translations for the Ubuntu desktop installer are managed with [Flutter's tools for internationalization](https://flutter.dev/docs/development/accessibility-and-localization/internationalization).

The template containing all the messages to be translated lives in `lib/l10n/app_en.arb`. When starting translations for a new language, that file needs to be copied to `lib/l10n/app_LANGCODE.arb` (e.g. `lib/l10n/app_fr.arb`), and messages should be translated in this new file.

When new messages are added in the source code, they also need to be added to the translation template.

## Code Generation

The Subiquity client uses [freezed](https://pub.dev/packages/freezed) and
[json_serializable](https://pub.dev/packages/json_serializable) to generate
immutable classes with JSON serialization support. Adding new types or members
to `subiquity_client/lib/src/types.dart` requires the code to be re-generated:

```
cd subiquity_client
./script/codegen.sh
```
