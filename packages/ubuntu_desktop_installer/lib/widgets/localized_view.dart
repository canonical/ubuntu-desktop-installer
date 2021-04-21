import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef LocalizedViewBuilder = Widget Function(
    BuildContext context, AppLocalizations lang);

class LocalizedView extends StatelessWidget {
  final LocalizedViewBuilder builder;

  LocalizedView({@required this.builder});

  @override
  Widget build(BuildContext context) =>
      builder(context, AppLocalizations.of(context));
}
