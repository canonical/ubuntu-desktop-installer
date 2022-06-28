/*
 * Copyright (C) 2022 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

import 'package:flutter/material.dart';

/// The spacing between Continue and Back buttons.
const kButtonBarSpacing = 8.0;

/// The spacing between header, content, and footer.
const kContentSpacing = 20.0;

/// The padding around the content.
const kContentPadding = EdgeInsets.symmetric(horizontal: 24);

/// The padding around the header.
const kHeaderPadding = EdgeInsets.fromLTRB(24, 24, 24, 0);

/// The padding around the footer.
const kFooterPadding = EdgeInsets.fromLTRB(24, 0, 24, 24);

/// The fraction of content width in relation to the page.
const kContentWidthFraction = 0.7;

/// The size of a radio indicator.
const kRadioSize = Size.square(kMinInteractiveDimension - 8);

/// Size of common elements size inside a Span.
const kSpanElementSize = 16.0;

/// The height of the slide page with its descendants.
const kSlidePageHeight = 480.0;
