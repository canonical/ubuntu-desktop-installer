import 'package:flutter/material.dart';
import 'package:ubuntu_desktop_installer/pages/wizard_page.dart';
import 'package:ubuntu_desktop_installer/widgets/localized_view.dart';
import 'package:yaru/yaru.dart' as yaru;

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

const _descriptionStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  height: 1.2,
  fontWeight: FontWeight.w300,
);

final imageSlides = <_ImageSlideData>[
  _ImageSlideData(
    description:
        'Ubuntu includes Firefox, the web browser used by millions of people around the world. And web applications you use frequently (like Facebook or Gmail, for example) can be pinned to your desktop for faster access, just like apps on your computer.',
    imageAsset: 'assets/slides/browse.png',
    sections: <_Section>[
      _Section(
        title: 'Included software',
        sectionItems: <_SectionSoftware>[
          _SectionSoftware(
            title: 'Firefox web browser',
            imageAsset: 'assets/slides/icons/firefox.png',
          ),
          _SectionSoftware(
            title: 'Thunderbird',
            imageAsset: 'assets/slides/icons/thunderbird.png',
          )
        ],
      ),

      _Section(
        title: 'Supported software',
        sectionItems: <_SectionSoftware>[
          _SectionSoftware(
            title: 'Chromium',
            imageAsset: 'assets/slides/icons/chromium.png',
          ),
        ],
      )
    ],
  ),
];

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
            title: Text('Welcome to Ubuntu'), automaticallyImplyLeading: false),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 442,
              child: Stack(
                children: [
                  // Positioned.fill(
                  //   child: Image.asset(
                  //     'assets/slides/background.png',
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                  PageView(
                    controller: pageController,
                    children: [
                      IntroSlide(),
                      ...imageSlides
                          .map((isd) => ImageSlide(imageSlideData: isd)),
                    ],
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

class IntroSlide extends StatelessWidget {
  const IntroSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/slides/welcome.png',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 40,
          top: 32,
          child: Text(
            'Fast and full of new features, the latest\nversion of Ubuntu makes computing easier\nthan ever. Here are just a few cool new things\nto look out for...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0.25,
              height: 1.8,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ],
    );
  }
}

class ImageSlide extends StatelessWidget {
  ImageSlide({
    Key? key,
    required this.imageSlideData,
  }) : super(key: key);

  final _ImageSlideData imageSlideData;

  @override
  Widget build(BuildContext context) {
    final sections = <Widget>[];

    imageSlideData.sections?.forEach((element) {
      sections.add(_SectionTitle(title: element.title));
      sections.add(_LineSeparator());
      sections.addAll(element.sectionItems.map((sec) =>
          _ImageSlideItem(itemName: sec.title, imageAsset: sec.imageAsset)));
    });

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/slides/background.png',
            fit: BoxFit.fill,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 16),
                    child: Container(
                      color: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Text(
                          imageSlideData.description,
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            height: 1.2,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Container(
                      color: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: sections,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 6, child: Image.asset('assets/slides/photos.png'))
          ],
        ),
        // Positioned(
        //   left: 40,
        //   top: 32,
        //   child: widget(
        //     child: Text(
        //       'Fast and full of new features, the latest\nversion of Ubuntu makes computing easier\nthan ever. Here are just a few cool new things\nto look out for...',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 16,
        //         letterSpacing: 0.25,
        //         height: 1.8,
        //         fontWeight: FontWeight.w200,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: _descriptionStyle,
    );
  }
}

class _LineSeparator extends StatelessWidget {
  const _LineSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Container(
        height: 1,
        width: double.infinity,
        color: yaru.Colors.orange,
      ),
    );
  }
}

class _ImageSlideItem extends StatelessWidget {
  const _ImageSlideItem({
    Key? key,
    required this.imageAsset,
    required this.itemName,
  }) : super(key: key);

  final String imageAsset;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.asset(imageAsset),
          SizedBox(width: 8),
          Text(
            itemName,
            style: _descriptionStyle,
          ),
        ],
      ),
    );
  }
}

class _ImageSlideData {
  final String description;
  final List<_Section>? sections;
  final String imageAsset;

  _ImageSlideData({
    required this.description,
    required this.imageAsset,
    this.sections,
  });
}

class _Section {
  final String title;
  final List<_SectionSoftware> sectionItems;

  _Section({
    required this.title,
    required this.sectionItems,
  });
}

class _SectionSoftware {
  final String title;
  final String imageAsset;

  _SectionSoftware({
    required this.title,
    required this.imageAsset,
  });
}
