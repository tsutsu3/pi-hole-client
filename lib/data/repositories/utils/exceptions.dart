/// Exception indicating that a feature is not supported.
class NotSupportedException implements Exception {
  /// Creates a NotSupportedException with an optional [message].
  NotSupportedException([this.message = 'This operation is not supported.']);
  final String message;

  @override
  String toString() => 'NotSupportedException: $message';
}
