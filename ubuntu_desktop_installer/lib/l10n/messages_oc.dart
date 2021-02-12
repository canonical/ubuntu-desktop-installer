// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a oc locale. All the
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
  String get localeName => 'oc';

  static String m0(url) =>
      "Per las consignas detalhadas, mercés de dobrir aqueste ligam sus un mobil o un autre aparelh : <a href=\"https://${url}\">${url}</a>";

  static String m1(url) =>
      "Podètz tanben legir las <a href=\"${url}\">nòtas de version</a>.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Continue": MessageLookupByLibrary.simpleMessage("Contunhar"),
        "Go Back": MessageLookupByLibrary.simpleMessage("Tornar"),
        "Install Ubuntu":
            MessageLookupByLibrary.simpleMessage("Installar Ubuntu"),
        "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.":
            MessageLookupByLibrary.simpleMessage(
                "Installar Ubuntu a costat (o a la plaça) de vòstre sistèma operatiu actual. Aquò deuriá pas trigar."),
        "Repair installation":
            MessageLookupByLibrary.simpleMessage("Reparar l’installacion"),
        "Repairing will reinstall all installed software without touching documents or settings.":
            MessageLookupByLibrary.simpleMessage(
                "La reparacion tornarà installar totes los logicials installats en servant los documents e los paramètres."),
        "Restart": MessageLookupByLibrary.simpleMessage("Reaviar"),
        "This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.":
            MessageLookupByLibrary.simpleMessage(
                "Aqueste ordenador utiliza la tecnologia RST (Rapid Storage Technology) d’Intel. Cal desactivar RST jos Windows abans d’installar Ubuntu."),
        "Try Ubuntu": MessageLookupByLibrary.simpleMessage("Ensajar Ubuntu"),
        "Try or install":
            MessageLookupByLibrary.simpleMessage("Ensajar o installar"),
        "Turn off RST": MessageLookupByLibrary.simpleMessage("Desactivar RST"),
        "Ubuntu Desktop Installer": MessageLookupByLibrary.simpleMessage(
            "Programa d’installacion del burèu Ubuntu"),
        "Welcome": MessageLookupByLibrary.simpleMessage("La benvenguda"),
        "You can try Ubuntu without making any changes to your computer.":
            MessageLookupByLibrary.simpleMessage(
                "Podètz ensajar Ubuntu sens aplicar cap de modificacion a vòstre ordenador."),
        "instructions": m0,
        "releaseNotesLabel": m1
      };
}
