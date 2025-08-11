import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/config/enums.dart';

part 'adlist.freezed.dart';
part 'adlist.g.dart';

@freezed
sealed class Adlist with _$Adlist {
  const factory Adlist({
    required String address,
    required String type, //TODO: enum
    required List<int> groups,
    required bool enabled,
    required int id,
    required DateTime dateAdded,
    required DateTime dateModified,
    required DateTime dateUpdated,
    required int number,
    required int invalidDomains,
    required int abpEntries,
    required ListsStatus status,
    String? comment,
  }) = _Adlist;

  factory Adlist.fromJson(Map<String, dynamic> json) => _$AdlistFromJson(json);
}
