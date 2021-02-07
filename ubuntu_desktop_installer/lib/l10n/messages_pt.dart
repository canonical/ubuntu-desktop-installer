// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static String m0(Object url) =>
      "Abra esta página em um celular ou outro dispositivo para encontrar instruções: <a href=\"https://${url}\">${url}</a>";

  static String m1(Object url) =>
      "Talvez você queira ler as <a href=\"${url}\">notas de lançamento</a>.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "Continue" : MessageLookupByLibrary.simpleMessage("Continuar"),
    "Go Back" : MessageLookupByLibrary.simpleMessage("Voltar"),
    "Install Ubuntu" : MessageLookupByLibrary.simpleMessage("Instalar o Ubuntu"),
    "Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long." : MessageLookupByLibrary.simpleMessage("Instalar o Ubuntu ao lado do (ou em substituição ao) seu sistema operacional atual. Isto não deve demorar muito."),
    "Repair installation" : MessageLookupByLibrary.simpleMessage("Reparar instalação"),
    "Repairing will reinstall all installed software without touching documents or settings." : MessageLookupByLibrary.simpleMessage("A reparação reinstalará todos os softwares instalados sem alterar documentos ou configurações."),
    "Restart" : MessageLookupByLibrary.simpleMessage("Reiniciar"),
    "This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu." : MessageLookupByLibrary.simpleMessage("Este computador usa Intel RST (Rapid Storage Technology). Você precisa desligar a RST no Windows antes de instalar o Ubuntu."),
    "Try Ubuntu" : MessageLookupByLibrary.simpleMessage("Experimentar o Ubuntu"),
    "Try or install" : MessageLookupByLibrary.simpleMessage("Experimentar ou instalar"),
    "Turn off RST" : MessageLookupByLibrary.simpleMessage("Desligue a RST"),
    "Ubuntu Desktop Installer" : MessageLookupByLibrary.simpleMessage("Instalador do Ubuntu Desktop"),
    "Welcome" : MessageLookupByLibrary.simpleMessage("Bem-vindo"),
    "You can try Ubuntu without making any changes to your computer." : MessageLookupByLibrary.simpleMessage("Você pode experimentar o Ubuntu sem fazer nenhuma alteração no seu computador."),
    "instructions" : m0,
    "releaseNotesLabel" : m1
  };
}
