// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleporter_post.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TeleporterPostCWProxy {
  TeleporterPost processed(List<String>? processed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TeleporterPost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TeleporterPost(...).copyWith(id: 12, name: "My name")
  /// ````
  TeleporterPost call({List<String>? processed});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTeleporterPost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTeleporterPost.copyWith.fieldName(...)`
class _$TeleporterPostCWProxyImpl implements _$TeleporterPostCWProxy {
  const _$TeleporterPostCWProxyImpl(this._value);

  final TeleporterPost _value;

  @override
  TeleporterPost processed(List<String>? processed) =>
      this(processed: processed);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TeleporterPost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TeleporterPost(...).copyWith(id: 12, name: "My name")
  /// ````
  TeleporterPost call({Object? processed = const $CopyWithPlaceholder()}) {
    return TeleporterPost(
      processed: processed == const $CopyWithPlaceholder()
          ? _value.processed
          // ignore: cast_nullable_to_non_nullable
          : processed as List<String>?,
    );
  }
}

extension $TeleporterPostCopyWith on TeleporterPost {
  /// Returns a callable class that can be used as follows: `instanceOfTeleporterPost.copyWith(...)` or like so:`instanceOfTeleporterPost.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TeleporterPostCWProxy get copyWith => _$TeleporterPostCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeleporterPost _$TeleporterPostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TeleporterPost', json, ($checkedConvert) {
      final val = TeleporterPost(
        processed: $checkedConvert(
          'processed',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TeleporterPostToJson(TeleporterPost instance) =>
    <String, dynamic>{'processed': ?instance.processed};
