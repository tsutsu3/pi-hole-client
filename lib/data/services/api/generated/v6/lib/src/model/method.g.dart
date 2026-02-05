// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MethodCWProxy {
  Method method(String? method);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Method(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Method(...).copyWith(id: 12, name: "My name")
  /// ````
  Method call({String? method});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMethod.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMethod.copyWith.fieldName(...)`
class _$MethodCWProxyImpl implements _$MethodCWProxy {
  const _$MethodCWProxyImpl(this._value);

  final Method _value;

  @override
  Method method(String? method) => this(method: method);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Method(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Method(...).copyWith(id: 12, name: "My name")
  /// ````
  Method call({Object? method = const $CopyWithPlaceholder()}) {
    return Method(
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String?,
    );
  }
}

extension $MethodCopyWith on Method {
  /// Returns a callable class that can be used as follows: `instanceOfMethod.copyWith(...)` or like so:`instanceOfMethod.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MethodCWProxy get copyWith => _$MethodCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Method _$MethodFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Method',
  json,
  ($checkedConvert) {
    final val = Method(method: $checkedConvert('method', (v) => v as String?));
    return val;
  },
);

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
  'method': ?instance.method,
};
