import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:timezone_map/timezone_map.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      TimezoneMap.precacheAssets(context);
    });
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
      headerPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Center(
        child: model.isInitialized
            ? Column(
                children: <Widget>[
                  Expanded(
                    child: TimezoneMap(
                      offset: model.selectedLocation?.offset,
                      marker: model.selectedLocation?.coordinates,
                      onPressed: (coordinates) => model
                          .searchCoordinates(coordinates)
                          .then((locations) =>
                              model.selectLocation(locations.firstOrNull)),
                    ),
                  ),
                  const SizedBox(height: kContentSpacing),
                  Padding(
                    padding: kContentPadding,
                    child: Row(
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
                            fieldViewBuilder: (context, controller, focusNode,
                                onFieldSubmitted) {
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
          onNext: model.save,
        )
      ],
    );
  }
}
