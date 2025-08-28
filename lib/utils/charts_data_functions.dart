import 'dart:collection';

/// Removes all entries from the given [values] map where the value is zero or NaN.
///
/// Modifies the original map by removing key-value pairs whose values are either `0`
/// or `NaN`, and returns the modified map.
///
/// Example:
/// ```dart
/// final data = {'a': 1.0, 'b': 0.0, 'c': double.nan};
/// final result = removeZeroValues(data);
/// // result: {'a': 1.0}
/// ```
Map<String, double> removeZeroValues(Map<String, double> values) {
  values.removeWhere((key, value) => value == 0 || value.isNaN);
  return values;
}

/// Sorts a map of string keys and double values in descending order based on the values.
///
/// Takes a [values] map and returns a new map with the entries sorted by their values
/// from highest to lowest. The returned map preserves the order of the sorted entries.
///
/// Example:
/// ```dart
/// final data = {'a': 2.0, 'b': 3.5, 'c': 1.0};
/// final sorted = sortValues(data);
/// // sorted: {'b': 3.5, 'a': 2.0, 'c': 1.0}
/// ```
///
/// If a value is missing for a key, it defaults to 0.0.
Map<String, double> sortValues(Map<String, double> values) {
  final sortedKeys = values.keys.toList(growable: false)
    ..sort((k1, k2) => values[k1]!.compareTo(values[k2]!));
  final sortedMap = LinkedHashMap.fromIterable(
    sortedKeys,
    key: (k) => k,
    value: (k) => values[k] ?? 0.0,
  );
  final reversed = LinkedHashMap.fromEntries(
    sortedMap.entries.toList().reversed,
  );
  return <String, double>{...reversed};
}
