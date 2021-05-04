import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets.dart';
import 'connect_model.dart';
import 'wifi_auth_model.dart';
import 'wifi_model.dart';

const _kIconSize = 96.0;
const _kSpacing = 48.0;
const _kPadding = EdgeInsets.fromLTRB(24, 0, 24, 24);

Future<Authentication?> showWifiAuthDialog({
  required BuildContext context,
  required WifiDeviceModel device,
  required AccessPointModel accessPoint,
}) async {
  final model = Provider.of<WifiAuthModel>(context, listen: false);
  final passwordController = TextEditingController();

  final accepted = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return ChangeNotifierProvider.value(
        value: model,
        child: LocalizedView(
          builder: (context, lang) {
            final windowSize = MediaQuery.of(context).size;
            final model = Provider.of<WifiAuthModel>(context);

            final title = Row(
              children: <Widget>[
                const Icon(Icons.wifi, size: _kIconSize),
                const SizedBox(width: _kSpacing),
                Expanded(
                  child: Text(
                    lang.wifiAuthenticationRequired,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            );

            final subtitle = Row(
              children: <Widget>[
                const SizedBox(width: _kIconSize + _kSpacing),
                Expanded(
                  child: Text(
                    lang.wifiPasswordRequired(
                        String.fromCharCodes(accessPoint.ssid)),
                  ),
                ),
              ],
            );

            Widget buildLabel(String label) {
              return SizedBox(
                width: _kIconSize + _kSpacing / 2,
                child: Text(label, textAlign: TextAlign.right),
              );
            }

            String dropdownText(WifiSecurity value) {
              switch (value) {
                case WifiSecurity.wpa2Personal:
                  return lang.wpa2Personal;
                case WifiSecurity.wpa3Personal:
                  return lang.wpa3Personal;
                default:
                  throw UnimplementedError(value.toString());
              }
            }

            String menuText(StorePassword value) {
              switch (value) {
                case StorePassword.thisUser:
                  return lang.storeWifiPasswordThisUser;
                case StorePassword.allUsers:
                  return lang.storeWifiPasswordAllUsers;
                case StorePassword.askAlways:
                  return lang.askWifiPasswordAlways;
                default:
                  throw UnimplementedError(value.toString());
              }
            }

            IconData menuIcon(StorePassword value) {
              switch (value) {
                case StorePassword.thisUser:
                  return Icons.person;
                case StorePassword.allUsers:
                  return Icons.people;
                case StorePassword.askAlways:
                  return Icons.help;
                default:
                  throw UnimplementedError(value.toString());
              }
            }

            return AlertDialog(
              contentPadding: _kPadding,
              actionsPadding: _kPadding,
              buttonPadding: EdgeInsets.zero,
              title: title,
              content: SizedBox(
                width: windowSize.width / 2,
                height: windowSize.height / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    subtitle,
                    const SizedBox(height: _kSpacing / 2),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        buildLabel(lang.wifiSecurity),
                        const SizedBox(width: _kSpacing / 2),
                        Expanded(
                          child: DropdownBuilder<WifiSecurity>(
                            selected: model.wifiSecurity,
                            values: WifiSecurity.values,
                            itemBuilder: (context, value, _) {
                              return Text(dropdownText(value));
                            },
                            onSelected: (value) => model.wifiSecurity = value,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        buildLabel(lang.wifiPassword),
                        const SizedBox(width: _kSpacing / 2),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            obscureText: !model.showPassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              suffixIcon: MenuButtonBuilder<StorePassword>(
                                selected: model.storePassword,
                                onSelected: (v) => model.storePassword = v,
                                values: StorePassword.values,
                                iconBuilder: (context, value, _) {
                                  return Icon(
                                    menuIcon(value),
                                    color: Theme.of(context).hintColor,
                                  );
                                },
                                itemBuilder: (context, value, _) {
                                  return Text(menuText(value));
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: _kIconSize + _kSpacing),
                        Expanded(
                          child: CheckboxListTile(
                            value: model.showPassword,
                            contentPadding: EdgeInsets.zero,
                            title: Text(lang.showPassword),
                            controlAffinity: ListTileControlAffinity.leading,
                            tileColor: Colors.transparent,
                            selectedTileColor: Colors.transparent,
                            onChanged: (v) => model.showPassword = v ?? false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                OutlinedButton(
                  child: Text(lang.cancelButtonText),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                const SizedBox(width: 8),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: passwordController,
                  builder: (context, password, child) {
                    return OutlinedButton(
                      child: Text(lang.connectButtonText),
                      onPressed: password.text.isNotEmpty
                          ? () => Navigator.of(context).pop(true)
                          : null,
                    );
                  },
                ),
              ],
            );
          },
        ),
      );
    },
  );

  return accepted == true
      ? Authentication(
          password: passwordController.text,
          storePassword: model.storePassword,
          wifiSecurity: model.wifiSecurity)
      : null;
}
