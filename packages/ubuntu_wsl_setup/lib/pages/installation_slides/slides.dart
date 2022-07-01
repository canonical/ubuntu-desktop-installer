/*
 * Copyright (C) 2022 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/constants.dart';

import '../../l10n/app_localizations.dart';

/// Implements the look of a single slide presented by WSL splash screen.
class Slide extends StatelessWidget {
  static const kInSlideLeftSpacing = 1 * kContentSpacing;
  static const kInSlideSpacing = 6 * kContentSpacing;
  const Slide({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.text,
    this.span,
  }) : super(key: key);

  const Slide.withRichText({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.span,
    this.text,
  }) : super(key: key);

  final Widget image;
  final String title;
  final String subtitle;
  final String? text;
  final List<InlineSpan>? span;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppBar(
          title: Text(title),
          automaticallyImplyLeading: false,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              kInSlideLeftSpacing,
              kInSlideSpacing,
              kInSlideSpacing,
              kInSlideSpacing,
            ),
            child: Row(
              children: [
                Expanded(
                  child: image,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white70,
                            fontSize: 32,
                            fontWeight: FontWeight.normal),
                      ),
                      if (span != null)
                        RichText(text: TextSpan(children: span)),
                      if (text != null)
                        Text(
                          text!,
                          style: _bodyTextStyle(context),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<Slide> theSlides(BuildContext context) {
  final lang = AppLocalizations.of(context);
  final bodyStyle = _bodyTextStyle(context);
  final linkStyle = bodyStyle.copyWith(
    color: Colors.white,
    decoration: TextDecoration.underline,
  );
  return [
    Slide(
      image: SvgPicture.asset('assets/1-Ubuntu_on_WSL.svg'),
      title: lang.welcome,
      subtitle: lang.ubuntuOnWsl,
      text: lang.ubuntuOnWslText,
    ),
    Slide(
      image: SvgPicture.asset('assets/2-Ubuntu_WSL_for_Web_Dev.svg'),
      title: lang.welcome,
      subtitle: lang.ubuntuWslWebDev,
      text: lang.ubuntuWslWebDevText,
    ),
    Slide(
      image: SvgPicture.asset('assets/3-Ubuntu_WSL_for_Data_Science.svg'),
      title: lang.welcome,
      subtitle: lang.ubuntuWslDataScience,
      text: lang.ubuntuWslDataScienceText,
    ),
    Slide(
      image: SvgPicture.asset('assets/4-Ubuntu_WSL_for_Graphical_Apps.svg'),
      title: lang.welcome,
      subtitle: lang.ubuntuWslGuiApps,
      text: lang.ubuntuWslGuiAppsText,
    ),
    Slide(
      image: SvgPicture.asset('assets/5-Ubuntu_WSL_for_DevOps.svg'),
      title: lang.welcome,
      subtitle: lang.ubuntuWslDevOps,
      text: lang.ubuntuWslDevOpsText,
    ),
    Slide(
      image: SvgPicture.asset('assets/6-Ubuntu_WSL_for_Enterprises.svg'),
      title: lang.welcome,
      subtitle: lang.ubuntuWslEnterprises,
      text: lang.ubuntuWslEnterprisesText,
    ),
    Slide.withRichText(
      image: SvgPicture.asset('assets/7-Ubuntu_Logo_TAG.svg'),
      title: lang.welcome,
      subtitle: lang.findOutMore,
      span: [
        TextSpan(text: lang.findOutMoreVisit, style: bodyStyle),
        WidgetSpan(
          child: Text.rich(
            TextSpan(
              text: lang.findOutMoreLink,
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchUrl('https://ubuntu.com/wsl'),
            ),
          ),
        ),
        TextSpan(
          text: lang.findOutMoreText,
          style: bodyStyle,
        ),
      ],
    ),
  ];
}

TextStyle _bodyTextStyle(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .headline6!
      .copyWith(color: Colors.white70, fontWeight: FontWeight.normal);
}

class SlidesProvider {
  final List<Widget> slides;

  const SlidesProvider(this.slides);
}
