# glibc FFI bindings

## Usage

```dart
import 'package:glibc/glibc.dart';

void main() {
  if (geteuid() == 0) {
    print('WARNING: running as root');
  }

  final info = sysinfo();
  print('Uptime: ${info.uptime}');
  print('Load average: ${info.loads[0] / (1 << SI_LOAD_SHIFT)}');
}
```

## Contributing

1. Add new headers, functions, structs etc. to `ffigen.yaml`
2. Run `dart pub global run ffigen --config ffigen.yaml` to regenerate bindings
3. Implement `lib/src/foo.dart` and export it in `lib/glibc.dart`
