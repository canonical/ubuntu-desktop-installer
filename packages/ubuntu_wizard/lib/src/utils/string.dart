/// Utility extensions for [String].
extension StringOrIfEmpty on String {
  /// Returns the string if it's not empty, otherwise returns the [other] string.
  String? orIfEmpty(String? other) => isEmpty ? other : this;

  /// Sanitizes a string for use in user- and hostnames.
  String sanitize() {
    // Replace all non-alphanumeric characters with hyphens.
    var sanitized = replaceAll(RegExp('[^a-zA-Z0-9-]'), '-');
    // Remove leading hyphens.
    while (sanitized.startsWith('-')) {
      sanitized = sanitized.substring(1);
    }
    // Remove trailing hyphens.
    while (sanitized.endsWith('-')) {
      sanitized = sanitized.substring(0, sanitized.length - 1);
    }
    // Remove consecutive hyphens.
    sanitized = sanitized.replaceAll(RegExp('-{2,}'), '-');
    return sanitized.toLowerCase();
  }
}
