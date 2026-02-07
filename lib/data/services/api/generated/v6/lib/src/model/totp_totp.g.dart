// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totp_totp.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TotpTotpCWProxy {
  TotpTotp type(String? type);

  TotpTotp account(String? account);

  TotpTotp issuer(String? issuer);

  TotpTotp algorithm(String? algorithm);

  TotpTotp digits(int? digits);

  TotpTotp period(int? period);

  TotpTotp offset(int? offset);

  TotpTotp secret(String? secret);

  TotpTotp codes(List<int>? codes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TotpTotp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TotpTotp(...).copyWith(id: 12, name: "My name")
  /// ````
  TotpTotp call({
    String? type,
    String? account,
    String? issuer,
    String? algorithm,
    int? digits,
    int? period,
    int? offset,
    String? secret,
    List<int>? codes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTotpTotp.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTotpTotp.copyWith.fieldName(...)`
class _$TotpTotpCWProxyImpl implements _$TotpTotpCWProxy {
  const _$TotpTotpCWProxyImpl(this._value);

  final TotpTotp _value;

  @override
  TotpTotp type(String? type) => this(type: type);

  @override
  TotpTotp account(String? account) => this(account: account);

  @override
  TotpTotp issuer(String? issuer) => this(issuer: issuer);

  @override
  TotpTotp algorithm(String? algorithm) => this(algorithm: algorithm);

  @override
  TotpTotp digits(int? digits) => this(digits: digits);

  @override
  TotpTotp period(int? period) => this(period: period);

  @override
  TotpTotp offset(int? offset) => this(offset: offset);

  @override
  TotpTotp secret(String? secret) => this(secret: secret);

  @override
  TotpTotp codes(List<int>? codes) => this(codes: codes);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TotpTotp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TotpTotp(...).copyWith(id: 12, name: "My name")
  /// ````
  TotpTotp call({
    Object? type = const $CopyWithPlaceholder(),
    Object? account = const $CopyWithPlaceholder(),
    Object? issuer = const $CopyWithPlaceholder(),
    Object? algorithm = const $CopyWithPlaceholder(),
    Object? digits = const $CopyWithPlaceholder(),
    Object? period = const $CopyWithPlaceholder(),
    Object? offset = const $CopyWithPlaceholder(),
    Object? secret = const $CopyWithPlaceholder(),
    Object? codes = const $CopyWithPlaceholder(),
  }) {
    return TotpTotp(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      account: account == const $CopyWithPlaceholder()
          ? _value.account
          // ignore: cast_nullable_to_non_nullable
          : account as String?,
      issuer: issuer == const $CopyWithPlaceholder()
          ? _value.issuer
          // ignore: cast_nullable_to_non_nullable
          : issuer as String?,
      algorithm: algorithm == const $CopyWithPlaceholder()
          ? _value.algorithm
          // ignore: cast_nullable_to_non_nullable
          : algorithm as String?,
      digits: digits == const $CopyWithPlaceholder()
          ? _value.digits
          // ignore: cast_nullable_to_non_nullable
          : digits as int?,
      period: period == const $CopyWithPlaceholder()
          ? _value.period
          // ignore: cast_nullable_to_non_nullable
          : period as int?,
      offset: offset == const $CopyWithPlaceholder()
          ? _value.offset
          // ignore: cast_nullable_to_non_nullable
          : offset as int?,
      secret: secret == const $CopyWithPlaceholder()
          ? _value.secret
          // ignore: cast_nullable_to_non_nullable
          : secret as String?,
      codes: codes == const $CopyWithPlaceholder()
          ? _value.codes
          // ignore: cast_nullable_to_non_nullable
          : codes as List<int>?,
    );
  }
}

extension $TotpTotpCopyWith on TotpTotp {
  /// Returns a callable class that can be used as follows: `instanceOfTotpTotp.copyWith(...)` or like so:`instanceOfTotpTotp.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TotpTotpCWProxy get copyWith => _$TotpTotpCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotpTotp _$TotpTotpFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TotpTotp', json, ($checkedConvert) {
      final val = TotpTotp(
        type: $checkedConvert('type', (v) => v as String?),
        account: $checkedConvert('account', (v) => v as String?),
        issuer: $checkedConvert('issuer', (v) => v as String?),
        algorithm: $checkedConvert('algorithm', (v) => v as String?),
        digits: $checkedConvert('digits', (v) => (v as num?)?.toInt()),
        period: $checkedConvert('period', (v) => (v as num?)?.toInt()),
        offset: $checkedConvert('offset', (v) => (v as num?)?.toInt()),
        secret: $checkedConvert('secret', (v) => v as String?),
        codes: $checkedConvert(
          'codes',
          (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TotpTotpToJson(TotpTotp instance) => <String, dynamic>{
  'type': ?instance.type,
  'account': ?instance.account,
  'issuer': ?instance.issuer,
  'algorithm': ?instance.algorithm,
  'digits': ?instance.digits,
  'period': ?instance.period,
  'offset': ?instance.offset,
  'secret': ?instance.secret,
  'codes': ?instance.codes,
};
