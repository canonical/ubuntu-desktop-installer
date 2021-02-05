// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(Object url) =>
      "Pour des instructions détaillées, veuillez ouvrir ce lien sur un téléphone ou un autre appareil : <a href=\"https://$url\">$url</a>";

  static String m1(Object url) =>
      "Vous pouvez éventuellement lire les <a href=\"$url\">notes de publication</a>.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Continue": MessageLookupByLibrary.simpleMessage("Continuer"),
        "Go Back": MessageLookupByLibrary.simpleMessage("Retour"),
        "Install Ubuntu":
            MessageLookupByLibrary.simpleMessage("Installer Ubuntu"),
        "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.":
            MessageLookupByLibrary.simpleMessage(
                "Installer Ubuntu à côté (ou en remplacement) de votre système d’exploitation actuel. Ceci ne devrait pas prendre trop longtemps."),
        "Repair installation":
            MessageLookupByLibrary.simpleMessage("Réparer l’installation"),
        "Repairing will reinstall all installed software without touching documents or settings.":
            MessageLookupByLibrary.simpleMessage(
                "La réparation réinstallera tous les logiciels installés en conservant les documents et les paramètres."),
        "Restart": MessageLookupByLibrary.simpleMessage("Redémarrer"),
        "This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.":
            MessageLookupByLibrary.simpleMessage(
                "Cet ordinateur utilise la technologie RST (Rapid Storage Technology) d’Intel. Il est nécessaire de désactiver RST sous Windows avant d’installer Ubuntu."),
        "Try Ubuntu": MessageLookupByLibrary.simpleMessage("Essayer Ubuntu"),
        "Try or install":
            MessageLookupByLibrary.simpleMessage("Essayer ou installer"),
        "Turn off RST": MessageLookupByLibrary.simpleMessage("Désactiver RST"),
        "Ubuntu Desktop Installer": MessageLookupByLibrary.simpleMessage(
            "Programme d’installation du bureau Ubuntu"),
        "Welcome": MessageLookupByLibrary.simpleMessage("Bienvenue"),
        "You can try Ubuntu without making any changes to your computer.":
            MessageLookupByLibrary.simpleMessage(
                "Vous pouvez essayer Ubuntu sans appliquer aucun changement à votre ordinateur."),
        "instructions": m0,
        "releaseNotesLabel": m1
      };
}
