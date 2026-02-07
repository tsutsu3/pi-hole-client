// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totp.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TotpCWProxy {
  Totp totp(TotpTotp? totp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Totp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Totp(...).copyWith(id: 12, name: "My name")
  /// ````
  Totp call({TotpTotp? totp});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTotp.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTotp.copyWith.fieldName(...)`
class _$TotpCWProxyImpl implements _$TotpCWProxy {
  const _$TotpCWProxyImpl(this._value);

  final Totp _value;

  @override
  Totp totp(TotpTotp? totp) => this(totp: totp);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Totp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Totp(...).copyWith(id: 12, name: "My name")
  /// ````
  Totp call({Object? totp = const $CopyWithPlaceholder()}) {
    return Totp(
      totp: totp == const $CopyWithPlaceholder()
          ? _value.totp
          // ignore: cast_nullable_to_non_nullable
          : totp as TotpTotp?,
    );
  }
}

extension $TotpCopyWith on Totp {
  /// Returns a callable class that can be used as follows: `instanceOfTotp.copyWith(...)` or like so:`instanceOfTotp.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TotpCWProxy get copyWith => _$TotpCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Totp _$TotpFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Totp', json, ($checkedConvert) {
      final val = Totp(
        totp: $checkedConvert(
          'totp',
          (v) =>
              v == null ? null : TotpTotp.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TotpToJson(Totp instance) => <String, dynamic>{
  'totp': ?instance.totp?.toJson(),
};
