![Flutter CI](https://github.com/canonical/ubuntu-desktop-installer/workflows/Flutter%20CI/badge.svg)

# ubuntu-desktop-installer

## Translations

Translations for the Ubuntu desktop installer are managed with [the Dart `intl` tools](https://flutter.dev/docs/development/accessibility-and-localization/internationalization#dart-tools).

The template containing all the messages to be translated lives in `lib/l10n/intl_messages.arb`. When starting translations for a new language, that file needs to be copied to `lib/l10n/intl_LANGCODE.arb` (e.g. `lib/l10n/intl_fr.arb`), and messages should be translated in this new file.
The Dart `intl` tools are then used to generate the corresponding `lib/l10n/messages_LANGCODE.dart` file.

After adding new messages or modifying existing ones in the source code, the translation template needs to be regenerated:

    flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/*.dart

Translations for individual languages need to be updated manually.

After updating one or more message catalogs, the corresponding dart files need to be regenerated:

    flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n lib/*.dart lib/l10n/intl_*.arb

Note that at the time of writing, [a known issue in Dart `intl` tools](https://github.com/dart-lang/intl_translation/issues/99) results in generated code not passing the code analysis with the pedantic option. As a workaround, `messages_*.dart` files need to be hand-edited to add a `Map<String, Function>` return type to the `_notInlinedMessages()` function.