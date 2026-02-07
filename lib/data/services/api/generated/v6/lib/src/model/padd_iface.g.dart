// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padd_iface.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaddIfaceCWProxy {
  PaddIface v4(PaddIfaceV4? v4);

  PaddIface v6(PaddIfaceV6? v6);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddIface(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddIface(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddIface call({PaddIfaceV4? v4, PaddIfaceV6? v6});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaddIface.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaddIface.copyWith.fieldName(...)`
class _$PaddIfaceCWProxyImpl implements _$PaddIfaceCWProxy {
  const _$PaddIfaceCWProxyImpl(this._value);

  final PaddIface _value;

  @override
  PaddIface v4(PaddIfaceV4? v4) => this(v4: v4);

  @override
  PaddIface v6(PaddIfaceV6? v6) => this(v6: v6);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddIface(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddIface(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddIface call({
    Object? v4 = const $CopyWithPlaceholder(),
    Object? v6 = const $CopyWithPlaceholder(),
  }) {
    return PaddIface(
      v4: v4 == const $CopyWithPlaceholder()
          ? _value.v4
          // ignore: cast_nullable_to_non_nullable
          : v4 as PaddIfaceV4?,
      v6: v6 == const $CopyWithPlaceholder()
          ? _value.v6
          // ignore: cast_nullable_to_non_nullable
          : v6 as PaddIfaceV6?,
    );
  }
}

extension $PaddIfaceCopyWith on PaddIface {
  /// Returns a callable class that can be used as follows: `instanceOfPaddIface.copyWith(...)` or like so:`instanceOfPaddIface.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaddIfaceCWProxy get copyWith => _$PaddIfaceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddIface _$PaddIfaceFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PaddIface',
  json,
  ($checkedConvert) {
    final val = PaddIface(
      v4: $checkedConvert(
        'v4',
        (v) =>
            v == null ? null : PaddIfaceV4.fromJson(v as Map<String, dynamic>),
      ),
      v6: $checkedConvert(
        'v6',
        (v) =>
            v == null ? null : PaddIfaceV6.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$PaddIfaceToJson(PaddIface instance) => <String, dynamic>{
  'v4': ?instance.v4?.toJson(),
  'v6': ?instance.v6?.toJson(),
};
