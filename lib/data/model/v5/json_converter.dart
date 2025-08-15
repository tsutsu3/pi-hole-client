import 'package:freezed_annotation/freezed_annotation.dart';

/// A custom [JsonConverter] for deserializing Pi-hole v5 API responses
/// that are expected to be `Map<String, int>`, but may return an empty list (`[]`)
/// instead of an empty map when no data is available.
///
/// This converter gracefully handles both cases:
/// - If the JSON is a `Map<String, dynamic>`, it parses each value as `int`.
/// - If the JSON is an empty list (`[]`), it returns an empty map.
/// - Otherwise, it throws a [FormatException].
///
/// This is useful when dealing with Pi-hole v5 endpoints such as:
/// `/admin/api.php?summaryRaw`, `/topItems`, etc., which may return `[]`
/// instead of `{}` when no data exists.
class MapOrEmptyListConverter extends JsonConverter<Map<String, int>, dynamic> {
  const MapOrEmptyListConverter();

  @override
  Map<String, int> fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return json.map((k, v) => MapEntry(k, v as int));
    } else if (json is List) {
      return {};
    } else {
      throw FormatException('Invalid format for Map<String, int>: $json');
    }
  }

  @override
  dynamic toJson(Map<String, int> object) {
    if (object.isEmpty) {
      return [];
    }
    return object;
  }
}

class MapDoubleOrEmptyListConverter
    extends JsonConverter<Map<String, double>, dynamic> {
  const MapDoubleOrEmptyListConverter();

  @override
  Map<String, double> fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return json.map((k, v) => MapEntry(k, v.toDouble()));
    } else if (json is List) {
      return {};
    } else {
      throw FormatException('Invalid format for Map<String, double>: $json');
    }
  }

  @override
  dynamic toJson(Map<String, double> object) {
    if (object.isEmpty) {
      return [];
    }
    return object;
  }
}

class MapListOrEmptyListConverter
    extends JsonConverter<Map<String, List<int>>, dynamic> {
  const MapListOrEmptyListConverter();

  @override
  Map<String, List<int>> fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return json.map((k, v) {
        if (v is List) {
          final list = v.whereType<int>().map((e) => e).toList();
          return MapEntry(k, list);
        }
        return MapEntry(k, <int>[]);
      });
    } else if (json is List) {
      // In some API specifications, an empty array may be returned
      return {};
    } else {
      throw FormatException('Invalid format for Map<String, List<int>>: $json');
    }
  }

  @override
  dynamic toJson(Map<String, List<int>> object) {
    return object.isEmpty ? [] : object;
  }
}

class ListOfListStringOrEmptyConverter
    extends JsonConverter<List<List<String>>, dynamic> {
  const ListOfListStringOrEmptyConverter();

  @override
  List<List<String>> fromJson(dynamic json) {
    if (json is List) {
      return json.map<List<String>>((e) {
        if (e is List) {
          return e.map((item) => item.toString()).toList();
        } else {
          throw FormatException('Invalid inner list item: $e');
        }
      }).toList();
    } else {
      throw FormatException('Expected a List of Lists but got: $json');
    }
  }

  @override
  dynamic toJson(List<List<String>> object) => object;
}
