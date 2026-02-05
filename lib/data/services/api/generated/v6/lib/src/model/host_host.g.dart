// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_host.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HostHostCWProxy {
  HostHost uname(HostHostUname? uname);

  HostHost model(String? model);

  HostHost dmi(HostHostDmi? dmi);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHost(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHost call({HostHostUname? uname, String? model, HostHostDmi? dmi});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHostHost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHostHost.copyWith.fieldName(...)`
class _$HostHostCWProxyImpl implements _$HostHostCWProxy {
  const _$HostHostCWProxyImpl(this._value);

  final HostHost _value;

  @override
  HostHost uname(HostHostUname? uname) => this(uname: uname);

  @override
  HostHost model(String? model) => this(model: model);

  @override
  HostHost dmi(HostHostDmi? dmi) => this(dmi: dmi);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHost(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHost call({
    Object? uname = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? dmi = const $CopyWithPlaceholder(),
  }) {
    return HostHost(
      uname: uname == const $CopyWithPlaceholder()
          ? _value.uname
          // ignore: cast_nullable_to_non_nullable
          : uname as HostHostUname?,
      model: model == const $CopyWithPlaceholder()
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as String?,
      dmi: dmi == const $CopyWithPlaceholder()
          ? _value.dmi
          // ignore: cast_nullable_to_non_nullable
          : dmi as HostHostDmi?,
    );
  }
}

extension $HostHostCopyWith on HostHost {
  /// Returns a callable class that can be used as follows: `instanceOfHostHost.copyWith(...)` or like so:`instanceOfHostHost.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HostHostCWProxy get copyWith => _$HostHostCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostHost _$HostHostFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('HostHost', json, ($checkedConvert) {
  final val = HostHost(
    uname: $checkedConvert(
      'uname',
      (v) =>
          v == null ? null : HostHostUname.fromJson(v as Map<String, dynamic>),
    ),
    model: $checkedConvert('model', (v) => v as String?),
    dmi: $checkedConvert(
      'dmi',
      (v) => v == null ? null : HostHostDmi.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$HostHostToJson(HostHost instance) => <String, dynamic>{
  'uname': ?instance.uname?.toJson(),
  'model': ?instance.model,
  'dmi': ?instance.dmi?.toJson(),
};
