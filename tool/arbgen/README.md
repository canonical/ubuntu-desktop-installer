# ARB generator

Generates Flutter ARB files from `languagelist` and PO files.

## Dependencies

Get Dart package dependencies:

```bash
$ cd tool/arbgen
$ dart pub get
```

## Language files

Generate `ubuntu_*.arb` from a [`languagelist`](https://git.launchpad.net/ubiquity/tree/d-i/source/localechooser/languagelist) file:

```bash
$ dart run bin/arbgen.dart /path/to/languagelist \
    --prefix ubuntu \
    --output ../../packages/ubuntu_wizard/lib/src/l10n
```

## Translation files

Generate `app_*.arb` from a directory of [PO files](https://git.launchpad.net/ubiquity/tree/debian/real-po).

```bash
$ dart run bin/arbgen.dart /path/to/po/directory \
    --output ../../packages/ubuntu_desktop_installer/lib/l10n
```

**NOTES**:
- The command can be repeated for multiple input directories.
- The output directory must contain `app_en.arb` for the generator to be able to match PO and ARB translation entries.
