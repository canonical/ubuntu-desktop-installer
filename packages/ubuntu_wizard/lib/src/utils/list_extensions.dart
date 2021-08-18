/// An extension on the [List] class that returns the element at a given index or `null`.
extension ListOrNull<T> on List<T> {
  /// Return the element at [index] if [index] is valid, `null` otherwise.
  T? elementAtOrNull(int index) =>
      index < 0 || index >= length ? null : this[index];
}
