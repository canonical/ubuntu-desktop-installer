import 'package:flutter/material.dart';
import 'package:ubuntu_desktop_installer/pages/wizard_page.dart';
import 'package:ubuntu_desktop_installer/widgets/localized_view.dart';

const images = [
  'assets/slides/welcome.png',
  'assets/slides/browse.png',
  'assets/slides/customize.png',
  'assets/slides/gs.png',
  'assets/slides/music.png',
  'assets/slides/office.png',
  'assets/slides/photos.png',
];

const _kButtonColor = Colors.white70;
const _iconSize = 42.0;
const _iconBorderSize = 60.0;
const _iconPadding = 24.0;
const _progressColor = const Color(0xff772953);

class InstallationSlides extends StatefulWidget {
  const InstallationSlides({Key? key}) : super(key: key);

  @override
  _InstallationSlidesState createState() => _InstallationSlidesState();

  static Widget create(BuildContext context) => InstallationSlides();
}

class _InstallationSlidesState extends State<InstallationSlides> {
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) => Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Ubuntu'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 442,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/slides/background.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  PageView(
                    controller: pageController,
                    children: images
                        .map((i) => Slide(
                              asset: i,
                            ))
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: _iconPadding),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _NavButton(
                        icon: Icons.navigate_before_sharp,
                        onTap: () {
                          pageController.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: _iconPadding),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: _NavButton(
                        icon: Icons.navigate_next_sharp,
                        onTap: () {
                          pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      SizedBox(width: 8),
                      Text('Copying files...'),
                    ],
                  ),
                  SizedBox(height: 16),
                  LinearProgressIndicator(
                    minHeight: 4,
                    value: 0.2,
                    color: _progressColor,
                    backgroundColor: _progressColor.withAlpha(61),
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

class _NavButton extends StatelessWidget {
  const _NavButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _iconBorderSize,
        height: _iconBorderSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: _kButtonColor),
        ),
        child: Icon(
          icon,
          size: _iconSize,
          color: _kButtonColor,
        ),
      ),
    );
  }
}

class Slide extends StatelessWidget {
  const Slide({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      fit: BoxFit.none,
    );
  }
}
