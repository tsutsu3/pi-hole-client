import 'package:freezed_annotation/freezed_annotation.dart';

part 'upstreams.freezed.dart';
part 'upstreams.g.dart';

// @freezed
// sealed class Upstreams with _$Upstreams {
//   @JsonSerializable(explicitToJson: true)
//   const factory Upstreams({
//     required List<DestinationStat> forwardDestinations,
//     int? cursor,
//     int? recordsTotal,
//     int? recordsFiltered,
//   }) = _Upstreams;

//   factory Upstreams.fromJson(Map<String, dynamic> json) =>
//       _$UpstreamsFromJson(json);
// }

@freezed
sealed class DestinationStat with _$DestinationStat {
  const factory DestinationStat({
    required String destination,
    required double percentage,
  }) = _DestinationStat;

  factory DestinationStat.fromJson(Map<String, dynamic> json) =>
      _$DestinationStatFromJson(json);
}
