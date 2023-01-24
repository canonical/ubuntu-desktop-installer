import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

/// The spacing between Continue and Back buttons.
const kButtonBarSpacing = 8.0;

/// The spacing between header, content, and footer.
const kContentSpacing = kYaruPagePadding;

/// The padding around the content.
const kContentPadding = EdgeInsets.symmetric(horizontal: kContentSpacing);

/// The padding around the header.
const kHeaderPadding =
    EdgeInsets.fromLTRB(kContentSpacing, kContentSpacing, kContentSpacing, 0);

/// The padding around the footer.
const kFooterPadding =
    EdgeInsets.fromLTRB(kContentSpacing, 0, kContentSpacing, kContentSpacing);

/// The fraction of content width in relation to the page.
const kContentWidthFraction = 0.7;

/// The indentation to align with radio indicators etc.
const kContentIndentation =
    EdgeInsetsDirectional.only(start: kContentSpacing * 2);

/// The height of a popup menu item.
const kPopupMenuItemHeight = 36.0;
