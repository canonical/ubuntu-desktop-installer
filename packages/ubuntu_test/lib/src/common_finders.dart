import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

extension UbuntuCommonFinders on CommonFinders {
  Finder asset(String assetName, {bool skipOffstage = true}) {
    return byWidgetPredicate(
      (w) =>
          w is Image &&
          w.image is AssetImage &&
          (w.image as AssetImage).assetName.endsWith(assetName),
      skipOffstage: skipOffstage,
    );
  }

  Finder html(String data, {bool skipOffstage = true}) {
    return byWidgetPredicate(
      (w) => w is Html && w.data == data,
      skipOffstage: skipOffstage,
    );
  }

  Finder svg(String assetName, {bool skipOffstage = true}) {
    return byWidgetPredicate(
      (w) =>
          w is SvgPicture &&
          w.bytesLoader is SvgAssetLoader &&
          (w.bytesLoader as SvgAssetLoader).assetName.endsWith(assetName),
      skipOffstage: skipOffstage,
    );
  }
}
