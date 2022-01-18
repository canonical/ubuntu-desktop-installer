import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../services.dart';
import 'installation_slides_model.dart';

/// Slideshow during installation.
class InstallationSlidesPage extends StatefulWidget {
  /// Use [InstallationPage.create] instead.
  @visibleForTesting
  const InstallationSlidesPage({
    Key? key,
  }) : super(key: key);

  /// Creates a [InstallationSlidesPage] with [InstallationSlidesModel].
  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    final journal = getService<JournalService>();
    return ChangeNotifierProvider(
      create: (_) => InstallationSlidesModel(client, journal),
      child: const InstallationSlidesPage(),
    );
  }

  @override
  _InstallationSlidesPageState createState() => _InstallationSlidesPageState();
}

class _InstallationSlidesPageState extends State<InstallationSlidesPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<InstallationSlidesModel>(context, listen: false);
    model.addListener(() {
      if (model.isDone) {
        Wizard.of(context).next();
      }
    });
    model.init();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      model.precacheSlideImages(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InstallationSlidesModel>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SlideShow(
                slides: <Widget>[
                  _Slide(
                    image: model.slideImage('welcome'),
                    title: 'Welcome to Ubuntu',
                  ),
                  _Slide(
                    image: model.slideImage('usc'),
                    title: 'Find even more software',
                  ),
                  _Slide(
                    image: model.slideImage('music'),
                    title: 'Take your music with you',
                  ),
                  _Slide(
                    image: model.slideImage('photos'),
                    title: 'Have fun with your photos',
                  ),
                  _Slide(
                    image: model.slideImage('browse'),
                    title: 'Make the most of the web',
                  ),
                  _Slide(
                    image: model.slideImage('office'),
                    title: 'Everything you need for the office',
                  ),
                  _Slide(
                    image: model.slideImage('accessibility'),
                    title: 'Access for everyone',
                  ),
                  _Slide(
                    image: model.slideImage('gethelp'),
                    title: 'Help and support',
                  ),
                ],
              ),
              Positioned(
                left: kContentSpacing,
                bottom: kContentSpacing / 2,
                child: Text(
                  model.hasError
                      ? 'Something went wrong.\n\nPlease restart the machine.'
                      : model.isPreparing
                          ? 'Preparing...'
                          : 'Installing... (${model.installationStep + 1}/${model.installationStepCount})',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: model.hasError
                          ? Theme.of(context).errorColor
                          : Colors.white),
                ),
              ),
            ],
          ),
          LinearProgressIndicator(value: model.isInstalling ? null : 0),
          Expanded(child: _JournalView(journal: model.journal)),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final ImageProvider image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppBar(
          title: Text(title),
          automaticallyImplyLeading: false,
        ),
        Image(
          image: image,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class _JournalView extends StatelessWidget {
  const _JournalView({
    Key? key,
    required this.journal,
  }) : super(key: key);

  final Stream<String> journal;

  @override
  Widget build(BuildContext context) {
    return LogView(
      log: journal,
      padding: const EdgeInsets.symmetric(horizontal: kContentSpacing),
      style: TextStyle(
        inherit: false,
        fontSize: Theme.of(context).textTheme.bodyText1!.fontSize,
        fontFamily: 'Ubuntu Mono',
        textBaseline: TextBaseline.alphabetic,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: kContentSpacing / 2),
      ),
      background: BoxDecoration(color: Theme.of(context).shadowColor),
    );
  }
}
