import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'timezone_model.dart';

/// https://github.com/canonical/ubuntu-desktop-installer/issues/38
class TimezonePage extends ConsumerStatefulWidget {
  const TimezonePage({super.key, this.controller});

  final TimezoneController? controller;

  @override
  TimezonePageState createState() => TimezonePageState();
}

@visibleForTesting
class TimezonePageState extends ConsumerState<TimezonePage> {
  late final TimezoneController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ??
        TimezoneController(service: getService<GeoService>());

    final model = ref.read(timezoneModelProvider);
    model.init().then((timezone) {
      _controller.searchTimezone(timezone).then((timezones) {
        _controller.selectTimezone(timezones.firstOrNull);
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  String formatLocation(GeoLocation? location) {
    return location?.toDisplayString() ?? '';
  }

  String formatTimezone(GeoLocation? location) {
    return location?.toTimezoneString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);

    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.whereAreYouPageTitle),
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(
        children: <Widget>[
          Padding(
            padding: kContentPadding,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: YaruAutocomplete<GeoLocation>(
                    initialValue: TextEditingValue(
                      text: formatLocation(_controller.selectedLocation),
                    ),
                    fieldViewBuilder:
                        (context, editor, focusNode, onSubmitted) {
                      if (!focusNode.hasFocus) {
                        editor.text =
                            formatLocation(_controller.selectedLocation);
                      }
                      return TextFormField(
                        focusNode: focusNode,
                        controller: editor,
                        decoration: InputDecoration(
                          labelText: lang.whereAreYouLocationLabel,
                        ),
                        onFieldSubmitted: (value) => onSubmitted(),
                      );
                    },
                    displayStringForOption: formatLocation,
                    optionsBuilder: (value) {
                      return _controller.searchLocation(value.text);
                    },
                    onSelected: _controller.selectLocation,
                  ),
                ),
                const SizedBox(width: kContentSpacing),
                Expanded(
                  child: YaruAutocomplete<GeoLocation>(
                    initialValue: TextEditingValue(
                      text: formatTimezone(_controller.selectedLocation),
                    ),
                    fieldViewBuilder:
                        (context, editor, focusNode, onFieldSubmitted) {
                      if (!focusNode.hasFocus) {
                        editor.text =
                            formatTimezone(_controller.selectedLocation);
                      }
                      return TextFormField(
                        focusNode: focusNode,
                        controller: editor,
                        decoration: InputDecoration(
                          labelText: lang.whereAreYouTimezoneLabel,
                        ),
                        onFieldSubmitted: (value) => onFieldSubmitted(),
                      );
                    },
                    displayStringForOption: formatTimezone,
                    optionsBuilder: (value) {
                      return _controller.searchTimezone(value.text);
                    },
                    onSelected: _controller.selectTimezone,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: kContentSpacing),
          Expanded(
            child: TimezoneMap(
              size: TimezoneMapSize.medium,
              offset: _controller.selectedLocation?.offset,
              marker: _controller.selectedLocation?.coordinates,
              onPressed: (coordinates) => _controller
                  .searchMap(coordinates)
                  .then(_controller.selectLocation),
            ),
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardAction.back(
          context,
          enabled: false,
        ),
        trailing: [
          WizardAction.next(
            context,
            onNext: () {
              final model = ref.read(timezoneModelProvider);
              return model.save(_controller.selectedLocation?.timezone);
            },
          ),
        ],
      ),
    );
  }
}

extension on TimezoneController {
  // Searches for the nearest location on the map but returns a simplified
  // location entry with the administration area and country details removed,
  // and the location name set to the name of the largest city in the timezone
  // to match the behavior of Ubiquity.
  //
  // This ensures that clicking around the timezone map keeps the pin as close
  // as possible to the clicked location (the timezone's largest city could be
  // far away), yet the presented textual result is not too granular i.e. not
  // some small unknown village but the timezone's largest city.
  Future<GeoLocation?> searchMap(LatLng coordinates) async {
    final location = await searchCoordinates(coordinates)
        .then((values) => values.firstOrNull);
    final timezone = await searchTimezone(location?.timezone ?? '')
        .then((values) => values.firstOrNull);
    return location?.copyWith(
      name: timezone?.name ?? location.name,
      admin: '',
      country: '',
    );
  }
}
