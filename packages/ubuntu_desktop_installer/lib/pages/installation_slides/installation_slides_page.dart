import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:yaru/yaru.dart' as yaru;

import '../../widgets/localized_view.dart';
import 'installation_slides_model.dart';
import 'intallation_slides_view_models.dart';

const _kButtonColor = Colors.white70;
const _iconSize = 42.0;
const _iconBorderSize = 60.0;
const _iconPadding = 24.0;
const _progressColor = Color(0xff772953);

const _descriptionStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  height: 1.2,
  fontWeight: FontWeight.w300,
);

class InstallationSlidesPage extends StatefulWidget {
  const InstallationSlidesPage({Key? key}) : super(key: key);

  @override
  _InstallationSlidesPageState createState() => _InstallationSlidesPageState();

  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => InstallationSlidesModel(client),
      child: InstallationSlidesPage(),
    );
  }
}

class _InstallationSlidesPageState extends State<InstallationSlidesPage>
    with TickerProviderStateMixin {
  final pageController = PageController(initialPage: 0);
  late AnimationController animationController;
  late Animation<double> animation;
  late ScrollController scrollController;

  bool isBottomCollapsed = true;
   int slideCount = 8;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    animation =
        Tween<double>(begin: 0, end: pi / 2).animate(animationController);

    scrollController = ScrollController();

    _animateSlides();
  }

  void _animateSlides() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      var currentPage = pageController.page!.toInt();
      var nextPage = currentPage + 1;

      //TODO: get this number dynamically
      if (nextPage == 8) {
        nextPage = 0;
      }

      pageController
          .animateToPage(nextPage,
              duration: Duration(seconds: 1), curve: Curves.easeInOut)
          .then((value) => _animateSlides());
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) => Scaffold(
        appBar: AppBar(
            title: Text('Welcome to Ubuntu'), automaticallyImplyLeading: false),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    children: [
                      TextSlide(
                        backgroundAsset: 'assets/slides/welcome.png',
                        text: lang.installSlide1Text,
                      ),
                      ...createImageSlides(lang)
                          .map((isd) => ImageSlide(imageSlideData: isd)),
                      TextSlide(
                        backgroundAsset: 'assets/slides/welcome.png',
                        text: lang.installationSlide8Description,
                      ),
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
            AnimatedContainer(
              height: isBottomCollapsed ? 120 : 230,
              duration: Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        AnimatedBuilder(
                          animation: animationController,
                          builder: (context, child) => Transform.rotate(
                            angle: animation.value,
                            child: IconButton(
                              icon: Icon(Icons.arrow_right),
                              onPressed: () {
                                if (isBottomCollapsed) {
                                  animationController.forward();
                                } else {
                                  animationController.reverse();
                                }
                                isBottomCollapsed = !isBottomCollapsed;
                                setState(() {});

                                // scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text('Copying files...'),
                      ],
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: isBottomCollapsed ? 0 : 120,
                      width: double.infinity,
                      color: yaru.Colors.coolGrey,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            mockTerminalOutput,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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

class TextSlide extends StatelessWidget {
  const TextSlide({
    Key? key,
    required this.backgroundAsset,
    required this.text,
  }) : super(key: key);

  final String backgroundAsset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            backgroundAsset,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 40,
          right: 0,
          top: 32,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            alignment: Alignment.topLeft,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                letterSpacing: 0.25,
                height: 1.8,
                fontWeight: FontWeight.w200,
              ),
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

  final ImageSlideData imageSlideData;

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
                  if (sections.isNotEmpty)
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
            Expanded(flex: 6, child: Image.asset(imageSlideData.imageAsset))
          ],
        ),
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

///TODO: remove this and load from subiquity status
const String mockTerminalOutput = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sollicitudin sodales massa eu congue. Curabitur ut ex nisi. Pellentesque convallis nunc non mauris imperdiet rutrum lacinia vel purus. Donec nec laoreet enim, vel ultricies urna. Nam scelerisque, velit ac laoreet gravida, neque neque lobortis purus, non auctor nibh elit nec sem. Aliquam vel nibh non eros elementum tincidunt. Nullam fringilla id ligula sed dapibus. In blandit lacus in ipsum faucibus, sit amet consequat sapien convallis. Praesent quis nisi porttitor, bibendum justo at, sollicitudin orci. Maecenas bibendum viverra quam, sit amet tempus lacus condimentum quis. Proin malesuada, turpis sit amet efficitur vehicula, ex purus elementum nunc, quis laoreet massa tellus et lectus. Duis varius sem vel ultricies consectetur. Sed ultricies ante metus, eget sagittis augue suscipit ut. 

Integer id diam mattis, auctor ipsum sed, venenatis est. Phasellus non ullamcorper velit, ac ornare tellus. Nam porta elementum justo quis volutpat. Quisque fermentum a felis eget ultricies. Phasellus at nibh lacinia, tempor arcu at, auctor ipsum. Curabitur a elit nec arcu porttitor bibendum. Morbi consequat volutpat sollicitudin. Aenean sollicitudin mi massa, vel blandit mi porttitor eget.

Mauris elementum porta sem, eu lacinia metus tincidunt dapibus. Sed at blandit neque. Morbi maximus felis ultrices purus tempor pellentesque. Donec id ligula nisl. Mauris in sapien eget urna porta semper eu nec nisl. Ut id posuere nibh, vel consectetur tellus. Vestibulum dui turpis, aliquet sit amet vestibulum id, consectetur eget ligula. Ut tellus nisi, pulvinar sit amet vestibulum ut, egestas faucibus leo. Aenean vitae vehicula elit. Morbi egestas orci id felis cursus, a interdum erat tempor. Nam in blandit risus, quis venenatis nulla. In eleifend purus id pretium elementum. Suspendisse ut mi imperdiet, dictum leo efficitur, sodales quam. Nullam elementum diam eget ante pellentesque convallis.

Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean id faucibus erat. Aenean arcu lectus, rutrum in lacus a, dapibus sagittis ex. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed sit amet sapien auctor, condimentum diam id, tincidunt diam. Donec feugiat, elit at facilisis varius, orci orci ultrices elit, vitae volutpat risus lorem non magna. Integer a tristique dolor. Pellentesque ut massa tristique, faucibus turpis vel, vehicula tellus. Sed eu risus augue. Aliquam erat volutpat.

Phasellus lobortis non tortor at cursus. Proin viverra augue id ex rhoncus mattis. Aliquam in sollicitudin nunc, id venenatis lorem. Donec eu lacus vulputate dui sagittis semper. Cras ut suscipit enim, vel tempor elit. Donec gravida metus vitae blandit auctor. Morbi pellentesque vel sem sit amet hendrerit. Mauris eu lectus ac massa volutpat aliquam vitae ut orci. Pellentesque scelerisque malesuada libero eget efficitur. Aenean tincidunt, quam ac consequat pretium, odio mauris tristique odio, at venenatis tortor velit vitae eros. Maecenas et convallis justo, quis fringilla dui. Suspendisse et nunc mattis, bibendum velit sed, convallis turpis. Nam risus libero, condimentum ac diam eu, efficitur hendrerit libero. Proin purus dolor, porttitor eu finibus sed, volutpat ac diam.

Output....
""";
