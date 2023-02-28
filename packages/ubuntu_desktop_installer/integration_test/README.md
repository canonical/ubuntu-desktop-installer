# Integration tests

## Run tests

Run the following command in `packages/ubuntu_desktop_installer`:

```
SUBIQUITY_REPLAY_TIMESCALE=100 flutter test integration_test/
```

## Screenshots

To update screenshots, run:
```
flutter test --update-goldens integration_test/screenshots_test.dart
```
NOTE: Flutter follows the system theme.
