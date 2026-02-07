// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FtlCWProxy {
  Ftl ftl(FtlFtl? ftl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Ftl(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Ftl(...).copyWith(id: 12, name: "My name")
  /// ````
  Ftl call({FtlFtl? ftl});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFtl.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFtl.copyWith.fieldName(...)`
class _$FtlCWProxyImpl implements _$FtlCWProxy {
  const _$FtlCWProxyImpl(this._value);

  final Ftl _value;

  @override
  Ftl ftl(FtlFtl? ftl) => this(ftl: ftl);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Ftl(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Ftl(...).copyWith(id: 12, name: "My name")
  /// ````
  Ftl call({Object? ftl = const $CopyWithPlaceholder()}) {
    return Ftl(
      ftl: ftl == const $CopyWithPlaceholder()
          ? _value.ftl
          // ignore: cast_nullable_to_non_nullable
          : ftl as FtlFtl?,
    );
  }
}

extension $FtlCopyWith on Ftl {
  /// Returns a callable class that can be used as follows: `instanceOfFtl.copyWith(...)` or like so:`instanceOfFtl.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FtlCWProxy get copyWith => _$FtlCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ftl _$FtlFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Ftl', json, ($checkedConvert) {
      final val = Ftl(
        ftl: $checkedConvert(
          'ftl',
          (v) => v == null ? null : FtlFtl.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FtlToJson(Ftl instance) => <String, dynamic>{
  'ftl': ?instance.ftl?.toJson(),
};
