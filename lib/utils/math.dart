/// Converts a reply time in seconds to a human-readable string with appropriate time unit.
///
/// The function automatically selects the most suitable unit (seconds, milliseconds,
/// microseconds, or nanoseconds) based on the magnitude of [replyTime].
///
/// The [decimalPlaces] parameter controls the number of decimal places in the output.
///
/// Example:
/// ```dart
/// prettyReplyTimeWithUnit(0.0000005); // "0.5 ns"
/// prettyReplyTimeWithUnit(0.0005);    // "500.0 µs"
/// prettyReplyTimeWithUnit(0.5);       // "500.0 ms"
/// prettyReplyTimeWithUnit(2.0);       // "2.0 s"
/// ```
String prettyReplyTimeWithUnit(double replyTime, {int decimalPlaces = 1}) {
  if (replyTime == 0) {
    return '0.0 ms';
  }

  if (replyTime < 0.000001) {
    // ns
    return '${(replyTime * 1000000000).toStringAsFixed(decimalPlaces)} ns';
  } else if (replyTime < 0.001) {
    // us
    return '${(replyTime * 1000000).toStringAsFixed(decimalPlaces)} µs';
  } else if (replyTime < 1.0) {
    // ms
    return '${(replyTime * 1000).toStringAsFixed(decimalPlaces)} ms';
  } else {
    // s
    return '${replyTime.toStringAsFixed(decimalPlaces)} s';
  }
}
