import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../services.dart';
import 'installation_slides_model.dart';

const _kAssetPath = 'assets/slides';
String _getAssetFile(String asset) => '$_kAssetPath/$asset.png';

/// Slideshow during installation.
class InstallationSlidesPage extends StatefulWidget {
  /// Use [InstallationPage.create] instead.
  @visibleForTesting
  const InstallationSlidesPage({
    Key? key,
  }) : super(key: key);

  /// Creates a [InstallationSlidesPage] with [InstallationSlidesModel].
  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    final journal = Provider.of<JournalService>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => InstallationSlidesModel(client, journal),
      child: InstallationSlidesPage(),
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

    _precacheSlides();
  }

  void _precacheSlides() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Directory(_kAssetPath).list().forEach((slide) {
        precacheImage(AssetImage(slide.path), context);
      });
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
                  _Slide('welcome', 'Welcome to Ubuntu'),
                  _Slide('usc', 'Find even more software'),
                  _Slide('music', 'Take your music with you'),
                  _Slide('photos', 'Have fun with your photos'),
                  _Slide('browse', 'Make the most of the web'),
                  _Slide('office', 'Everything you need for the office'),
                  _Slide('accessibility', 'Access for everyone'),
                  _Slide('gethelp', 'Help and support'),
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
  const _Slide(this.asset, this.title, {Key? key}) : super(key: key);

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppBar(
          title: Text(title),
          automaticallyImplyLeading: false,
        ),
        Image.asset(
          _getAssetFile(asset),
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
