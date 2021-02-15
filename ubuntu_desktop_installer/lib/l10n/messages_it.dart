// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  static String m0(Object url) =>
      "Per istruzioni, apri questa pagina da un telefono o un altro dispositivo: <a href=\"https://${url}\">${url}</a>";

  static String m1(Object url) =>
      "Forse vorresti leggere le <a href=\"${url}\">informazioni di rilascio</a>.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "continueButtonText": MessageLookupByLibrary.simpleMessage("Continua"),
        "backButtonText": MessageLookupByLibrary.simpleMessage("Torna indietro"),
        "installUbuntu":
            MessageLookupByLibrary.simpleMessage("Installa Ubuntu"),
        "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.":
            MessageLookupByLibrary.simpleMessage(
                "Installa Ubuntu accanto (o al posto di) al tuo sistema operativo attuale. Questo non dovrebbe durare molto."),
        "repairInstallation":
            MessageLookupByLibrary.simpleMessage("Ripara installazione"),
        "repairInstallationDescription":
            MessageLookupByLibrary.simpleMessage(
                "La riparazione reinstallerá tutti i programmi senza toccare alcun documento o impostazione."),
        "restartButtonText": MessageLookupByLibrary.simpleMessage("Riavvia"),
        "turnOffRSTDescription":
            MessageLookupByLibrary.simpleMessage(
                "Questo computer usa Intel RST (Rapid Storage Technology). Devi disattivare RST da Windows prima di poter installare Ubuntu."),
        "tryUbuntu": MessageLookupByLibrary.simpleMessage("Prova Ubuntu"),
        "tryOrInstallPageTitle":
            MessageLookupByLibrary.simpleMessage("Prova o installa"),
        "turnOffRST": MessageLookupByLibrary.simpleMessage("Disattiva RST"),
        "appTitle":
            MessageLookupByLibrary.simpleMessage("Installer di Ubuntu Desktop"),
        "welcome": MessageLookupByLibrary.simpleMessage("Benvenuto"),
        "tryUbuntuDescription":
            MessageLookupByLibrary.simpleMessage(
                "Puoi provare Ubuntu senza apportare alcuna modifica al tuo computer."),
        "instructions": m0,
        "releaseNotesLabel": m1
      };
}
