// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_metrics_dhcp.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetricsMetricsDhcpCWProxy {
  MetricsMetricsDhcp ack(int? ack);

  MetricsMetricsDhcp nak(int? nak);

  MetricsMetricsDhcp decline(int? decline);

  MetricsMetricsDhcp offer(int? offer);

  MetricsMetricsDhcp discover(int? discover);

  MetricsMetricsDhcp inform(int? inform);

  MetricsMetricsDhcp request(int? request);

  MetricsMetricsDhcp release(int? release);

  MetricsMetricsDhcp noanswer(int? noanswer);

  MetricsMetricsDhcp bootp(int? bootp);

  MetricsMetricsDhcp pxe(int? pxe);

  MetricsMetricsDhcp leases(MetricsMetricsDhcpLeases? leases);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDhcp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDhcp(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDhcp call({
    int? ack,
    int? nak,
    int? decline,
    int? offer,
    int? discover,
    int? inform,
    int? request,
    int? release,
    int? noanswer,
    int? bootp,
    int? pxe,
    MetricsMetricsDhcpLeases? leases,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMetricsMetricsDhcp.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMetricsMetricsDhcp.copyWith.fieldName(...)`
class _$MetricsMetricsDhcpCWProxyImpl implements _$MetricsMetricsDhcpCWProxy {
  const _$MetricsMetricsDhcpCWProxyImpl(this._value);

  final MetricsMetricsDhcp _value;

  @override
  MetricsMetricsDhcp ack(int? ack) => this(ack: ack);

  @override
  MetricsMetricsDhcp nak(int? nak) => this(nak: nak);

  @override
  MetricsMetricsDhcp decline(int? decline) => this(decline: decline);

  @override
  MetricsMetricsDhcp offer(int? offer) => this(offer: offer);

  @override
  MetricsMetricsDhcp discover(int? discover) => this(discover: discover);

  @override
  MetricsMetricsDhcp inform(int? inform) => this(inform: inform);

  @override
  MetricsMetricsDhcp request(int? request) => this(request: request);

  @override
  MetricsMetricsDhcp release(int? release) => this(release: release);

  @override
  MetricsMetricsDhcp noanswer(int? noanswer) => this(noanswer: noanswer);

  @override
  MetricsMetricsDhcp bootp(int? bootp) => this(bootp: bootp);

  @override
  MetricsMetricsDhcp pxe(int? pxe) => this(pxe: pxe);

  @override
  MetricsMetricsDhcp leases(MetricsMetricsDhcpLeases? leases) =>
      this(leases: leases);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDhcp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDhcp(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDhcp call({
    Object? ack = const $CopyWithPlaceholder(),
    Object? nak = const $CopyWithPlaceholder(),
    Object? decline = const $CopyWithPlaceholder(),
    Object? offer = const $CopyWithPlaceholder(),
    Object? discover = const $CopyWithPlaceholder(),
    Object? inform = const $CopyWithPlaceholder(),
    Object? request = const $CopyWithPlaceholder(),
    Object? release = const $CopyWithPlaceholder(),
    Object? noanswer = const $CopyWithPlaceholder(),
    Object? bootp = const $CopyWithPlaceholder(),
    Object? pxe = const $CopyWithPlaceholder(),
    Object? leases = const $CopyWithPlaceholder(),
  }) {
    return MetricsMetricsDhcp(
      ack: ack == const $CopyWithPlaceholder()
          ? _value.ack
          // ignore: cast_nullable_to_non_nullable
          : ack as int?,
      nak: nak == const $CopyWithPlaceholder()
          ? _value.nak
          // ignore: cast_nullable_to_non_nullable
          : nak as int?,
      decline: decline == const $CopyWithPlaceholder()
          ? _value.decline
          // ignore: cast_nullable_to_non_nullable
          : decline as int?,
      offer: offer == const $CopyWithPlaceholder()
          ? _value.offer
          // ignore: cast_nullable_to_non_nullable
          : offer as int?,
      discover: discover == const $CopyWithPlaceholder()
          ? _value.discover
          // ignore: cast_nullable_to_non_nullable
          : discover as int?,
      inform: inform == const $CopyWithPlaceholder()
          ? _value.inform
          // ignore: cast_nullable_to_non_nullable
          : inform as int?,
      request: request == const $CopyWithPlaceholder()
          ? _value.request
          // ignore: cast_nullable_to_non_nullable
          : request as int?,
      release: release == const $CopyWithPlaceholder()
          ? _value.release
          // ignore: cast_nullable_to_non_nullable
          : release as int?,
      noanswer: noanswer == const $CopyWithPlaceholder()
          ? _value.noanswer
          // ignore: cast_nullable_to_non_nullable
          : noanswer as int?,
      bootp: bootp == const $CopyWithPlaceholder()
          ? _value.bootp
          // ignore: cast_nullable_to_non_nullable
          : bootp as int?,
      pxe: pxe == const $CopyWithPlaceholder()
          ? _value.pxe
          // ignore: cast_nullable_to_non_nullable
          : pxe as int?,
      leases: leases == const $CopyWithPlaceholder()
          ? _value.leases
          // ignore: cast_nullable_to_non_nullable
          : leases as MetricsMetricsDhcpLeases?,
    );
  }
}

extension $MetricsMetricsDhcpCopyWith on MetricsMetricsDhcp {
  /// Returns a callable class that can be used as follows: `instanceOfMetricsMetricsDhcp.copyWith(...)` or like so:`instanceOfMetricsMetricsDhcp.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetricsMetricsDhcpCWProxy get copyWith =>
      _$MetricsMetricsDhcpCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsMetricsDhcp _$MetricsMetricsDhcpFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MetricsMetricsDhcp', json, ($checkedConvert) {
      final val = MetricsMetricsDhcp(
        ack: $checkedConvert('ack', (v) => (v as num?)?.toInt()),
        nak: $checkedConvert('nak', (v) => (v as num?)?.toInt()),
        decline: $checkedConvert('decline', (v) => (v as num?)?.toInt()),
        offer: $checkedConvert('offer', (v) => (v as num?)?.toInt()),
        discover: $checkedConvert('discover', (v) => (v as num?)?.toInt()),
        inform: $checkedConvert('inform', (v) => (v as num?)?.toInt()),
        request: $checkedConvert('request', (v) => (v as num?)?.toInt()),
        release: $checkedConvert('release', (v) => (v as num?)?.toInt()),
        noanswer: $checkedConvert('noanswer', (v) => (v as num?)?.toInt()),
        bootp: $checkedConvert('bootp', (v) => (v as num?)?.toInt()),
        pxe: $checkedConvert('pxe', (v) => (v as num?)?.toInt()),
        leases: $checkedConvert(
          'leases',
          (v) => v == null
              ? null
              : MetricsMetricsDhcpLeases.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MetricsMetricsDhcpToJson(MetricsMetricsDhcp instance) =>
    <String, dynamic>{
      'ack': ?instance.ack,
      'nak': ?instance.nak,
      'decline': ?instance.decline,
      'offer': ?instance.offer,
      'discover': ?instance.discover,
      'inform': ?instance.inform,
      'request': ?instance.request,
      'release': ?instance.release,
      'noanswer': ?instance.noanswer,
      'bootp': ?instance.bootp,
      'pxe': ?instance.pxe,
      'leases': ?instance.leases?.toJson(),
    };
