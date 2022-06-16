// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "auth": MessageLookupByLibrary.simpleMessage("Auth"),
        "close": MessageLookupByLibrary.simpleMessage("close"),
        "counter": MessageLookupByLibrary.simpleMessage("Counter"),
        "counter_value": MessageLookupByLibrary.simpleMessage("Counter value"),
        "english": MessageLookupByLibrary.simpleMessage("english"),
        "enter": MessageLookupByLibrary.simpleMessage("enter"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "login": MessageLookupByLibrary.simpleMessage("login"),
        "login_len_worning": MessageLookupByLibrary.simpleMessage(
            "login mast have at least at 3 sign"),
        "pass": MessageLookupByLibrary.simpleMessage("password"),
        "pass_len_worning": MessageLookupByLibrary.simpleMessage(
            "pass mast have at least at 8 sign"),
        "russian": MessageLookupByLibrary.simpleMessage("Russian"),
        "try_again": MessageLookupByLibrary.simpleMessage("try again")
      };
}
