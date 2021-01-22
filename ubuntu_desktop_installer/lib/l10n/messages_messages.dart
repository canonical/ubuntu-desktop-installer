// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  static String m0(url) =>
      "For instructions, open this page on a phone or other device: <a href=\"https://${url}\">${url}</a>";

  static String m1(url) =>
      "You may wish to read the <a href=\"${url}\">release notes</a>.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Continue": MessageLookupByLibrary.simpleMessage("Continue"),
        "Go Back": MessageLookupByLibrary.simpleMessage("Go Back"),
        "Install Ubuntu":
            MessageLookupByLibrary.simpleMessage("Install Ubuntu"),
        "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.":
            MessageLookupByLibrary.simpleMessage(
                "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long."),
        "Repair installation":
            MessageLookupByLibrary.simpleMessage("Repair installation"),
        "Repairing will reinstall all installed software without touching documents or settings.":
            MessageLookupByLibrary.simpleMessage(
                "Repairing will reinstall all installed software without touching documents or settings."),
        "Restart": MessageLookupByLibrary.simpleMessage("Restart"),
        "This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.":
            MessageLookupByLibrary.simpleMessage(
                "This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu."),
        "Try Ubuntu": MessageLookupByLibrary.simpleMessage("Try Ubuntu"),
        "Try or install":
            MessageLookupByLibrary.simpleMessage("Try or install"),
        "Turn off RST": MessageLookupByLibrary.simpleMessage("Turn off RST"),
        "Ubuntu Desktop Installer":
            MessageLookupByLibrary.simpleMessage("Ubuntu Desktop Installer"),
        "Welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
        "You can try Ubuntu without making any changes to your computer.":
            MessageLookupByLibrary.simpleMessage(
                "You can try Ubuntu without making any changes to your computer."),
        "instructions": m0,
        "releaseNotesLabel": m1
      };
}
