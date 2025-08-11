/// Calculate a suitable interval for the graph
///
/// [topPoint] represents the maximum value on the graph.
///
/// The function returns an interval that divides the range
/// into approximately 5 segments, while ensuring that the interval
/// is not too small (minimum interval is 1.0).
double calcInterval(int topPoint) {
  // Default interval when the top point is 0 or negative
  if (topPoint <= 0) {
    return 1.0;
  }

  final interval = (topPoint / 5.0).ceilToDouble();

  // Ensure the interval is at least 1.0
  return interval < 1.0 ? 1.0 : interval;
}
