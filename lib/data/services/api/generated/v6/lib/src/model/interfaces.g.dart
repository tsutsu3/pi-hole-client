// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interfaces.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InterfacesCWProxy {
  Interfaces interfaces(List<InterfacesInterfacesInner>? interfaces);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Interfaces(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Interfaces(...).copyWith(id: 12, name: "My name")
  /// ````
  Interfaces call({List<InterfacesInterfacesInner>? interfaces});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInterfaces.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInterfaces.copyWith.fieldName(...)`
class _$InterfacesCWProxyImpl implements _$InterfacesCWProxy {
  const _$InterfacesCWProxyImpl(this._value);

  final Interfaces _value;

  @override
  Interfaces interfaces(List<InterfacesInterfacesInner>? interfaces) =>
      this(interfaces: interfaces);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Interfaces(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Interfaces(...).copyWith(id: 12, name: "My name")
  /// ````
  Interfaces call({Object? interfaces = const $CopyWithPlaceholder()}) {
    return Interfaces(
      interfaces: interfaces == const $CopyWithPlaceholder()
          ? _value.interfaces
          // ignore: cast_nullable_to_non_nullable
          : interfaces as List<InterfacesInterfacesInner>?,
    );
  }
}

extension $InterfacesCopyWith on Interfaces {
  /// Returns a callable class that can be used as follows: `instanceOfInterfaces.copyWith(...)` or like so:`instanceOfInterfaces.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InterfacesCWProxy get copyWith => _$InterfacesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Interfaces _$InterfacesFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Interfaces',
  json,
  ($checkedConvert) {
    final val = Interfaces(
      interfaces: $checkedConvert(
        'interfaces',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  InterfacesInterfacesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$InterfacesToJson(Interfaces instance) =>
    <String, dynamic>{
      'interfaces': ?instance.interfaces?.map((e) => e.toJson()).toList(),
    };
