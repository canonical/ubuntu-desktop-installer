import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'slide_layouts.dart';

String _slideAsset(String name) => 'assets/installation_slides/$name';
String _slideIcon(String name) => _slideAsset('icons/$name');
String _slideScreenshot(String name) => _slideAsset('screenshots/$name');

/// The list of default installation slides.
final defaultSlides = <WidgetBuilder>[
  _buildWelcomeSlide,
  _buildSoftwareSlide,
  _buildDevelopmentSlide,
  _buildCreativitySlide,
  _buildGamingSlide,
  _buildSecuritySlide,
  _buildProductivitySlide,
  _buildAccessibilitySlide,
  // TODO: ubuntu pro slide in LTS releases
  _buildSupportSlide,
];

Widget _buildWelcomeSlide(BuildContext context) {
  final lang = AppLocalizations.of(context);
  final product = getService<ProductService>();
  return IntroSlideLayout(
    title: Text(lang.installationSlidesWelcomeTitle),
    body: SlideColumn(
      children: [
        Text(lang.installationSlidesWelcomeHeader(context.flavor)),
        Text(lang.installationSlidesWelcomeBody(product.getProductInfo())),
      ],
    ),
    image: MascotAvatar(
      image: AssetImage(_slideAsset('mascot.png')),
      size: const Size.square(300),
    ),
  );
}

Widget _buildSoftwareSlide(BuildContext context) {
  final lang = AppLocalizations.of(context);
  return CinematicSlideLayout(
    title: Text(lang.installationSlidesSoftwareTitle),
    body: Text(lang.installationSlidesSoftwareBody(context.flavor)),
    banner: Container(
      alignment: Alignment.center,
      color: const Color(0xff2c2c2c), // TODO: fix screenshot background
      child: const _SlideScreenshot('store.png'),
    ),
    table: SlideTable(
      rows: [
        [
          Text(lang.installationSlidesAvailable),
          const SlideLabel(
            icon: _SlideIcon('spotify.png'),
            label: Text('Spotify'),
          ),
          const SlideLabel(
            icon: _SlideIcon('shotcut.png'),
            label: Text('Shotcut'),
          ),
          const SlideLabel(
            icon: _SlideIcon('telegram.png'),
            label: Text('Telegram'),
          ),
          const SlideLabel(
            icon: _SlideIcon('nextcloud.png'),
            label: Text('Nextcloud'),
          ),
        ],
      ],
    ),
  );
}

Widget _buildDevelopmentSlide(BuildContext context) {
  final lang = AppLocalizations.of(context);
  return PortraitSlideLayout(
    title: Text(lang.installationSlidesDevelopmentTitle),
    body: Text(lang.installationSlidesDevelopmentBody(context.flavor)),
    image: const _SlideScreenshot('vscode.png'),
    table: SlideTable(
      rows: [
        [
          Text(lang.installationSlidesAvailable),
          const SlideLabel(
            icon: _SlideIcon('vscode.png'),
            label: Text('Visual Studio Code'),
          ),
          const SlideLabel(
            icon: _SlideIcon('intellij.png'),
            label: Text('IDEA Ultimate'),
          ),
          const SlideLabel(
            icon: _SlideIcon('pycharm.png'),
            label: Text('Pycharm'),
          ),
          const SlideLabel(
            icon: _SlideIcon('gitkraken.png'),
            label: Text('GitKraken'),
          ),
        ],
      ],
    ),
  );
}

Widget _buildCreativitySlide(BuildContext context) {
  final lang = AppLocalizations.of(context);
  return LandscapeSlideLayout(
    title: Text(lang.installationSlidesCreativityTitle),
    body: Text(lang.installationSlidesCreativityBody(context.flavor)),
    image: const _SlideScreenshot('blender.png'),
    table: SlideTable(
      rows: [
        [
          Text(lang.installationSlidesAvailable),
          const SlideLabel(
            icon: _SlideIcon('blender.png'),
            label: Text('Blender'),
          ),
          const SlideLabel(
            icon: _SlideIcon('audacity.png'),
            label: Text('Audacity'),
          ),
          const SlideLabel(
            icon: _SlideIcon('kdenlive.png'),
            label: Text('Kdenlive'),
          ),
          const SlideLabel(
            icon: _SlideIcon('godot.png'),
            label: Text('Godot'),
          ),
        ],
      ],
    ),
  );
}

Widget _buildGamingSlide(BuildContext context) {
  final lang = AppLocalizations.of(context);
  return CinematicSlideLayout(
    title: Text(lang.installationSlidesGamingTitle),
    body: Text(lang.installationSlidesGamingBody(context.flavor)),
    banner: const _SlideScreenshot(
      'steam.png',
      alignment: Alignment.topLeft,
      fit: BoxFit.cover,
    ),
    table: SlideTable(
      rows: [
        [
          Text(lang.installationSlidesIncluded),
          const SlideLabel(
            icon: _SlideIcon('gamemode.png'),
            label: Text('Feral GameMode'),
          ),
        ],
        [
          Text(lang.installationSlidesAvailable),
          const SlideLabel(
            icon: _SlideIcon('steam.png'),
            label: Text('Steam'),
          ),
          const SlideLabel(
            icon: _SlideIcon('discord.png'),
            label: Text('Discord'),
          ),
          const SlideLabel(
            icon: _SlideIcon('obs.png'),
            label: Text('OBS Studio'),
          ),
        ],
      ],
    ),
  );
}

