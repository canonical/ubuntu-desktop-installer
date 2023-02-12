# Contributing

## Code of Conduct

This project is subject to the [Ubuntu Code of Conduct](https://ubuntu.com/community/code-of-conduct) to foster an open and welcoming place to contribute.
By participating in the project (in the form of code contributions, issues, comments, and other activities), you agree to abide by its terms.

## Pull requests

Changes to this project should be proposed as pull requests on GitHub at: <https://github.com/canonical/ubuntu-desktop-installer>.

## Contributor License Agreement

This project is subject to the [Canonical contributor license agreement](https://ubuntu.com/legal/contributors), please make sure you have [signed it](https://ubuntu.com/legal/contributors/agreement) before (or shortly after) submitting your first pull request.

## Specifications

UI and UX specifications are published as [GitHub issues](https://github.com/canonical/ubuntu-desktop-installer/issues?q=is%3Aissue+label%3Aspecification+sort%3Acreated-asc).
Any specification issue without an assignee is up for grabs, if you start work on one of them please make sure to comment on the issue to say so, a project administrator will assign it to you.

## Bugs

Bugs are also tracked as [GitHub issues](https://github.com/canonical/ubuntu-desktop-installer/issues?q=is%3Aissue+label%3Abug).

## Translations

Translations are managed using [Weblate](https://hosted.weblate.org/projects/ubuntu-desktop-installer/).
This project has the following translation components:

- [ubuntu-desktop-installer](https://hosted.weblate.org/projects/ubuntu-desktop-installer/ubuntu-desktop-installer/):
  The main translation component of the Ubuntu Desktop Installer.
- [ubuntu-localizations](https://hosted.weblate.org/projects/ubuntu-desktop-installer/ubuntu-localizations/):
  Common translations and language names shared with other projects.
- [ubiquity](https://hosted.weblate.org/projects/ubuntu-desktop-installer/ubiquity/):
  A read-only glossary imported from Ubiquity.

When translating the **ubuntu-desktop-installer** and **ubuntu-localizations** components,
matching **ubiquity** translations are suggested in the _Automatic suggestions_ tab below,
and matching terms are offered in the _Glossary_ sidebar of the translation editor.

**NOTE**: The Weblate project is integrated with the GitHub project. Weblate pushes changes daily and
opens a [pull request](https://github.com/canonical/ubuntu-desktop-installer/pulls) on GitHub.

## Internationalization

This project uses [Flutter's tools for internationalization](https://flutter.dev/docs/development/accessibility-and-localization/internationalization).

The templates containing all the messages to be translated live in:
- `packages/ubuntu_desktop_installer/lib/l10n/app_en.arb`
- `packages/ubuntu_wizard/lib/src/l10n/ubuntu_en.arb`
- `packages/ubuntu_wsl_setup/lib/l10n/app_en.arb`

When new messages are added in the source code, they also need to be added to the appropriate translation template, and the translation files need to be re-generated.

You can run either

```
melos run gen-l10n
```
to re-generate translations for all packages, or

```
flutter gen-l10n
```
in a package directory to generate translations for a specific package.

The `ubuntu_en.arb` translation template has one special string (`languageName`) that is used to determine whether that language should be offered to the user on the welcome screen. If a translation isn't complete enough, or of insufficient quality, just make `languageName` an empty string (by default it inherits the value from the English template, so it's not empty), and it won't show up as available in the UI.


## Code Generation

This project uses [freezed](https://pub.dev/packages/freezed) and
[json_serializable](https://pub.dev/packages/json_serializable) to generate
immutable data classes with JSON serialization support. Adding new types or
members to classes annotated with `@freezed` or `@JsonSerializable` requires
the code to be re-generated (see also the Melos section below):

```
melos run generate
```

## Melos

The project provides a [Melos](https://docs.page/invertase/melos) configuration
to make it straightforward to execute certain tasks across the project tree.

Install Melos:
```
dart pub global activate melos
```

Bootstrap the workspace:
```
melos bootstrap
```

Select a task interactively:
```
melos run
```

Run a specific task directly:
```
melos run coverage
```
