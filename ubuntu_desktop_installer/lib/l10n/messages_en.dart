// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(Object url) =>
      "For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>";

  static String m1(Object url) =>
      "You may wish to read the <a href=\"$url\">release notes</a>.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "continueButtonText": MessageLookupByLibrary.simpleMessage("Continue"),
        "backButtonText": MessageLookupByLibrary.simpleMessage("Go Back"),
        "installUbuntu":
            MessageLookupByLibrary.simpleMessage("Install Ubuntu"),
        "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.":
            MessageLookupByLibrary.simpleMessage(
                "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long."),
        "repairInstallation":
            MessageLookupByLibrary.simpleMessage("Repair installation"),
        "repairInstallationDescription":
            MessageLookupByLibrary.simpleMessage(
                "Repairing will reinstall all installed software without touching documents or settings."),
        "restartButtonText": MessageLookupByLibrary.simpleMessage("Restart"),
        "turnOffRSTDescription":
            MessageLookupByLibrary.simpleMessage(
                "This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu."),
        "tryUbuntu": MessageLookupByLibrary.simpleMessage("Try Ubuntu"),
        "tryOrInstallPageTitle":
            MessageLookupByLibrary.simpleMessage("Try or install"),
        "turnOffRST": MessageLookupByLibrary.simpleMessage("Turn off RST"),
        "appTitle":
            MessageLookupByLibrary.simpleMessage("Ubuntu Desktop Installer"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
        "tryUbuntuDescription":
            MessageLookupByLibrary.simpleMessage(
                "You can try Ubuntu without making any changes to your computer."),
        "instructions": m0,
        "releaseNotesLabel": m1
      };
}
