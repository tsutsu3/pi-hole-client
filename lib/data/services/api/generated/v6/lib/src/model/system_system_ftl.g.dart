// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_system_ftl.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SystemSystemFtlCWProxy {
  SystemSystemFtl percentMem(num? percentMem);

  SystemSystemFtl percentCpu(num? percentCpu);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemFtl(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemFtl(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemFtl call({num? percentMem, num? percentCpu});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSystemSystemFtl.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSystemSystemFtl.copyWith.fieldName(...)`
class _$SystemSystemFtlCWProxyImpl implements _$SystemSystemFtlCWProxy {
  const _$SystemSystemFtlCWProxyImpl(this._value);

  final SystemSystemFtl _value;

  @override
  SystemSystemFtl percentMem(num? percentMem) => this(percentMem: percentMem);

  @override
  SystemSystemFtl percentCpu(num? percentCpu) => this(percentCpu: percentCpu);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemFtl(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemFtl(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemFtl call({
    Object? percentMem = const $CopyWithPlaceholder(),
    Object? percentCpu = const $CopyWithPlaceholder(),
  }) {
    return SystemSystemFtl(
      percentMem: percentMem == const $CopyWithPlaceholder()
          ? _value.percentMem
          // ignore: cast_nullable_to_non_nullable
          : percentMem as num?,
      percentCpu: percentCpu == const $CopyWithPlaceholder()
          ? _value.percentCpu
          // ignore: cast_nullable_to_non_nullable
          : percentCpu as num?,
    );
  }
}

extension $SystemSystemFtlCopyWith on SystemSystemFtl {
  /// Returns a callable class that can be used as follows: `instanceOfSystemSystemFtl.copyWith(...)` or like so:`instanceOfSystemSystemFtl.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SystemSystemFtlCWProxy get copyWith => _$SystemSystemFtlCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemSystemFtl _$SystemSystemFtlFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SystemSystemFtl',
      json,
      ($checkedConvert) {
        final val = SystemSystemFtl(
          percentMem: $checkedConvert('%mem', (v) => v as num?),
          percentCpu: $checkedConvert('%cpu', (v) => v as num?),
        );
        return val;
      },
      fieldKeyMap: const {'percentMem': '%mem', 'percentCpu': '%cpu'},
    );

Map<String, dynamic> _$SystemSystemFtlToJson(SystemSystemFtl instance) =>
    <String, dynamic>{
      '%mem': ?instance.percentMem,
      '%cpu': ?instance.percentCpu,
    };
