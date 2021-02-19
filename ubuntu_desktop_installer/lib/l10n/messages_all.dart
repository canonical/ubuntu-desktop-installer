// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_en.dart' deferred as messages_en;
import 'messages_fr.dart' deferred as messages_fr;
import 'messages_it.dart' deferred as messages_it;
import 'messages_messages.dart' deferred as messages_messages;
import 'messages_oc.dart' deferred as messages_oc;
import 'messages_pt.dart' deferred as messages_pt;

typedef Future<dynamic> LibraryLoader();
final Map<String, LibraryLoader> _deferredLibraries = {
  'en': messages_en.loadLibrary,
  'fr': messages_fr.loadLibrary,
  'it': messages_it.loadLibrary,
  'messages': messages_messages.loadLibrary,
  'oc': messages_oc.loadLibrary,
  'pt': messages_pt.loadLibrary,
};

MessageLookupByLibrary _findExact(String localeName) {
  switch (localeName) {
    case 'en':
      return messages_en.messages;
    case 'fr':
      return messages_fr.messages;
    case 'it':
      return messages_it.messages;
    case 'messages':
      return messages_messages.messages;
    case 'oc':
      return messages_oc.messages;
    case 'pt':
      return messages_pt.messages;
    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  final availableLocale = Intl.verifiedLocale(
      localeName, (locale) => _deferredLibraries[locale] != null,
      onFailure: (_) => null);
  if (availableLocale == null) {
    return Future.value(false);
  }
  final lib = _deferredLibraries[availableLocale];
  await (lib == null ? new Future.value(false) : lib());
  initializeInternalMessageLookup(() => new CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return new Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } on Exception catch (_) {
    return false;
  }
}

MessageLookupByLibrary _findGeneratedMessagesFor(String locale) {
  var actualLocale =
      Intl.verifiedLocale(locale, _messagesExistFor, onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
