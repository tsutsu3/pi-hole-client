// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_host_dmi.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HostHostDmiCWProxy {
  HostHostDmi bios(HostHostDmiBios? bios);

  HostHostDmi board(HostHostDmiBoard? board);

  HostHostDmi product(HostHostDmiProduct? product);

  HostHostDmi sys(HostHostDmiSys? sys);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostDmi(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostDmi(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostDmi call({
    HostHostDmiBios? bios,
    HostHostDmiBoard? board,
    HostHostDmiProduct? product,
    HostHostDmiSys? sys,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHostHostDmi.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHostHostDmi.copyWith.fieldName(...)`
class _$HostHostDmiCWProxyImpl implements _$HostHostDmiCWProxy {
  const _$HostHostDmiCWProxyImpl(this._value);

  final HostHostDmi _value;

  @override
  HostHostDmi bios(HostHostDmiBios? bios) => this(bios: bios);

  @override
  HostHostDmi board(HostHostDmiBoard? board) => this(board: board);

  @override
  HostHostDmi product(HostHostDmiProduct? product) => this(product: product);

  @override
  HostHostDmi sys(HostHostDmiSys? sys) => this(sys: sys);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostDmi(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostDmi(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostDmi call({
    Object? bios = const $CopyWithPlaceholder(),
    Object? board = const $CopyWithPlaceholder(),
    Object? product = const $CopyWithPlaceholder(),
    Object? sys = const $CopyWithPlaceholder(),
  }) {
    return HostHostDmi(
      bios: bios == const $CopyWithPlaceholder()
          ? _value.bios
          // ignore: cast_nullable_to_non_nullable
          : bios as HostHostDmiBios?,
      board: board == const $CopyWithPlaceholder()
          ? _value.board
          // ignore: cast_nullable_to_non_nullable
          : board as HostHostDmiBoard?,
      product: product == const $CopyWithPlaceholder()
          ? _value.product
          // ignore: cast_nullable_to_non_nullable
          : product as HostHostDmiProduct?,
      sys: sys == const $CopyWithPlaceholder()
          ? _value.sys
          // ignore: cast_nullable_to_non_nullable
          : sys as HostHostDmiSys?,
    );
  }
}

extension $HostHostDmiCopyWith on HostHostDmi {
  /// Returns a callable class that can be used as follows: `instanceOfHostHostDmi.copyWith(...)` or like so:`instanceOfHostHostDmi.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HostHostDmiCWProxy get copyWith => _$HostHostDmiCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostHostDmi _$HostHostDmiFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HostHostDmi', json, ($checkedConvert) {
      final val = HostHostDmi(
        bios: $checkedConvert(
          'bios',
          (v) => v == null
              ? null
              : HostHostDmiBios.fromJson(v as Map<String, dynamic>),
        ),
        board: $checkedConvert(
          'board',
          (v) => v == null
              ? null
              : HostHostDmiBoard.fromJson(v as Map<String, dynamic>),
        ),
        product: $checkedConvert(
          'product',
          (v) => v == null
              ? null
              : HostHostDmiProduct.fromJson(v as Map<String, dynamic>),
        ),
        sys: $checkedConvert(
          'sys',
          (v) => v == null
              ? null
              : HostHostDmiSys.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$HostHostDmiToJson(HostHostDmi instance) =>
    <String, dynamic>{
      'bios': ?instance.bios?.toJson(),
      'board': ?instance.board?.toJson(),
      'product': ?instance.product?.toJson(),
      'sys': ?instance.sys?.toJson(),
    };
