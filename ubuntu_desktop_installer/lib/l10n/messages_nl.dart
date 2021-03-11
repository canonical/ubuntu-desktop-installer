// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nl locale. All the
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
  String get localeName => 'nl';

  static String m0(url) =>
      "Voor instructies, open de volgende website op uw telefoon of op een ander apparaat; <a href=\"https://${url}\">${url}</a>";

  static String m1(url) =>
      "De wijzigingen in deze uitgave kunt U <a href=\"${url}\">hier, in het Engels, lezen</a>.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Choose your keyboard layout:": MessageLookupByLibrary.simpleMessage(
            "Kies uw toetsenbordindeling:"),
        "Continue": MessageLookupByLibrary.simpleMessage("Volgende"),
        "Detect Keyboard Layout":
            MessageLookupByLibrary.simpleMessage("Toetsenbordindeling bepalen"),
        "Go Back": MessageLookupByLibrary.simpleMessage("Terug"),
        "Install Ubuntu":
            MessageLookupByLibrary.simpleMessage("Ubuntu installeren"),
        "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.":
            MessageLookupByLibrary.simpleMessage(
                "Installeer Ubuntu naast (of in plaats van) het huidige besturingssysteem, dit zal niet lang duren."),
        "Keyboard layout":
            MessageLookupByLibrary.simpleMessage("Toetsenbordindeling"),
        "Repair installation":
            MessageLookupByLibrary.simpleMessage("Repareer de installatie"),
        "Repairing will reinstall all installed software without touching documents or settings.":
            MessageLookupByLibrary.simpleMessage(
                "Reparatie zal opnieuw alles installeren, zonder de bestaande documenten of instellingen aan te passen."),
        "Restart": MessageLookupByLibrary.simpleMessage("Opnieuw opstarten"),
        "This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.":
            MessageLookupByLibrary.simpleMessage(
                "Deze computer maakt gebruik van Intel RST (Rapid Storage Technology). Om Ubuntu te installeren, is het noodzakelijk om dit uit te schakelen."),
        "Try Ubuntu":
            MessageLookupByLibrary.simpleMessage("Ubuntu uitproberen"),
        "Try or install":
            MessageLookupByLibrary.simpleMessage("Uitproberen of installeren"),
        "Turn off RST":
            MessageLookupByLibrary.simpleMessage("RST uitschakelen"),
        "Type here to test your keyboard": MessageLookupByLibrary.simpleMessage(
            "Type hieronder om het toetsenbord te testen"),
        "Ubuntu Desktop Installer": MessageLookupByLibrary.simpleMessage(
            "Ubuntu Desktop instalatie programma"),
        "Welcome": MessageLookupByLibrary.simpleMessage("Welkom"),
        "You can try Ubuntu without making any changes to your computer.":
            MessageLookupByLibrary.simpleMessage(
                "U kunt Ubuntu uitproberen, zonder dat er aanpassingen op de bestaande installatie wordt gemaakt."),
        "instructions": m0,
        "releaseNotesLabel": m1
      };
}
