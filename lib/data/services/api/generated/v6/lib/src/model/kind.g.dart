// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kind.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$KindCWProxy {
  Kind kind(KindKindEnum? kind);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Kind(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Kind(...).copyWith(id: 12, name: "My name")
  /// ````
  Kind call({KindKindEnum? kind});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfKind.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfKind.copyWith.fieldName(...)`
class _$KindCWProxyImpl implements _$KindCWProxy {
  const _$KindCWProxyImpl(this._value);

  final Kind _value;

  @override
  Kind kind(KindKindEnum? kind) => this(kind: kind);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Kind(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Kind(...).copyWith(id: 12, name: "My name")
  /// ````
  Kind call({Object? kind = const $CopyWithPlaceholder()}) {
    return Kind(
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as KindKindEnum?,
    );
  }
}

extension $KindCopyWith on Kind {
  /// Returns a callable class that can be used as follows: `instanceOfKind.copyWith(...)` or like so:`instanceOfKind.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$KindCWProxy get copyWith => _$KindCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kind _$KindFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Kind', json, ($checkedConvert) {
      final val = Kind(
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$KindKindEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$KindToJson(Kind instance) => <String, dynamic>{
  'kind': ?_$KindKindEnumEnumMap[instance.kind],
};

const _$KindKindEnumEnumMap = {
  KindKindEnum.exact: 'exact',
  KindKindEnum.regex: 'regex',
};
