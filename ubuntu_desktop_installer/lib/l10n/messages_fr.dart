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
        "continueButtonText": MessageLookupByLibrary.simpleMessage("Continuer"),
        "backButtonText": MessageLookupByLibrary.simpleMessage("Retour"),
        "installUbuntu":
            MessageLookupByLibrary.simpleMessage("Installer Ubuntu"),
        "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.":
            MessageLookupByLibrary.simpleMessage(
                "Installer Ubuntu à côté (ou en remplacement) de votre système d’exploitation actuel. Ceci ne devrait pas prendre trop longtemps."),
        "repairInstallation":
            MessageLookupByLibrary.simpleMessage("Réparer l’installation"),
        "repairInstallationDescription":
            MessageLookupByLibrary.simpleMessage(
                "La réparation réinstallera tous les logiciels installés en conservant les documents et les paramètres."),
        "restartButtonText": MessageLookupByLibrary.simpleMessage("Redémarrer"),
        "turnOffRSTDescription":
            MessageLookupByLibrary.simpleMessage(
                "Cet ordinateur utilise la technologie RST (Rapid Storage Technology) d’Intel. Il est nécessaire de désactiver RST sous Windows avant d’installer Ubuntu."),
        "tryUbuntu": MessageLookupByLibrary.simpleMessage("Essayer Ubuntu"),
        "tryOrInstallPageTitle":
            MessageLookupByLibrary.simpleMessage("Essayer ou installer"),
        "turnOffRST": MessageLookupByLibrary.simpleMessage("Désactiver RST"),
        "appTitle": MessageLookupByLibrary.simpleMessage(
            "Programme d’installation du bureau Ubuntu"),
        "welcome": MessageLookupByLibrary.simpleMessage("Bienvenue"),
        "tryUbuntuDescription":
            MessageLookupByLibrary.simpleMessage(
                "Vous pouvez essayer Ubuntu sans appliquer aucun changement à votre ordinateur."),
        "instructions": m0,
        "releaseNotesLabel": m1
      };
}
