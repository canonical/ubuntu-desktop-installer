import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'ubuntu_pro_model.dart';

class UbuntuProHeader extends StatelessWidget {
  const UbuntuProHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return RoundedContainer(
      color: Theme.of(context).highlightColor.withAlpha(10),
      child: Padding(
        padding: const EdgeInsets.all(kContentSpacing),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset(
              'assets/ubuntu_pro/logo.svg',
              width: 48,
              height: 48,
            ),
            const SizedBox(width: kContentSpacing),
            const Text(
              'Ubuntu Pro',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w100,
                // TODO: font
              ),
            ),
            const SizedBox(width: kContentSpacing * 2),
            Expanded(
              child: Column(
                children: <Widget>[
                  Html(
                    data: lang.ubuntuProPageDescription,
                    style: {'body': Style(margin: EdgeInsets.zero)},
                  ),
                  const SizedBox(height: kContentSpacing),
                  Html(
                    data: lang.ubuntuProPageMoreInformation,
                    style: {'body': Style(margin: EdgeInsets.zero)},
                    onAnchorTap: (url, _, __, ___) => launchUrl(url!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TokenFormField extends StatelessWidget {
  const TokenFormField({
    Key? key,
    this.fieldWidth,
    this.focusNode,
  }) : super(key: key);

  final double? fieldWidth;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = Provider.of<UbuntuProModel>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValidatedFormField(
          fieldWidth: fieldWidth,
          focusNode: focusNode,
          labelText: lang.ubuntuProTokenHint,
          initialValue: model.token,
          onChanged: (v) => model.token = v,
          validator: MultiValidator([
            RequiredValidator(
              errorText: lang.ubuntuProTokenRequired,
            ),
            CallbackValidator(
              UbuntuProModel.isValidToken,
              errorText: lang.ubuntuProTokenInvalid,
            ),
          ]),
          successWidget: model.isAttaching
              ? SizedBox(
                  width: IconTheme.of(context).size,
                  height: IconTheme.of(context).size,
                  child: CircularProgressIndicator(strokeWidth: 3),
                )
              : model.hasError
                  ? ErrorIcon()
                  : model.isAttached
                      ? SuccessIcon()
                      : const SizedBox.shrink(),
        ),
        const SizedBox(width: kContentSpacing / 2),
        Expanded(
          child: Baseline(
            baseline: 0,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              model.isAttaching
                  ? lang.ubuntuProTokenVerifying
                  : model.hasError
                      ? lang.ubuntuProTokenInvalid
                      : model.isAttached
                          ? lang.ubuntuProTokenValid
                          : '',
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
