import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

/// @internal
final log = Logger('try_or_install');

/// The available options on the Try Or Install page.
enum Option {
  /// No option is selected.
  none,

  /// The user wants to repair Ubuntu.
  repairUbuntu,

  /// The user wants to try Ubuntu.
  tryUbuntu,

  /// The user wants to install Ubuntu.
  installUbuntu,
}

/// Implements the business logic of the Try Or Install page.
class TryOrInstallModel extends ChangeNotifier {
  /// The currently selected option.
  Option get option => _option;
  Option _option = Option.none;

  /// Selects the given [option].
  void selectOption(Option option) {
    if (_option == option) return;
    _option = option;
    log.info('Selected ${describeEnum(option)} option');
    notifyListeners();
  }

  /// Returns the URL of the release notes for the given [locale].
  String releaseNotesURL(
    Locale locale, {
    @visibleForTesting FileSystem fs = const LocalFileSystem(),
  }) {
    final fileOnCdrom = fs.file('/cdrom/.disk/release_notes_url');
    if (fileOnCdrom.existsSync()) {
      try {
        final url = fileOnCdrom
            .readAsLinesSync()
            .firstWhere((line) => line.trim().isNotEmpty);
        return url.replaceAll(r'${LANG}', locale.languageCode);
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {}
    }
    try {
      final lines =
          fs.file('/usr/share/distro-info/ubuntu.csv').readAsLinesSync();
      final last = lines.lastWhere((line) => line.trim().isNotEmpty);
      final codeName = last.split(',')[1].replaceAll(RegExp('\\s+'), '');
      assert(codeName.isNotEmpty);
      return 'https://wiki.ubuntu.com/$codeName/ReleaseNotes';
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      // Those are not actual release notes,
      // but it's a better fallback than a non-existent wiki page.
      return 'https://ubuntu.com/download/desktop';
    }
  }
}
