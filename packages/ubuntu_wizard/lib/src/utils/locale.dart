import 'package:flutter/widgets.dart';

class InheritedLocale extends InheritedNotifier<ValueNotifier<Locale>> {
  InheritedLocale({super.key, required super.child, Locale? value})
      : super(notifier: ValueNotifier(value ?? _defaultLocale));

  static Locale get _defaultLocale =>
      WidgetsBinding.instance.platformDispatcher.locale;

  static Locale of(BuildContext context) {
    return _getNotifier(context).value;
  }

  static void apply(BuildContext context, Locale locale) {
    _getNotifier(context).value = locale;
  }

  static ValueNotifier<Locale> _getNotifier(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedLocale>()!
        .notifier!;
  }
}
