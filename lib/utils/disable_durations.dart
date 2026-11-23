/// Timed options of the disable menu (Settings > App settings > Timers).
///
/// Stored in the database as seconds, comma separated (`30,60,120,300`).
abstract final class DisableDurations {
  /// Number of timed options in the disable menu.
  static const count = 4;

  /// Default options, in seconds: 30 s, 1 min, 2 min, 5 min.
  static const defaults = [30, 60, 120, 300];

  static const minSeconds = 1;

  /// 24 hours.
  static const maxSeconds = 86400;

  /// Parses the database value. Falls back to [defaults] if it is not valid.
  static List<int> parse(String? value) {
    if (value == null) return defaults;
    final parsed = value
        .split(',')
        .map((e) => int.tryParse(e.trim()))
        .whereType<int>()
        .where((e) => e >= minSeconds && e <= maxSeconds)
        .toList();
    return parsed.length == count ? parsed : defaults;
  }

  /// Database value for [durations].
  static String serialize(List<int> durations) => durations.join(',');
}
