import 'package:file/local.dart';
import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:path/path.dart' as p;

import 'latlng.dart';

/// A widget that displays a map of the world.
class TimezoneMap extends StatelessWidget {
  /// Creates a map.
  const TimezoneMap({
    Key? key,
    this.marker,
    this.offset,
    this.onPressed,
  }) : super(key: key);

  /// Coordinates of a map marker.
  final LatLng? marker;

  /// UTC-offset of the highlighted timezone.
  final double? offset;

  /// Called when the map is pressed at [coordinates].
  final void Function(LatLng coordinates)? onPressed;

  /// Requests all timezone map SVG assets to be pre-cached.
  static Future<void> precacheAssets(BuildContext context,
      {@visibleForTesting FileSystem fs = const LocalFileSystem()}) {
    final exePath = fs.file('/proc/self/exe').resolveSymbolicLinksSync();
    final assetDir = fs.directory(p.join(p.dirname(exePath), 'data',
        'flutter_assets', 'packages', 'timezone_map', 'assets'));
    final assets = <String>[];
    if (assetDir.existsSync()) {
      assets.addAll(assetDir
          .listSync()
          .map((entity) => p.basename(entity.path))
          .where((asset) => p.extension(asset) == '.svg'));
    }
    return Future.wait([
      for (final asset in assets)
        precachePicture(
          ExactAssetPicture(
            SvgPicture.svgStringDecoder,
            'assets/$asset',
            package: 'timezone_map',
          ),
          context,
        )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) async {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null && onPressed != null) {
          onPressed!(toLatLng(details.localPosition, box.size));
        }
      },
      child: MouseRegion(
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/map.svg',
                  fit: BoxFit.fill,
                  package: 'timezone_map',
                ),
              ),
              if (offset != null)
                Positioned.fill(
                  child: SvgPicture.asset(
                    'assets/tz_${_formatTimezoneOffset(offset!)}.svg',
                    fit: BoxFit.fill,
                    package: 'timezone_map',
                  ),
                ),
              if (marker != null)
                Positioned(
                  left: lng2x(marker!.longitude, constraints.maxWidth) - 12,
                  top: lat2y(marker!.latitude, constraints.maxHeight) - 24,
                  child: const Icon(Icons.place, color: Colors.red, size: 24),
                ),
            ],
          );
        }),
      ),
    );
  }
}

// Shortest double (%g) representation: 0, 1, 5.5, 5.75, ...
String _formatTimezoneOffset(double offset) {
  final format = NumberFormat();
  format.minimumFractionDigits = 0;
  format.maximumFractionDigits = 2;
  return format.format(offset);
}
