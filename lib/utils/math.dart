/// Converts a reply time in seconds to a human-readable string with appropriate time unit.
///
/// The function automatically selects the most suitable unit (seconds, milliseconds,
/// microseconds, or nanoseconds) based on the magnitude of [replyTime].
///
/// The [decimalPlaces] parameter controls the number of decimal places in the output.
String prettyReplyTimeWithUnit(double replyTime, {int decimalPlaces = 1}) {
  if (replyTime == 0) {
    return '0.0 ms';
  }

  if (replyTime < 1e-6) {
    // ns
    return '${(replyTime * 1e9).toStringAsFixed(decimalPlaces)} ns';
  } else if (replyTime < 1e-3) {
    // us
    return '${(replyTime * 1e6).toStringAsFixed(decimalPlaces)} µs';
  } else if (replyTime < 1.0) {
    // ms
    return '${(replyTime * 1e3).toStringAsFixed(decimalPlaces)} ms';
  } else {
    // s
    return '${replyTime.toStringAsFixed(decimalPlaces)} s';
  }
}
