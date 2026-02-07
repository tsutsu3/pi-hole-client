// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestions_suggestions.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SuggestionsSuggestionsCWProxy {
  SuggestionsSuggestions domain(List<String>? domain);

  SuggestionsSuggestions clientIp(List<String>? clientIp);

  SuggestionsSuggestions clientName(List<String>? clientName);

  SuggestionsSuggestions upstream(List<String>? upstream);

  SuggestionsSuggestions type(List<String>? type);

  SuggestionsSuggestions status(List<String>? status);

  SuggestionsSuggestions reply(List<String>? reply);

  SuggestionsSuggestions dnssec(List<String>? dnssec);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SuggestionsSuggestions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SuggestionsSuggestions(...).copyWith(id: 12, name: "My name")
  /// ````
  SuggestionsSuggestions call({
    List<String>? domain,
    List<String>? clientIp,
    List<String>? clientName,
    List<String>? upstream,
    List<String>? type,
    List<String>? status,
    List<String>? reply,
    List<String>? dnssec,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSuggestionsSuggestions.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSuggestionsSuggestions.copyWith.fieldName(...)`
class _$SuggestionsSuggestionsCWProxyImpl
    implements _$SuggestionsSuggestionsCWProxy {
  const _$SuggestionsSuggestionsCWProxyImpl(this._value);

  final SuggestionsSuggestions _value;

  @override
  SuggestionsSuggestions domain(List<String>? domain) => this(domain: domain);

  @override
  SuggestionsSuggestions clientIp(List<String>? clientIp) =>
      this(clientIp: clientIp);

  @override
  SuggestionsSuggestions clientName(List<String>? clientName) =>
      this(clientName: clientName);

  @override
  SuggestionsSuggestions upstream(List<String>? upstream) =>
      this(upstream: upstream);

  @override
  SuggestionsSuggestions type(List<String>? type) => this(type: type);

  @override
  SuggestionsSuggestions status(List<String>? status) => this(status: status);

  @override
  SuggestionsSuggestions reply(List<String>? reply) => this(reply: reply);

  @override
  SuggestionsSuggestions dnssec(List<String>? dnssec) => this(dnssec: dnssec);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SuggestionsSuggestions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SuggestionsSuggestions(...).copyWith(id: 12, name: "My name")
  /// ````
  SuggestionsSuggestions call({
    Object? domain = const $CopyWithPlaceholder(),
    Object? clientIp = const $CopyWithPlaceholder(),
    Object? clientName = const $CopyWithPlaceholder(),
    Object? upstream = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? reply = const $CopyWithPlaceholder(),
    Object? dnssec = const $CopyWithPlaceholder(),
  }) {
    return SuggestionsSuggestions(
      domain: domain == const $CopyWithPlaceholder()
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as List<String>?,
      clientIp: clientIp == const $CopyWithPlaceholder()
          ? _value.clientIp
          // ignore: cast_nullable_to_non_nullable
          : clientIp as List<String>?,
      clientName: clientName == const $CopyWithPlaceholder()
          ? _value.clientName
          // ignore: cast_nullable_to_non_nullable
          : clientName as List<String>?,
      upstream: upstream == const $CopyWithPlaceholder()
          ? _value.upstream
          // ignore: cast_nullable_to_non_nullable
          : upstream as List<String>?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as List<String>?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as List<String>?,
      reply: reply == const $CopyWithPlaceholder()
          ? _value.reply
          // ignore: cast_nullable_to_non_nullable
          : reply as List<String>?,
      dnssec: dnssec == const $CopyWithPlaceholder()
          ? _value.dnssec
          // ignore: cast_nullable_to_non_nullable
          : dnssec as List<String>?,
    );
  }
}

extension $SuggestionsSuggestionsCopyWith on SuggestionsSuggestions {
  /// Returns a callable class that can be used as follows: `instanceOfSuggestionsSuggestions.copyWith(...)` or like so:`instanceOfSuggestionsSuggestions.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SuggestionsSuggestionsCWProxy get copyWith =>
      _$SuggestionsSuggestionsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionsSuggestions _$SuggestionsSuggestionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SuggestionsSuggestions',
  json,
  ($checkedConvert) {
    final val = SuggestionsSuggestions(
      domain: $checkedConvert(
        'domain',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      clientIp: $checkedConvert(
        'client_ip',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      clientName: $checkedConvert(
        'client_name',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      upstream: $checkedConvert(
        'upstream',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      type: $checkedConvert(
        'type',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      status: $checkedConvert(
        'status',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      reply: $checkedConvert(
        'reply',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      dnssec: $checkedConvert(
        'dnssec',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'clientIp': 'client_ip', 'clientName': 'client_name'},
);

Map<String, dynamic> _$SuggestionsSuggestionsToJson(
  SuggestionsSuggestions instance,
) => <String, dynamic>{
  'domain': ?instance.domain,
  'client_ip': ?instance.clientIp,
  'client_name': ?instance.clientName,
  'upstream': ?instance.upstream,
  'type': ?instance.type,
  'status': ?instance.status,
  'reply': ?instance.reply,
  'dnssec': ?instance.dnssec,
};
