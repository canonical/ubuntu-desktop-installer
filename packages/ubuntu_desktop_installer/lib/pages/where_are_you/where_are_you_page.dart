import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'where_are_you_model.dart';

/// https://github.com/canonical/ubuntu-desktop-installer/issues/38
class WhereAreYouPage extends StatefulWidget {
  /// Use [WhereAreYouPage.create] instead.
  @visibleForTesting
  const WhereAreYouPage({Key? key}) : super(key: key);

  /// Creates a [WhereAreYouPage] with [WhereAreYouModel].
  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WhereAreYouModel(
        client: getService<SubiquityClient>(),
        service: getService<GeoService>(),
      ),
      child: const WhereAreYouPage(),
    );
  }

  @override
  WhereAreYouPageState createState() => WhereAreYouPageState();
}

@visibleForTesting
class WhereAreYouPageState extends State<WhereAreYouPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<WhereAreYouModel>(context, listen: false);
    model.init();
  }

  String formatLocation(GeoLocation? location) {
    return location?.toDisplayString() ?? '';
  }

  String formatTimezone(GeoLocation? location) {
    return location?.toTimezoneString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WhereAreYouModel>(context);
    final lang = AppLocalizations.of(context);

    return WizardPage(
      title: Text(lang.whereAreYouPageTitle),
      content: Center(
        child: model.isInitialized
            ? Row(
                children: <Widget>[
                  Expanded(
                    child: Autocomplete<GeoLocation>(
                      initialValue: TextEditingValue(
                        text: formatLocation(model.selectedLocation),
                      ),
                      fieldViewBuilder:
                          (context, controller, focusNode, onSubmitted) {
                        if (!focusNode.hasFocus) {
                          controller.text =
                              formatLocation(model.selectedLocation);
                        }
                        return TextFormField(
                          autofocus: true,
                          focusNode: focusNode,
                          controller: controller,
                          decoration: InputDecoration(
                            labelText: lang.whereAreYouLocationLabel,
                          ),
                          onFieldSubmitted: (value) => onSubmitted(),
                        );
                      },
                      displayStringForOption: formatLocation,
                      optionsBuilder: (value) {
                        return model.searchLocation(value.text);
                      },
                      onSelected: model.selectLocation,
                    ),
                  ),
                  const SizedBox(width: kContentSpacing),
                  Expanded(
                    child: Autocomplete<GeoLocation>(
                      initialValue: TextEditingValue(
                        text: formatTimezone(model.selectedLocation),
                      ),
                      fieldViewBuilder:
                          (context, controller, focusNode, onFieldSubmitted) {
                        if (!focusNode.hasFocus) {
                          controller.text =
                              formatTimezone(model.selectedLocation);
                        }
                        return TextFormField(
                          focusNode: focusNode,
                          controller: controller,
                          decoration: InputDecoration(
                            labelText: lang.whereAreYouTimezoneLabel,
                          ),
                          onFieldSubmitted: (value) => onFieldSubmitted(),
                        );
                      },
                      displayStringForOption: formatTimezone,
                      optionsBuilder: (value) {
                        return model.searchTimezone(value.text);
                      },
                      onSelected: model.selectTimezone,
                    ),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
      actions: <WizardAction>[
        WizardAction.back(
          context,
          enabled: false,
        ),
        WizardAction.next(
          context,
          onActivated: () async {
            await model.save();
            await Wizard.of(context).next();
          },
        )
      ],
    );
  }
}
