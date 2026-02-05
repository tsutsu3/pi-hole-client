//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// Created by generate.sh to handle oneOf (String | List<String>) schema
//
import 'package:meta/meta.dart';

// ignore_for_file: unused_element

/// A utility class that handles OpenAPI oneOf schemas where the value
/// can be either a single String or a list of strings.
///
/// This is used for API fields like `address`, `domain`, `client`, and `name`
/// that can accept either a single value or multiple values.
@immutable
class StringOrList {
  const StringOrList(this._value);

  /// Creates from JSON (handles both String and List).
  factory StringOrList.fromJson(dynamic json) => StringOrList(json);

  /// Creates from a List of strings.
  factory StringOrList.fromList(List<String> value) => StringOrList(value);

  /// Creates from a single String.
  factory StringOrList.fromString(String value) => StringOrList(value);

  final dynamic _value;

  /// Returns the value as a List&lt;String&gt;.
  /// - If the value is a String, returns a single-element list.
  /// - If the value is a List, returns it as a list of strings.
  /// - Otherwise, returns an empty list.
  List<String> toList() {
    if (_value is String) return [_value];
    if (_value is List) return List<String>.from(_value);
    return [];
  }

  /// Returns the raw value (either String or List).
  dynamic get value => _value;

  /// Returns true if the value is a single String.
  bool get isString => _value is String;

  /// Returns true if the value is a List.
  bool get isList => _value is List;

  /// Converts to JSON.
  dynamic toJson() => _value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StringOrList &&
          runtimeType == other.runtimeType &&
          _value == other._value;

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() => 'StringOrList($_value)';
}
