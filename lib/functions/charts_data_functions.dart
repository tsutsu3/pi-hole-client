import 'dart:collection';

Map<String, double> removeZeroValues(Map<String, double> values) {
  values.removeWhere((key, value) => value == 0);
  return values;
}

Map<String, double> sortValues(Map<String, double> values) {
  final sortedKeys = values.keys.toList(growable: false)
    ..sort((k1, k2) => values[k1]!.compareTo(values[k2]!));
  final sortedMap = LinkedHashMap.fromIterable(
    sortedKeys,
    key: (k) => k,
    value: (k) => values[k] ?? 0.0,
  );
  final reversed =
      LinkedHashMap.fromEntries(sortedMap.entries.toList().reversed);
  return <String, double>{...reversed};
}
