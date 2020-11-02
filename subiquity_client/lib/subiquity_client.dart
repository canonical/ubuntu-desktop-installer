library subiquity_client;

class SubiquityClient {
  // TODO: parse languagelist instead of a hardcoded list
  final languagelist = [
    'English',
    'English (UK)',
    'Tamaziɣt Taqbaylit',
    'Català',
    '中文(简体)',
    'Hrvatski',
    'Čeština',
    'Asturianu',
    'Беларуская',
    'Nederlands',
    'Suomi',
    'Français',
    'Deutsch',
    'Ελληνικά',
    'עברית',
    'Magyar',
    'Bahasa Indonesia',
    'Latviski',
    'Lietuviškai',
    'Polski',
    'Русский',
    'Српски',
    'Español',
    'Svenska',
    'བོད་ཡིག',
    'Українська',
    'Norsk bokmål',
    'Galés',
  ];

  // TODO: un-hardcode
  final releaseNotesURL = 'https://wiki.ubuntu.com/GroovyGorilla/ReleaseNotes';
}