Widget _buildSecuritySlide(BuildContext context) {
  final lang = AppLocalizations.of(context);
  return LandscapeSlideLayout(
    title: Text(lang.installationSlidesSecurityTitle),
    body: Text(lang.installationSlidesSecurityBody(context.flavor)),
    // TODO: show installationSlidesSecurityLts in LTS releases
    image: const _SlideScreenshot('bitwarden.png'),
    table: SlideTable(
      rows: [
        [
          Text(lang.installationSlidesIncluded),
          const SlideLabel(
            icon: _SlideIcon('firefox.png'),
            label: Text('Firefox'),
          ),
          const SlideLabel(
            icon: _SlideIcon('wireguard.png'),
            label: Text('WireGuard'),
          ),
        ],
        [
          Text(lang.installationSlidesAvailable),
          const SlideLabel(
            icon: _SlideIcon('brave.png'),
            label: Text('Brave'),
          ),
          const SlideLabel(
            icon: _SlideIcon('bitwarden.png'),
            label: Text('Bitwarden'),
          ),
        ],
      ],
    ),
  );
}

Widget _buildProductivitySlide(BuildContext context) {
  final lang = AppLocalizations.of(context);
  return CinematicSlideLayout(
    title: Text(lang.installationSlidesProductivityTitle),
    body: Text(lang.installationSlidesProductivityBody(context.flavor)),
    banner: const _SlideScreenshot(
      'libreoffice.png',
      alignment: Alignment.topLeft,
      fit: BoxFit.cover,
    ),
    table: SlideTable(
      rows: [
        [
          Text(lang.installationSlidesIncluded),
          const SlideLabel(
            icon: _SlideIcon('thunderbird.png'),
            label: Text('Thunderbird'),
          ),
          const SlideLabel(
            icon: _SlideIcon('libreoffice.png'),
            label: Text('LibreOffice'),
          ),
        ],
        [
          Text(lang.installationSlidesAvailable),
          const SlideLabel(
            icon: _SlideIcon('teams.png'),
            label: Text('Microsoft Teams'),
          ),
          const SlideLabel(
            icon: _SlideIcon('slack.png'),
            label: Text('Slack'),
          ),
        ],
      ],
    ),
  );
}

Widget _buildAccessibilitySlide(BuildContext context) {
  final lang = AppLocalizations.of(context);
  return PortraitSlideLayout(
    title: Text(lang.installationSlidesAccessibilityTitle),
    body: Text(lang.installationSlidesAccessibilityBody(context.flavor)),
    image: const _SlideScreenshot('accessibility.png'),
    table: SlideTable(
      rows: [
        [
          Text(lang.installationSlidesIncluded),
          const SlideLabel(
            icon: _SlideIcon('writer.png'),
            label: Text('LibreOffice Writer'),
          ),
          SlideLabel(
            icon: const _SlideIcon('orca.png'),
            label: Text(lang.installationSlidesAccessibilityOrca),
          ),
          SlideLabel(
            icon: const _SlideIcon('languages.png'),
            label: Text(lang.installationSlidesAccessibilityLanguages),
          ),
        ],
      ],
    ),
  );
}

Widget _buildSupportSlide(BuildContext context) {
  final lang = AppLocalizations.of(context);
  return OutroSlideLayout(
    title: Text(lang.installationSlidesSupportTitle),
    body: SlideColumn(
      children: [
        Text(lang.installationSlidesSupportHeader(context.flavor)),
        Text(lang.installationSlidesSupportCommunity),
        Text(lang.installationSlidesSupportEnterprise),
      ],
    ),
    image: SvgPicture.asset(_slideAsset('ask-ubuntu-${context.theme}.svg')),
    list: SlideList(
      children: [
        _SlideLink(
          text: lang.installationSlidesSupportDocumentation,
          url: 'https://help.ubuntu.com',
        ),
        const _SlideLink(
          text: 'Ask Ubuntu',
          url: 'https://askubuntu.com',
        ),
        const _SlideLink(
          text: 'Ubuntu Discourse',
          url: 'https://discourse.ubuntu.com',
        ),
        _SlideLink(
          text: lang.installationSlidesSupportUbuntuPro,
          url: 'https://ubuntu.com/pro',
        ),
      ],
    ),
  );
}

extension _SlideContext on BuildContext {
  String get flavor => Flavor.of(this).name;
  String get theme => Theme.of(this).brightness.name;
}

class _SlideIcon extends StatelessWidget {
  const _SlideIcon(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness.name;
    return Image.asset(
      _slideIcon('$theme/$name'),
      errorBuilder: (_, __, ___) => Image.asset(_slideIcon(name)),
    );
  }
}

class _SlideScreenshot extends StatelessWidget {
  const _SlideScreenshot(
    this.name, {
    this.alignment = Alignment.center,
    this.fit,
  });

  final String name;
  final AlignmentGeometry alignment;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness.name;
    return Image.asset(
      _slideScreenshot('$theme/$name'),
      errorBuilder: (_, __, ___) => Image.asset(
        _slideScreenshot(name),
        alignment: alignment,
        fit: fit,
      ),
      alignment: alignment,
      fit: fit,
    );
  }
}

class _SlideLink extends StatelessWidget {
  const _SlideLink({required this.text, required this.url});

  final String text;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: '<a href="$url">$text</a>',
      shrinkWrap: true,
      style: {
        'body': Style(margin: Margins.zero),
        'a': Style(
          color: Theme.of(context).colorScheme.onBackground,
          textDecoration: TextDecoration.none,
        ),
      },
      onAnchorTap: (url, _, __, ___) => launchUrl(url!),
    );
  }
}
