import 'package:freezed_annotation/freezed_annotation.dart';

part 'routes.freezed.dart';
part 'routes.g.dart';

@freezed
sealed class Routes with _$Routes {
  const factory Routes({
    required List<RouteData> routes,
    required double took,
  }) = _Routes;

  factory Routes.fromJson(Map<String, dynamic> json) => _$RoutesFromJson(json);
}

@freezed
sealed class RouteData with _$RouteData {
  const factory RouteData({
    required int table,
    required String family,
    required String protocol,
    required String scope,
    required String type,
    required List<String> flags,
    required String dst,
    int? iflags,
    String? gateway,
    String? oif,
    String? iif,
    String? src,
    String? prefsrc,
    int? priority,
    int? pref,
    double? cstamp,
    double? tstamp,
    int? expires,
    int? error,
    int? used,
  }) = _RouteData;

  factory RouteData.fromJson(Map<String, dynamic> json) =>
      _$RouteDataFromJson(json);
}
