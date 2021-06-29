const _boldMarkdown = '**';
const _boldMarkdownLength = _boldMarkdown.length;

class TextUtils {
  static List<TextPart> parseText(String text) {
    final firstIndex = text.indexOf(_boldMarkdown);
    final secondIndex = text.lastIndexOf(_boldMarkdown);

    return [
      TextPart(text: text.substring(0, firstIndex)),
      TextPart(
          text: text.substring(firstIndex + _boldMarkdownLength, secondIndex),
          isBold: true),
      TextPart(
          text: text.substring(secondIndex + _boldMarkdownLength, text.length)),
    ]..removeWhere((t) => t.text.isEmpty);
  }
}

class TextPart {
  final String text;
  final bool isBold;

  TextPart({required this.text, this.isBold = false});

  @override
  String toString() => 'TextPart(text: $text, isBold: $isBold)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextPart && other.text == text && other.isBold == isBold;
  }

  @override
  int get hashCode => text.hashCode ^ isBold.hashCode;
}
