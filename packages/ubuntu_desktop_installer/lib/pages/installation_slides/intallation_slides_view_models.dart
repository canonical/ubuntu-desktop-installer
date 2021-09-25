import '../../l10n.dart';

class ImageSlideData {
  final String description;
  final List<Section>? sections;
  final String imageAsset;

  ImageSlideData({
    required this.description,
    required this.imageAsset,
    this.sections,
  });
}

class Section {
  final String title;
  final List<SectionSoftware> sectionItems;

  Section({
    required this.title,
    required this.sectionItems,
  });
}

class SectionSoftware {
  final String title;
  final String imageAsset;

  SectionSoftware({
    required this.title,
    required this.imageAsset,
  });
}

List<ImageSlideData> createImageSlides(AppLocalizations lang) =>
    <ImageSlideData>[
      ImageSlideData(
          description: lang.installSlide2Description,
          imageAsset: 'assets/slides/gs.png',
          sections: <Section>[]),
      ImageSlideData(
        description: lang.installSlide3Description,
        imageAsset: 'assets/slides/music.png',
        sections: <Section>[
          Section(
            title: lang.installSlidesIncludedSoftware,
            sectionItems: <SectionSoftware>[
              SectionSoftware(
                title: lang.installSlidesRhytmbox,
                imageAsset: 'assets/slides/icons/rhythmbox.png',
              ),
            ],
          ),
          Section(
            title: lang.installSlidesAvailableSoftware,
            sectionItems: <SectionSoftware>[
              SectionSoftware(
                title: lang.installSlidesSpotify,
                imageAsset: 'assets/slides/icons/spotify.png',
              ),
              SectionSoftware(
                title: lang.installSlidesVLC,
                imageAsset: 'assets/slides/icons/vlc.png',
              ),
            ],
          )
        ],
      ),
      ImageSlideData(
        description: lang.installSlide4Description,
        imageAsset: 'assets/slides/photos.png',
        sections: <Section>[
          Section(
            title: lang.installSlidesIncludedSoftware,
            sectionItems: <SectionSoftware>[
              SectionSoftware(
                title: lang.installSlidesShotwell,
                imageAsset: 'assets/slides/icons/shotwell.png',
              ),
            ],
          ),
          Section(
            title: lang.installSlidesSupportedSoftware,
            sectionItems: <SectionSoftware>[
              SectionSoftware(
                title: lang.installSlidesGimp,
                imageAsset: 'assets/slides/icons/gimp.png',
              ),
              SectionSoftware(
                title: lang.installSlidesShotcut,
                imageAsset: 'assets/slides/icons/shotcut.png',
              ),
            ],
          )
        ],
      ),
      ImageSlideData(
        description: lang.installSlide5Description,
        imageAsset: 'assets/slides/browse.png',
        sections: <Section>[
          Section(
            title: lang.installSlidesIncludedSoftware,
            sectionItems: <SectionSoftware>[
              SectionSoftware(
                title: lang.installSlidesFirefox,
                imageAsset: 'assets/slides/icons/firefox.png',
              ),
              SectionSoftware(
                title: lang.installSlidesThunderbird,
                imageAsset: 'assets/slides/icons/thunderbird.png',
              )
            ],
          ),
          Section(
            title: lang.installSlidesSupportedSoftware,
            sectionItems: <SectionSoftware>[
              SectionSoftware(
                title: lang.installSlidesChromium,
                imageAsset: 'assets/slides/icons/chromium.png',
              ),
            ],
          )
        ],
      ),
      ImageSlideData(
        description: lang.installSlide6Description,
        imageAsset: 'assets/slides/office.png',
        sections: <Section>[
          Section(
            title: lang.installSlidesIncludedSoftware,
            sectionItems: <SectionSoftware>[
              SectionSoftware(
                title: lang.installSlideWriter,
                imageAsset: 'assets/slides/icons/libreoffice-writer.png',
              ),
              SectionSoftware(
                title: lang.installSlideCalc,
                imageAsset: 'assets/slides/icons/libreoffice-calc.png',
              ),
              SectionSoftware(
                title: lang.installSlideImpress,
                imageAsset: 'assets/slides/icons/libreoffice-impress.png',
              ),
            ],
          ),
        ],
      ),
      ImageSlideData(
        description: lang.installSlide7Description,
        imageAsset: 'assets/slides/customize.png',
        sections: <Section>[
          Section(
            title: lang.installSlideCustomization,
            sectionItems: <SectionSoftware>[
              SectionSoftware(
                title: lang.installSlideAppearance,
                imageAsset: 'assets/slides/icons/themes.png',
              ),
              SectionSoftware(
                title: lang.installSlideAssistive,
                imageAsset: 'assets/slides/icons/access.png',
              ),
              SectionSoftware(
                title: lang.installSlideLangSupport,
                imageAsset: 'assets/slides/icons/languages.png',
              ),
            ],
          ),
        ],
      ),
    ];
