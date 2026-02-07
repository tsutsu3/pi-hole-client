// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_app200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddApp200ResponseCWProxy {
  AddApp200Response app(AppApp? app);

  AddApp200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddApp200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddApp200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddApp200Response call({AppApp? app, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddApp200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddApp200Response.copyWith.fieldName(...)`
class _$AddApp200ResponseCWProxyImpl implements _$AddApp200ResponseCWProxy {
  const _$AddApp200ResponseCWProxyImpl(this._value);

  final AddApp200Response _value;

  @override
  AddApp200Response app(AppApp? app) => this(app: app);

  @override
  AddApp200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddApp200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddApp200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddApp200Response call({
    Object? app = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return AddApp200Response(
      app: app == const $CopyWithPlaceholder()
          ? _value.app
          // ignore: cast_nullable_to_non_nullable
          : app as AppApp?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $AddApp200ResponseCopyWith on AddApp200Response {
  /// Returns a callable class that can be used as follows: `instanceOfAddApp200Response.copyWith(...)` or like so:`instanceOfAddApp200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddApp200ResponseCWProxy get copyWith =>
      _$AddApp200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddApp200Response _$AddApp200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddApp200Response', json, ($checkedConvert) {
      final val = AddApp200Response(
        app: $checkedConvert(
          'app',
          (v) => v == null ? null : AppApp.fromJson(v as Map<String, dynamic>),
        ),
        took: $checkedConvert('took', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$AddApp200ResponseToJson(AddApp200Response instance) =>
    <String, dynamic>{'app': ?instance.app?.toJson(), 'took': ?instance.took};
