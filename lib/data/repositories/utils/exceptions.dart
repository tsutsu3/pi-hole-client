/// Exception indicating that a feature is not supported.
class NotSupportedException implements Exception {
  /// Creates a NotSupportedException with an optional [message].
  NotSupportedException([this.message = 'This operation is not supported.']);
  final String message;

  @override
  String toString() => 'NotSupportedException: $message';
}

class TokenNotFoundException implements Exception {
  /// Creates a TokenNotFoundException with an optional [message].
  TokenNotFoundException([this.message = 'Token not found.']);
  final String message;

  @override
  String toString() => 'TokenNotFoundException: $message';
}

class SidNotFoundException implements Exception {
  /// Creates a SidNotFoundException with an optional [message].
  SidNotFoundException([this.message = 'SID not found.']);
  final String message;

  @override
  String toString() => 'SidNotFoundException: $message';
}
