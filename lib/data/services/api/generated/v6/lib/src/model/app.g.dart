// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppCWProxy {
  App app(AppApp? app);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `App(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// App(...).copyWith(id: 12, name: "My name")
  /// ````
  App call({AppApp? app});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfApp.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfApp.copyWith.fieldName(...)`
class _$AppCWProxyImpl implements _$AppCWProxy {
  const _$AppCWProxyImpl(this._value);

  final App _value;

  @override
  App app(AppApp? app) => this(app: app);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `App(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// App(...).copyWith(id: 12, name: "My name")
  /// ````
  App call({Object? app = const $CopyWithPlaceholder()}) {
    return App(
      app: app == const $CopyWithPlaceholder()
          ? _value.app
          // ignore: cast_nullable_to_non_nullable
          : app as AppApp?,
    );
  }
}

extension $AppCopyWith on App {
  /// Returns a callable class that can be used as follows: `instanceOfApp.copyWith(...)` or like so:`instanceOfApp.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppCWProxy get copyWith => _$AppCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$AppFromJson(Map<String, dynamic> json) =>
    $checkedCreate('App', json, ($checkedConvert) {
      final val = App(
        app: $checkedConvert(
          'app',
          (v) => v == null ? null : AppApp.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
  'app': ?instance.app?.toJson(),
};
