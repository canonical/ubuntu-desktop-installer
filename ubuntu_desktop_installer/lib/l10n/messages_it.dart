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
        "Continue": MessageLookupByLibrary.simpleMessage("Continua"),
        "Go Back": MessageLookupByLibrary.simpleMessage("Torna indietro"),
        "Install Ubuntu":
            MessageLookupByLibrary.simpleMessage("Installa Ubuntu"),
        "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.":
            MessageLookupByLibrary.simpleMessage(
                "Installa Ubuntu accanto (o al posto di) al tuo sistema operativo attuale. Questo non dovrebbe durare molto."),
        "Repair installation":
            MessageLookupByLibrary.simpleMessage("Ripara installazione"),
        "Repairing will reinstall all installed software without touching documents or settings.":
            MessageLookupByLibrary.simpleMessage(
                "La riparazione reinstallerá tutti i programmi senza toccare alcun documento o impostazione."),
        "Restart": MessageLookupByLibrary.simpleMessage("Riavvia"),
        "This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.":
            MessageLookupByLibrary.simpleMessage(
                "Questo computer usa Intel RST (Rapid Storage Technology). Devi disattivare RST da Windows prima di poter installare Ubuntu."),
        "Try Ubuntu": MessageLookupByLibrary.simpleMessage("Prova Ubuntu"),
        "Try or install":
            MessageLookupByLibrary.simpleMessage("Prova o installa"),
        "Turn off RST": MessageLookupByLibrary.simpleMessage("Disattiva RST"),
        "Ubuntu Desktop Installer":
            MessageLookupByLibrary.simpleMessage("Installer di Ubuntu Desktop"),
        "Welcome": MessageLookupByLibrary.simpleMessage("Benvenuto"),
        "You can try Ubuntu without making any changes to your computer.":
            MessageLookupByLibrary.simpleMessage(
                "Puoi provare Ubuntu senza apportare alcuna modifica al tuo computer."),
        "instructions": m0,
        "releaseNotesLabel": m1
      };
}
