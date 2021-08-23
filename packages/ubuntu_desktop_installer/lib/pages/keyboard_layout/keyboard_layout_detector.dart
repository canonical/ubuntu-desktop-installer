import 'dart:convert';

/// Detects keyboard layout according to the steps defined in
/// `/usr/share/console-setup/pc105.tree`.
class KeyboardLayoutDetector {
  /// Creates a keyboard layout detector with the given steps.
  KeyboardLayoutDetector(this._steps);

  /// Create a keyboard layout detector from the given data.
  factory KeyboardLayoutDetector.fromData(String data) {
    final steps = _foldSteps(LineSplitter.split(data));
    return KeyboardLayoutDetector(_parseSteps(steps));
  }

  final Map<int, KeyboardLayoutStep> _steps;

  /// Returns the step for the given number or null if not found.
  KeyboardLayoutStep? step(int number) => _steps[number];

  // Folds a flat list of lines into a list of lines for each step.
  static List<List<String>> _foldSteps(Iterable<String> lines) {
    return lines.fold<List<List<String>>>([], (steps, line) {
      if (line.startsWith('STEP ')) {
        steps.add(<String>[line]);
      } else {
        assert(steps.isNotEmpty);
        steps.last.add(line);
      }
      return steps;
    });
  }

  // Parses steps from the given list of lines for each step.
  static Map<int, KeyboardLayoutStep> _parseSteps(List<List<String>> lines) {
    final steps = <int, KeyboardLayoutStep>{};
    for (final step in lines) {
      assert(lines.length >= 2);
      final number = int.parse(step.removeAt(0).split(' ').last);
      final type = step.first.split(' ').first;
      switch (type) {
        case 'PRESS':
          steps[number] = PressKeyStep.parse(number, step);
          break;
        case 'FIND':
        case 'FINDP':
          steps[number] = FindKeyStep.parse(number, step);
          break;
        case 'MAP':
          steps[number] = KeymapResultStep.parse(number, step);
          break;
        default:
          throw UnimplementedError(type);
      }
    }
    return steps;
  }
}

/// The base class of keyboard layout detection steps.
abstract class KeyboardLayoutStep {
  /// Creates a keyboard layout detection step.
  KeyboardLayoutStep(this.number);

  /// The number of this step.
  final int number;

  /// Returns the next step.
  int? next();
}

/// Ask the user to press a key on the keyboard.
class PressKeyStep extends KeyboardLayoutStep {
  /// Creates a key press step.
  PressKeyStep(
    int number, {
    required this.keys,
    required this.steps,
  }) : super(number);

  /// The list of keys that the user must press.
  final List<String> keys;

  /// The steps to take after the user has pressed the key.
  final Map<int, int> steps;

  /// The keycode user pressed;
  late int _keycode;

  // FIXME need to account for possible remapping. Find the API to translate
  // kernel keycodes to X keycodes (xkb).
  // MIN_KEYCODE = 8
  static const _kMinKeycode = 8;

  /// The user pressed a key.
  void press(int keycode) => _keycode = keycode - _kMinKeycode;

  @override
  int? next() => steps[_keycode];

  /// Parses a key press step from the given lines.
  static KeyboardLayoutStep parse(int number, List<String> lines) {
    final keys = <String>[];
    final steps = <int, int>{};

    while (lines.isNotEmpty) {
      final tokens = lines.removeAt(0).split(' ');
      switch (tokens.first) {
        case 'PRESS': // PRESS <symbol>
          // Ask the user to press a character on the keyboard.
          assert(tokens.length == 2);
          keys.add(tokens.last);
          break;
        case 'CODE': // CODE <keycode> <step>
          // Direct the evaluating code to process step ## next if the
          // user has pressed a key which returned that keycode.
          assert(tokens.length == 3);
          final keycode = int.parse(tokens[1]);
          final step = int.parse(tokens[2]);
          steps[keycode] = step;
          break;
        default:
          throw UnimplementedError(tokens.first);
      }
    }
    return PressKeyStep(number, keys: keys, steps: steps);
  }
}

/// Ask the user whether a character is present on their keyboard.
class FindKeyStep extends KeyboardLayoutStep {
  /// Creates a step for finding a key.
  FindKeyStep(
    int number, {
    required this.key,
    required int found,
    required int notFound,
  })  : _found = found,
        _notFound = notFound,
        super(number);

  /// The key that the user must press.
  final String key;

  late bool _wasFound;
  final int _found;
  final int _notFound;

  /// The user found the key.
  void found() => _wasFound = true;

  /// The user did not find the key.
  void notFound() => _wasFound = false;

  @override
  int? next() => _wasFound ? _found : _notFound;

  /// Parses a find key step from the given lines.
  static KeyboardLayoutStep parse(int number, List<String> lines) {
    String? key;
    int? found;
    int? notFound;

    while (lines.isNotEmpty) {
      final tokens = lines.removeAt(0).split(' ');
      switch (tokens.first) {
        case 'FIND': // FIND <key>
          // Direct the evaluating code to process step ## next if the
          // user has pressed a key which returned that keycode.
          assert(tokens.length == 2);
          key = tokens[1];
          break;
        case 'FINDP': // FINDP <key>
          // Equivalent to FIND, except that the user is asked to consider
          // only the primary symbols (i.e. Plain and Shift).
          assert(tokens.length == 2);
          key = tokens[1];
          break;
        case 'YES':
          // Direct the evaluating code to process step ## next if the
          // user does have this key.
          assert(tokens.length == 2);
          found = int.parse(tokens[1]);
          break;
        case 'NO':
          // Direct the evaluating code to process step ## next if the
          // user does not have this key.
          assert(tokens.length == 2);
          notFound = int.parse(tokens[1]);
          break;
        default:
          throw UnimplementedError(tokens.first);
      }
    }
    return FindKeyStep(number, key: key!, found: found!, notFound: notFound!);
  }
}

/// This step uniquely identifies a keymap.
class KeymapResultStep extends KeyboardLayoutStep {
  /// Creates a keymap result step.
  KeymapResultStep(int number, {required this.keymap}) : super(number);

  /// The keymap result.
  final String keymap;

  @override
  int? next() => null;

  /// Parses a key result step from the given lines.
  static KeyboardLayoutStep parse(int number, List<String> lines) {
    String? keymap;

    while (lines.isNotEmpty) {
      final tokens = lines.removeAt(0).split(' ');
      switch (tokens.first) {
        case 'MAP': // MAP <keymap>
          // This step uniquely identifies a keymap.
          assert(tokens.length == 2);
          keymap = tokens[1];
          break;
        default:
          throw UnimplementedError(tokens.first);
      }
    }
    return KeymapResultStep(number, keymap: keymap!);
  }
}
